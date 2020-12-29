import 'package:ceit_alumni/blocs/gallery/bloc.dart';
import 'package:ceit_alumni/data/repositories/gallery/index.dart';
import 'package:ceit_alumni/presentation/layout/adaptive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/ceit_alumni_localizations.dart';

class HomePageArguments {
  const HomePageArguments({
    @required this.galleryRepository,
  }) : assert(galleryRepository != null);

  final GalleryRepository galleryRepository;
}

class HomePage extends StatelessWidget {
  const HomePage({
    @required this.galleryRepository,
  }) : assert(galleryRepository != null);

  final GalleryRepository galleryRepository;

  static const String homeRoute = '/home';

  @override
  Widget build(BuildContext context) {
    final adaptiveBody = MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: galleryRepository),
      ],
      child: BlocProvider<GalleryBloc>(
        create: (context) => GalleryBloc(
          galleryRepository: RepositoryProvider.of<GalleryRepository>(context),
        ),
        child: BlocListener<GalleryBloc, GalleryState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) async {
            switch (state.status) {
              case GalleryStatus.failure:
                Scaffold.of(context)
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
                context.bloc<GalleryBloc>().add(const GalleryRequested('kir'));
              }
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: 400.0,
                    height: 100.0,
                    child: state.status == GalleryStatus.success
                        ? PageView(
                            // controller:
                            //     context.bloc<GalleryBloc>().pageController,
                            children: state.gallery.images
                                .map(
                                  (image) => Card(
                                    child: Column(
                                      children: [
                                        Text(image.name),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        : const Card(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );

    return AdaptiveDesign(
      material: Scaffold(
        body: adaptiveBody,
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //   ],
        // ),
      ),
      cupertino: CupertinoPageScaffold(
        child: adaptiveBody,
      ),
    );
  }
}
