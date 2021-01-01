import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:photo_view/photo_view.dart';

class ImageFullscreen extends StatelessWidget {
  ImageFullscreen({
    @required this.url,
  });

  final String url;

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
        imageProvider: NetworkImage(url),
        heroAttributes: PhotoViewHeroAttributes(tag: url),
        minScale: PhotoViewComputedScale.contained,
      ),
    );
  }
}
