import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';
import 'package:gallery_service/gallery_service.dart';

import 'media/view/media.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage();

  static const String albumRoute = '/album';

  @override
  Widget build(BuildContext context) {
    final backButton = FloatingActionButton.extended(
      onPressed: () {
        BlocProvider.of<GalleryBloc>(context).add(const GalleryPopRequested());
        Navigator.of(context).pop();
      },
      icon: const BackButtonIcon(),
      label: Text(
        MaterialLocalizations.of(context).backButtonTooltip,
      ),
    );
    return BlocListener<GalleryBloc, GalleryState>(
      listener: (context, state) async {
        switch (state.status) {
          case GalleryStatus.success:
            if (state.galleriesViewed.length > 1) {
              await Navigator.of(context).pushNamed(
                  AlbumPage.albumRoute + '/' + state.galleriesViewed.last.path);
            }
            break;
          case GalleryStatus.failure:
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    GalleryLocalizations.of(context).galleryFailure,
                  ),
                ),
              );
            break;
          default:
            break;
        }
      },
      child: BlocBuilder<GalleryBloc, GalleryState>(
        builder: (context, state) {
          if (state.status == GalleryStatus.initial) {
            BlocProvider.of<GalleryBloc>(context)
                .add(const GalleryPushRequested(''));
          }
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: state.galleriesViewed.isEmpty
                ? null
                : state.galleriesViewed.last.albums.isEmpty
                    ? state.galleriesViewed.length == 1
                        ? null
                        : backButton
                    : Wrap(
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 5.0,
                        runSpacing: 5.0,
                        children: [
                          if (state.galleriesViewed.length > 1) backButton,
                          for (Album album in state.galleriesViewed.last.albums)
                            FloatingActionButton.extended(
                              heroTag: state.galleriesViewed.last.albums
                                  .indexOf(album),
                              onPressed: () {
                                context
                                    .read<GalleryBloc>()
                                    .add(GalleryPushRequested(album.path));
                              },
                              icon: const Icon(Icons.photo_album),
                              label: Text(
                                album.name,
                              ),
                            ),
                        ],
                      ),
            body: Stack(
              children: [
                if (state.status == GalleryStatus.loading)
                  const LinearProgressIndicator(
                      backgroundColor: Colors.transparent),
                if (state.galleriesViewed.isNotEmpty)
                  MediaWidget(medias: state.galleriesViewed.last.medias),
              ],
            ),
          );
        },
      ),
    );
  }
}
