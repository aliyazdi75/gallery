import 'package:account_service/account_service.dart';
import 'package:authentication_service/authentication_service.dart';
import 'package:constants_service/constants_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/l10n/index.dart';
import 'package:gallery/presentation/routers/index.dart';
import 'package:gallery/presentation/screens/album/view/album.dart';
import 'package:gallery_service/gallery_service.dart';
import 'package:layout_service/layout_service.dart';
import 'package:options_service/options_service.dart';
import 'package:routers_service/routers_service.dart';
import 'package:themes_service/themes_service.dart';

void main() {
  // Do something when app faced an error on release
  FlutterError.onError = (details) {
    FlutterError.dumpErrorToConsole(details);
    // if (!kReleaseMode) {
    //   exit(1);
    // }
  };
  //todo: should fix this for build mode
  // UrlStrategy.configure();
  runApp(GalleryApp());
}

class GalleryApp extends StatefulWidget {
  GalleryApp({
    Key? key,
    this.isTestMode = false,
    this.initialRoute,
  }) : super(key: key);

  final bool isTestMode;
  final String? initialRoute;

  @override
  _GalleryAppState createState() => _GalleryAppState();
}

class _GalleryAppState extends State<GalleryApp> {
  final GalleryRouteInformationParser routeInformationParser =
      GalleryRouteInformationParser();
  final authenticationRepository = AuthenticationRepository();
  final accountRepository = AccountRepository();
  late final GalleryRouterDelegate routerDelegate;
  late final GalleryRoutersState routerState;

  @override
  void initState() {
    routerState = GalleryRoutersState();
    routerDelegate = GalleryRouterDelegate(routerState);
    super.initState();
  }

  @override
  void dispose() {
    routerDelegate.dispose();
    routerState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModelBinding(
      initialModel: GalleryOptions(
        themeMode: ThemeMode.system,
        textScaleFactor: systemTextScaleFactorOption,
        // locale: Locale('fa'),
        platform: defaultTargetPlatform,
        isTestMode: widget.isTestMode,
      ),
      child: Builder(
        builder: (context) {
          return MultiRepositoryProvider(
            providers: [
              RepositoryProvider.value(value: authenticationRepository),
              RepositoryProvider.value(value: accountRepository),
            ],
            child: BlocProvider(
              create: (_) => AuthenticationBloc(
                authenticationRepository: authenticationRepository,
                accountRepository: accountRepository,
              ),
              child: AdaptiveDesign(
                material: MaterialApp.router(
                  title: galleryTitle,
                  onGenerateTitle: (context) =>
                      GalleryLocalizations.of(context)!.galleryTitle,
                  debugShowCheckedModeBanner: false,
                  themeMode: GalleryOptions.of(context).themeMode,
                  theme: GalleryThemeData.lightThemeData(context)
                      .copyWith(platform: GalleryOptions.of(context).platform),
                  darkTheme: GalleryThemeData.darkThemeData(context)
                      .copyWith(platform: GalleryOptions.of(context).platform),
                  localizationsDelegates:
                      GalleryLocalizations.localizationsDelegates,
                  supportedLocales: GalleryLocalizations.supportedLocales,
                  locale: GalleryOptions.of(context).locale,
                  localeResolutionCallback: (locale, supportedLocales) {
                    deviceLocale = locale;
                    return locale;
                  },
                  routerDelegate: routerDelegate,
                  routeInformationParser: routeInformationParser,
                  builder: (context, child) {
                    return ApplyTextOptions(
                      child: AnnotatedRegion<SystemUiOverlayStyle>(
                        value: GalleryOptions.of(context)
                            .resolvedSystemUiOverlayStyle(context),
                        child: child!,
                      ),
                    );
                  },
                ),
                cupertino: CupertinoApp.router(
                  title: galleryTitle,
                  onGenerateTitle: (context) =>
                      GalleryLocalizations.of(context)!.galleryTitle,
                  debugShowCheckedModeBanner: false,
                  theme: MaterialBasedCupertinoThemeData(
                    materialTheme:
                        GalleryOptions.of(context).themeData(context),
                  ),
                  localizationsDelegates:
                      GalleryLocalizations.localizationsDelegates,
                  supportedLocales: GalleryLocalizations.supportedLocales,
                  locale: GalleryOptions.of(context).locale,
                  localeResolutionCallback: (locale, supportedLocales) {
                    deviceLocale = locale;
                    return locale;
                  },
                  routerDelegate: routerDelegate,
                  routeInformationParser: routeInformationParser,
                  builder: (context, child) {
                    return ApplyTextOptions(
                      child: AnnotatedRegion<SystemUiOverlayStyle>(
                        value: GalleryOptions.of(context)
                            .resolvedSystemUiOverlayStyle(context),
                        child: child!,
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RootPage extends StatelessWidget {
  RootPage({
    Key? key,
    required this.albumPath,
    this.gallery,
  }) : super(key: key);

  final String albumPath;
  final Gallery? gallery;

  @override
  Widget build(BuildContext context) {
    return AlbumPage(albumPath: albumPath, gallery: gallery);
    // return const SplashPage();
  }
}
