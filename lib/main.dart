import 'package:account_service/account_service.dart';
import 'package:authentication_service/authentication_service.dart';
import 'package:constants_service/constants_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';
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
  //todo: should fix this
  // UrlStrategy.configure();
  runApp(GalleryAlumni());
}

class GalleryAlumni extends StatelessWidget {
  GalleryAlumni({
    Key key,
    this.initialRoute,
    this.isTestMode = false,
  }) : super(key: key);

  final bool isTestMode;
  final String initialRoute;

  final authenticationRepository = AuthenticationRepository();
  final accountRepository = AccountRepository();
  final galleryRepository = GalleryRepository();

  @override
  Widget build(BuildContext context) {
    return ModelBinding(
      initialModel: GalleryOptions(
        themeMode: ThemeMode.system,
        textScaleFactor: systemTextScaleFactorOption,
        // locale: Locale('fa'),
        // locale: null,
        platform: defaultTargetPlatform,
        isTestMode: isTestMode,
      ),
      child: Builder(
        builder: (context) {
          return MultiRepositoryProvider(
            providers: [
              RepositoryProvider.value(value: authenticationRepository),
              RepositoryProvider.value(value: accountRepository),
              RepositoryProvider.value(value: galleryRepository),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => AuthenticationBloc(
                    authenticationRepository: authenticationRepository,
                    accountRepository: accountRepository,
                  ),
                ),
                BlocProvider<GalleryBloc>(
                  create: (context) => GalleryBloc(
                    galleryRepository:
                        RepositoryProvider.of<GalleryRepository>(context),
                  ),
                  child: const AlbumPage(),
                ),
              ],
              child: AdaptiveDesign(
                material: MaterialApp(
                  title: galleryTitle,
                  onGenerateTitle: (context) =>
                      GalleryLocalizations.of(context).galleryTitle,
                  debugShowCheckedModeBanner: false,
                  themeMode: GalleryOptions.of(context).themeMode,
                  theme: GalleryThemeData.lightThemeData(context)
                      .copyWith(platform: GalleryOptions.of(context).platform),
                  darkTheme: GalleryThemeData.darkThemeData(context)
                      .copyWith(platform: GalleryOptions.of(context).platform),
                  localizationsDelegates:
                      GalleryLocalizations.localizationsDelegates,
                  initialRoute: initialRoute,
                  supportedLocales: GalleryLocalizations.supportedLocales,
                  locale: GalleryOptions.of(context).locale,
                  localeResolutionCallback: (locale, supportedLocales) {
                    deviceLocale = locale;
                    return locale;
                  },
                  onGenerateRoute: RouteConfiguration.onGenerateMaterialRoute,
                  builder: (context, child) {
                    return ApplyTextOptions(
                      child: AnnotatedRegion<SystemUiOverlayStyle>(
                        value: GalleryOptions.of(context)
                            .resolvedSystemUiOverlayStyle(context),
                        child: child,
                      ),
                    );
                  },
                ),
                cupertino: CupertinoApp(
                  title: galleryTitle,
                  onGenerateTitle: (context) =>
                      GalleryLocalizations.of(context).galleryTitle,
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
                  onGenerateRoute: RouteConfiguration.onGenerateCupertinoRoute,
                  builder: (context, child) {
                    return ApplyTextOptions(
                      child: AnnotatedRegion<SystemUiOverlayStyle>(
                        value: GalleryOptions.of(context)
                            .resolvedSystemUiOverlayStyle(context),
                        child: child,
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
  const RootPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlbumPage();
    // return const SplashPage();
  }
}
