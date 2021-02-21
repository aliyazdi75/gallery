import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullscreen_service/fullscreen_service.dart';
import 'package:gallery/l10n/index.dart';
import 'package:gallery_service/gallery_service.dart';

import 'image/image_fullscreen.dart';
import 'video/video_fullscreen.dart';

class MediaFullscreen extends StatefulWidget {
  MediaFullscreen({
    required this.albumPath,
    required this.mediaPath,
    this.media,
  });

  final String albumPath;
  final String mediaPath;
  final Media? media;

  @override
  _MediaFullscreenState createState() => _MediaFullscreenState();
}

class _MediaFullscreenState extends State<MediaFullscreen> {
  bool _isFullscreen = false;
  late final RequestFullscreen requestFullscreen;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    requestFullscreen = RequestFullscreen(
      onExit: _onExit,
      onEnter: _onEnter,
    );
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    RequestFullscreen().exitFullscreen();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.media != null) {
      return widget.media!.type == MediaType.image
          ? ImageFullscreen(
              albumPath: widget.albumPath,
              media: widget.media!,
            )
          : VideoFullscreen(
              media: widget.media!,
              isFullscreen: _isFullscreen,
              handleFullscreenButton: _handleFullscreenButton,
            );
    }
    final fullscreenRepository = FullscreenRepository();
    return RepositoryProvider<FullscreenRepository>.value(
      value: fullscreenRepository,
      child: BlocProvider<FullscreenBloc>(
        create: (_) =>
            FullscreenBloc(fullscreenRepository: fullscreenRepository),
        child: BlocListener<FullscreenBloc, FullscreenState>(
          listener: (context, state) async {
            switch (state.status) {
              case FullscreenStatus.success:
                break;
              case FullscreenStatus.failure:
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(
                        GalleryLocalizations.of(context)!.galleryFailure,
                      ),
                    ),
                  );
                break;
              default:
                break;
            }
          },
          child: BlocBuilder<FullscreenBloc, FullscreenState>(
            builder: (context, state) {
              if (state.status == FullscreenStatus.initial) {
                BlocProvider.of<FullscreenBloc>(context)
                    .add(FullscreenPushRequested(path: widget.mediaPath));
              }
              if (state.status == FullscreenStatus.success) {
                return state.media!.type == MediaType.image
                    ? ImageFullscreen(
                        albumPath: widget.albumPath,
                        media: state.media!,
                      )
                    : VideoFullscreen(
                        media: state.media!,
                        isFullscreen: _isFullscreen,
                        handleFullscreenButton: _handleFullscreenButton,
                      );
              }
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  title: const Text(
                    'Loading...',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                backgroundColor: Colors.black,
                body: Stack(
                  children: const [
                    LinearProgressIndicator(
                        backgroundColor: Colors.transparent),
                    Material(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _handleFullscreenButton() {
    if (_isFullscreen) {
      requestFullscreen.exitFullscreen();
    } else {
      requestFullscreen.requestFullscreen();
    }
  }

  void _onExit() {
    if (mounted) {
      setState(() => _isFullscreen = false);
    }
  }

  void _onEnter() {
    if (mounted) {
      setState(() => _isFullscreen = true);
    }
  }
}
