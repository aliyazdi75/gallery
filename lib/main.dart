import 'package:ceit_alumni/blocs/authentication/bloc.dart';
import 'package:ceit_alumni/blocs/gallery/bloc.dart';
import 'package:ceit_alumni/data/ceit_alumni_options.dart';
import 'package:ceit_alumni/data/constants/index.dart';
import 'package:ceit_alumni/data/repositories/account/index.dart';
import 'package:ceit_alumni/data/repositories/authentication/index.dart';
import 'package:ceit_alumni/presentation/layout/adaptive.dart';
import 'package:ceit_alumni/presentation/routers/routes.dart';
import 'package:ceit_alumni/presentation/screens/album/view/album.dart';
import 'package:ceit_alumni/presentation/themes/ceit_alumni_theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/ceit_alumni_localizations.dart';

import 'data/repositories/gallery/index.dart';

void main() {
  // Do something when app faced an error on release
  FlutterError.onError = (details) {
    FlutterError.dumpErrorToConsole(details);
    // if (!kReleaseMode) {
    //   exit(1);
    // }
  };
  runApp(CeitAlumni());
}

class CeitAlumni extends StatelessWidget {
  CeitAlumni({
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
      initialModel: CeitAlumniOptions(
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
                  title: ceitAlumniTitle,
                  onGenerateTitle: (context) =>
                      CeitAlumniLocalizations.of(context).ceitAlumniTitle,
                  debugShowCheckedModeBanner: false,
                  themeMode: CeitAlumniOptions.of(context).themeMode,
                  theme: CeitAlumniThemeData.lightThemeData(context).copyWith(
                      platform: CeitAlumniOptions.of(context).platform),
                  darkTheme: CeitAlumniThemeData.darkThemeData(context)
                      .copyWith(
                          platform: CeitAlumniOptions.of(context).platform),
                  localizationsDelegates:
                      CeitAlumniLocalizations.localizationsDelegates,
                  initialRoute: initialRoute,
                  supportedLocales: CeitAlumniLocalizations.supportedLocales,
                  locale: CeitAlumniOptions.of(context).locale,
                  localeResolutionCallback: (locale, supportedLocales) {
                    deviceLocale = locale;
                    return locale;
                  },
                  onGenerateRoute: RouteConfiguration.onGenerateMaterialRoute,
                  builder: (context, child) {
                    return ApplyTextOptions(
                      child: AnnotatedRegion<SystemUiOverlayStyle>(
                        value: CeitAlumniOptions.of(context)
                            .resolvedSystemUiOverlayStyle(context),
                        child: child,
                      ),
                    );
                  },
                ),
                cupertino: CupertinoApp(
                  title: ceitAlumniTitle,
                  onGenerateTitle: (context) =>
                      CeitAlumniLocalizations.of(context).ceitAlumniTitle,
                  debugShowCheckedModeBanner: false,
                  theme: MaterialBasedCupertinoThemeData(
                    materialTheme:
                        CeitAlumniOptions.of(context).themeData(context),
                  ),
                  localizationsDelegates:
                      CeitAlumniLocalizations.localizationsDelegates,
                  supportedLocales: CeitAlumniLocalizations.supportedLocales,
                  locale: CeitAlumniOptions.of(context).locale,
                  localeResolutionCallback: (locale, supportedLocales) {
                    deviceLocale = locale;
                    return locale;
                  },
                  onGenerateRoute: RouteConfiguration.onGenerateCupertinoRoute,
                  builder: (context, child) {
                    return ApplyTextOptions(
                      child: AnnotatedRegion<SystemUiOverlayStyle>(
                        value: CeitAlumniOptions.of(context)
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
