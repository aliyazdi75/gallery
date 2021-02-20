import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';
import 'package:gallery/presentation/screens/routers/index.dart';
import 'package:gallery_service/gallery_service.dart';

import 'media/view/media.dart';

class AlbumPage extends StatelessWidget {
  AlbumPage({required this.albumPath, required this.onRouteChanged});

  final String albumPath;
  final HandleRouteChangedFunction onRouteChanged;

  @override
  Widget build(BuildContext context) {
    return BlocListener<GalleryBloc, GalleryState>(
      listener: (context, state) async {
        switch (state.status) {
          case GalleryStatus.successPush:
            onRouteChanged(state.galleries.last.current);
            break;
          case GalleryStatus.successPop:
            onRouteChanged(
              state.galleries.last.current,
              isPop: true,
              isRoot: state.galleries.last.parent == null,
            );
            break;
          case GalleryStatus.failure:
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
      child: BlocBuilder<GalleryBloc, GalleryState>(
        builder: (context, state) {
          if (state.status == GalleryStatus.initial) {
            BlocProvider.of<GalleryBloc>(context)
                .add(GalleryPushRequested(albumPath));
          }
          final onWillPop = () {
            if (state.galleries.last.parent == null) return true;
            BlocProvider.of<GalleryBloc>(context)
                .add(const GalleryPopRequested());
            debugPrint('onWillPop');
            if (state.galleries.length > 1) {
              Navigator.of(context).pop();
            }
            return false;
          };
          return WillPopScope(
            onWillPop: () async => onWillPop(),
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  state.galleries.isEmpty
                      ? 'Loading...'
                      : state.galleries.last.path,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: state.galleries.isEmpty
                  ? null
                  : Wrap(
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 5.0,
                      runSpacing: 5.0,
                      children: [
                        if (state.galleries.last.parent != null)
                          FloatingActionButton.extended(
                            heroTag: albumPath,
                            onPressed: () => onWillPop(),
                            icon: const BackButtonIcon(),
                            label: Text(
                              MaterialLocalizations.of(context)
                                  .backButtonTooltip,
                            ),
                          ),
                        for (Album album in state.galleries.last.albums)
                          FloatingActionButton.extended(
                            heroTag: _DefaultHeroTag(),
                            onPressed: () {
                              context
                                  .read<GalleryBloc>()
                                  .add(GalleryPushRequested(album.path));
                            },
                            icon: const Icon(Icons.photo_album),
                            label: Text(album.name),
                          ),
                      ],
                    ),
              body: Stack(
                fit: StackFit.passthrough,
                children: [
                  if (state.galleries.isNotEmpty)
                    MediaWidget(
                      medias: state.galleries.last.medias.toList(),
                      onRouteChanged: onRouteChanged,
                    ),
                  if (state.status == GalleryStatus.loading)
                    const LinearProgressIndicator(
                        backgroundColor: Colors.transparent),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DefaultHeroTag {}
