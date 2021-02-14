import 'package:constants_service/constants_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:themes_service/themes_service.dart';

const systemLocaleOption = Locale('system');

Locale? _deviceLocale;

Locale? get deviceLocale => _deviceLocale;

set deviceLocale(Locale? locale) {
  _deviceLocale ??= locale;
}

class GalleryOptions {
  const GalleryOptions({
    required this.themeMode,
    required this.platform,
    required this.isTestMode,
    required double textScaleFactor,
    Locale? locale,
  })  : _locale = locale,
        _textScaleFactor = textScaleFactor;

  final ThemeMode themeMode;
  final TargetPlatform platform;
  final bool isTestMode; // True for integration tests.
  final double _textScaleFactor;
  final Locale? _locale;

  // We use a sentinel value to indicate the system text scale option. By
  // default, return the actual text scale factor, otherwise return the
  // sentinel value.
  double textScaleFactor(BuildContext context, {bool useSentinel = false}) {
    if (_textScaleFactor == systemTextScaleFactorOption) {
      return useSentinel
          ? systemTextScaleFactorOption
          : MediaQuery.of(context).textScaleFactor;
    } else {
      return _textScaleFactor;
    }
  }

  Locale? get locale => _locale ?? deviceLocale;

  /// Returns a [SystemUiOverlayStyle] based on the [ThemeMode] setting.
  /// In other words, if the theme is dark, returns light; if the theme is
  /// light, returns dark.
  SystemUiOverlayStyle resolvedSystemUiOverlayStyle(BuildContext context,
      {Color? systemNavigationBarColor}) {
    Brightness brightness;
    switch (themeMode) {
      case ThemeMode.light:
        brightness = Brightness.light;
        break;
      case ThemeMode.dark:
        brightness = Brightness.dark;
        break;
      default:
        WidgetsFlutterBinding.ensureInitialized();
        brightness = WidgetsBinding.instance!.window.platformBrightness;
    }

    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final overlayStyle = SystemUiOverlayStyle(
      systemNavigationBarColor:
          systemNavigationBarColor ?? scaffoldBackgroundColor,
      systemNavigationBarIconBrightness:
          brightness == Brightness.dark ? Brightness.light : Brightness.dark,
    );

    return overlayStyle;
  }

  ThemeData themeData(BuildContext context) {
    if (themeMode == ThemeMode.system) {
      return MediaQuery.platformBrightnessOf(context) == Brightness.light
          ? GalleryThemeData.lightThemeData(context)
              .copyWith(platform: GalleryOptions.of(context).platform)
          : GalleryThemeData.darkThemeData(context)
              .copyWith(platform: GalleryOptions.of(context).platform);
    } else {
      return themeMode == ThemeMode.light
          ? GalleryThemeData.lightThemeData(context)
              .copyWith(platform: GalleryOptions.of(context).platform)
          : GalleryThemeData.darkThemeData(context)
              .copyWith(platform: GalleryOptions.of(context).platform);
    }
  }

  GalleryOptions copyWith({
    ThemeMode? themeMode,
    double? textScaleFactor,
    Locale? locale,
    TargetPlatform? platform,
    bool? isTestMode,
  }) {
    return GalleryOptions(
      themeMode: themeMode ?? this.themeMode,
      textScaleFactor: textScaleFactor ?? _textScaleFactor,
      locale: locale ?? this.locale,
      platform: platform ?? this.platform,
      isTestMode: isTestMode ?? this.isTestMode,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is GalleryOptions &&
      themeMode == other.themeMode &&
      _textScaleFactor == other._textScaleFactor &&
      locale == other.locale &&
      platform == other.platform &&
      isTestMode == other.isTestMode;

  @override
  int get hashCode => hashValues(
        themeMode,
        _textScaleFactor,
        locale,
        platform,
        isTestMode,
      );

  static GalleryOptions of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>();
    return scope!.modelBindingState.currentModel;
  }

  static void update(BuildContext context, GalleryOptions newModel) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>();
    scope!.modelBindingState.updateModel(newModel);
  }
}

class ApplyTextOptions extends StatelessWidget {
  const ApplyTextOptions({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final options = GalleryOptions.of(context);
    final textScaleFactor = options.textScaleFactor(context);

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: textScaleFactor,
      ),
      child: child,
    );
  }
}

class _ModelBindingScope extends InheritedWidget {
  _ModelBindingScope({
    Key? key,
    required this.modelBindingState,
    required Widget child,
  }) : super(key: key, child: child);

  final _ModelBindingState modelBindingState;

  @override
  bool updateShouldNotify(_ModelBindingScope oldWidget) => true;
}

class ModelBinding extends StatefulWidget {
  ModelBinding({
    Key? key,
    required this.initialModel,
    required this.child,
  }) : super(key: key);

  final GalleryOptions initialModel;
  final Widget child;

  @override
  _ModelBindingState createState() => _ModelBindingState();
}

class _ModelBindingState extends State<ModelBinding> {
  late final GalleryOptions currentModel;

  @override
  void initState() {
    super.initState();
    currentModel = widget.initialModel;
  }

  void updateModel(GalleryOptions newModel) {
    if (newModel != currentModel) {
      setState(() {
        currentModel = newModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _ModelBindingScope(
      modelBindingState: this,
      child: widget.child,
    );
  }
}
