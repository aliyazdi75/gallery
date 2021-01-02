import 'package:ceit_alumni/blocs/gallery/bloc.dart';
import 'package:ceit_alumni/data/models/gallery/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/ceit_alumni_localizations.dart';

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
                    CeitAlumniLocalizations.of(context).galleryFailure,
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
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (state.galleriesViewed.length > 1) backButton,
                          for (Album album in state.galleriesViewed.last.albums)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: FloatingActionButton.extended(
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
                            ),
                        ],
                      ),
            body: Stack(
              children: [
                if (state.status == GalleryStatus.loading)
                  const LinearProgressIndicator(
                      backgroundColor: Colors.transparent),
                if (state.status == GalleryStatus.success)
                  MediaWidget(medias: state.galleriesViewed.last.medias),
              ],
            ),
          );
        },
      ),
    );
  }
}
