import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/l10n/index.dart';
import 'package:gallery_service/gallery_service.dart';
import 'package:routers_service/routers_service.dart';

import 'media/view/media.dart';

class AlbumPage extends StatelessWidget {
  AlbumPage({required this.albumPath, this.gallery})
      : galleryRepository = GalleryRepository(gallery: gallery);

  final String albumPath;
  final Gallery? gallery;
  final GalleryRepository galleryRepository;

  @override
  Widget build(BuildContext context) {
    final browserState = GalleryRouterStateScope.of(context)!.browserState!;
    return RepositoryProvider.value(
      value: galleryRepository,
      child: BlocProvider<GalleryBloc>(
        create: (context) => GalleryBloc(
          galleryRepository: galleryRepository,
        ),
        child: BlocListener<GalleryBloc, GalleryState>(
          listener: (context, state) async {
            switch (state.status) {
              case GalleryStatus.successPushed:
                assert(state.pushedGallery != null);
                final pushedGallery = state.pushedGallery!;
                final newState = browserState.rebuild(
                  (b) => b
                    ..galleriesHistory.add(pushedGallery.current)
                    ..gallery = pushedGallery.toBuilder(),
                );
                final newPath =
                    pushedGallery.current == RootPagePath.kRootPageLocation
                        ? const RootPagePath()
                        : AlbumPagePath(pushedGallery.current);
                GalleryRouterStateScope.of(context)!
                  ..routePath = newPath
                  ..browserState = newState;
                break;
              case GalleryStatus.successPopped:
                assert(state.poppedGallery != null);
                final poppedGallery = state.poppedGallery!;
                final newState = browserState.rebuild(
                  (b) => b
                    ..galleriesHistory.removeLast()
                    ..galleriesHistory.add(
                      poppedGallery.parent == null
                          ? RootPagePath.kRootPageLocation
                          : poppedGallery.current,
                    )
                    ..gallery = poppedGallery.toBuilder(),
                );
                final newPath = newState.galleriesHistory.last ==
                        RootPagePath.kRootPageLocation
                    ? const RootPagePath()
                    : AlbumPagePath(poppedGallery.current);
                GalleryRouterStateScope.of(context)!
                  ..routePath = newPath
                  ..browserState = newState;
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
                    .add(GetGalleryRequested(albumPath));
              }
              final onWillPop = () {
                if (state.gallery!.parent == null) return true;
                if (browserState.galleriesHistory.length > 1) {
                  final newState = browserState.rebuild((b) => b
                    ..galleriesHistory.removeLast()
                    ..gallery = null);
                  final lastGalleryPath = newState.galleriesHistory.last;
                  final newPath =
                      lastGalleryPath == RootPagePath.kRootPageLocation
                          ? const RootPagePath()
                          : AlbumPagePath(lastGalleryPath);
                  GalleryRouterStateScope.of(context)!
                    ..routePath = newPath
                    ..browserState = newState;
                } else if (browserState.galleriesHistory.length == 1) {
                  BlocProvider.of<GalleryBloc>(context)
                      .add(const GalleryPopRequested());
                }
                return false;
              };
              return WillPopScope(
                onWillPop: () async => onWillPop(),
                child: Scaffold(
                  appBar: AppBar(
                    title: Text(
                      state.gallery == null
                          ? GalleryLocalizations.of(context)!.loading
                          : state.gallery!.path,
                    ),
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerFloat,
                  floatingActionButton: state.gallery == null
                      ? null
                      : Wrap(
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 5.0,
                          runSpacing: 5.0,
                          children: [
                            if (state.gallery!.parent != null)
                              FloatingActionButton.extended(
                                heroTag: albumPath,
                                onPressed: () => onWillPop(),
                                icon: const BackButtonIcon(),
                                label: Text(
                                  MaterialLocalizations.of(context)
                                      .backButtonTooltip,
                                ),
                              ),
                            for (Album album in state.gallery!.albums)
                              FloatingActionButton.extended(
                                heroTag: UniqueKey,
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
                      if (state.gallery != null)
                        MediaWidget(medias: state.gallery!.medias.toList()),
                      if (state.status == GalleryStatus.loading)
                        const LinearProgressIndicator(
                            backgroundColor: Colors.transparent),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
