import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery/core/request_fullscreen/index.dart';
import 'package:gallery_service/gallery_service.dart';

class MediaFullscreenArguments {
  const MediaFullscreenArguments({
    @required this.media,
  }) : assert(media != null);

  final Media media;
}

class MediaFullscreen extends StatefulWidget {
  MediaFullscreen({
    @required this.albumPath,
    @required this.fileName,
  })  : assert(albumPath != null),
        assert(fileName != null);

  final String albumPath;
  final String fileName;

  @override
  _MediaFullscreenState createState() => _MediaFullscreenState();
}

class _MediaFullscreenState extends State<MediaFullscreen> {
  bool _isFullscreen = false;
  RequestFullscreen _requestFullscreen;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    _requestFullscreen = RequestFullscreen(
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
    // return widget.media.type == MediaType.image
    //     ? ImageFullscreen(media: widget.media)
    //     : VideoFullscreen(
    //         media: widget.media,
    //         isFullscreen: _isFullscreen,
    //         handleFullscreenButton: _handleFullscreenButton,
    //       );
    return Container();
  }

  void _handleFullscreenButton() {
    if (_isFullscreen) {
      _requestFullscreen.exitFullscreen();
    } else {
      _requestFullscreen.requestFullscreen();
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
