import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gallery_service/gallery_service.dart';
import 'package:photo_view/photo_view.dart';

class ImageFullscreen extends StatelessWidget {
  ImageFullscreen({
    @required this.media,
  });

  final Media media;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const BackButtonIcon(),
        label: Text(
          MaterialLocalizations.of(context).backButtonTooltip,
        ),
      ),
      body: PhotoView(
        imageProvider: NetworkImage(media.url),
        heroAttributes: PhotoViewHeroAttributes(tag: media.thumbnail),
        minScale: PhotoViewComputedScale.contained,
      ),
    );
  }
}
