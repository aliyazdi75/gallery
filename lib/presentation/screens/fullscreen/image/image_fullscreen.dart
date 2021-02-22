import 'package:flutter/material.dart';
import 'package:gallery_service/gallery_service.dart';
import 'package:photo_view/photo_view.dart';

class ImageFullscreen extends StatelessWidget {
  ImageFullscreen({required this.albumPath, required this.media});

  final String albumPath;
  final Media media;

  //todo: change to InteractiveViewer widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        heroTag: albumPath,
        onPressed: () => Navigator.of(context).pop(),
        icon: const BackButtonIcon(),
        label: Text(
          MaterialLocalizations.of(context).backButtonTooltip,
        ),
      ),
      body: PhotoView(
        imageProvider: NetworkImage(media.thumbnail),
        heroAttributes: PhotoViewHeroAttributes(tag: media.path),
        minScale: PhotoViewComputedScale.contained,
      ),
    );
  }
}
