import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullscreen_service/fullscreen_service.dart';
import 'package:gallery/l10n/index.dart';
import 'package:gallery_service/gallery_service.dart';
import 'package:routers_service/routers_service.dart';

import 'image/image_fullscreen.dart';
import 'video/video_fullscreen.dart';

class MediaFullscreenPage extends StatefulWidget {
  MediaFullscreenPage({
    required this.albumPath,
    required this.mediaPath,
    this.media,
  });

  final String albumPath;
  final String mediaPath;
  final Media? media;

  @override
  _MediaFullscreenPageState createState() => _MediaFullscreenPageState();
}

class _MediaFullscreenPageState extends State<MediaFullscreenPage> {
  final fullscreenRepository = FullscreenRepository();
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
    return RepositoryProvider<FullscreenRepository>(
      create: (_) => fullscreenRepository,
      child: BlocProvider<FullscreenBloc>(
        create: (_) =>
            FullscreenBloc(fullscreenRepository: fullscreenRepository),
        child: BlocListener<FullscreenBloc, FullscreenState>(
          listener: (context, state) async {
            switch (state.status) {
              case FullscreenStatus.notFound:
                GalleryRouterStateScope.of(context)!
                  ..browserState = BrowserState.fromJson(<String, dynamic>{})
                  ..routePath = const UnknownPagePath();
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
                    .add(FullscreenPushRequested(widget.mediaPath));
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
                  title: Text(
                    GalleryLocalizations.of(context)!.loading,
                    style: const TextStyle(color: Colors.white),
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
