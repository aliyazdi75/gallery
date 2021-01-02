import 'package:ceit_alumni/data/constants/src/size.dart';
import 'package:ceit_alumni/presentation/themes/ceit_alumni_theme_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const systemLocaleOption = Locale('system');

Locale _deviceLocale;

Locale get deviceLocale => _deviceLocale;

set deviceLocale(Locale locale) {
  _deviceLocale ??= locale;
}

class CeitAlumniOptions {
  const CeitAlumniOptions({
    this.themeMode,
    double textScaleFactor,
    Locale locale,
    this.platform,
    this.isTestMode,
  })  : _textScaleFactor = textScaleFactor,
        _locale = locale;

  final ThemeMode themeMode;
  final double _textScaleFactor;
  final Locale _locale;
  final TargetPlatform platform;
  final bool isTestMode; // True for integration tests.

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

  Locale get locale => _locale ?? deviceLocale;

  /// Returns a [SystemUiOverlayStyle] based on the [ThemeMode] setting.
  /// In other words, if the theme is dark, returns light; if the theme is
  /// light, returns dark.
  SystemUiOverlayStyle resolvedSystemUiOverlayStyle(BuildContext context,
      {Color systemNavigationBarColor}) {
    Brightness brightness;
    switch (themeMode) {
      case ThemeMode.light:
        brightness = Brightness.light;
        break;
      case ThemeMode.dark:
        brightness = Brightness.dark;
        break;
      default:
        brightness = WidgetsBinding.instance.window.platformBrightness;
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
          ? CeitAlumniThemeData.lightThemeData(context)
              .copyWith(platform: CeitAlumniOptions.of(context).platform)
          : CeitAlumniThemeData.darkThemeData(context)
              .copyWith(platform: CeitAlumniOptions.of(context).platform);
    } else {
      return themeMode == ThemeMode.light
          ? CeitAlumniThemeData.lightThemeData(context)
              .copyWith(platform: CeitAlumniOptions.of(context).platform)
          : CeitAlumniThemeData.darkThemeData(context)
              .copyWith(platform: CeitAlumniOptions.of(context).platform);
    }
  }

  CeitAlumniOptions copyWith({
    ThemeMode themeMode,
    double textScaleFactor,
    Locale locale,
    TargetPlatform platform,
    bool isTestMode,
  }) {
    return CeitAlumniOptions(
      themeMode: themeMode ?? this.themeMode,
      textScaleFactor: textScaleFactor ?? _textScaleFactor,
      locale: locale ?? this.locale,
      platform: platform ?? this.platform,
      isTestMode: isTestMode ?? this.isTestMode,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is CeitAlumniOptions &&
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

  static CeitAlumniOptions of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>();
    return scope.modelBindingState.currentModel;
  }

  static void update(BuildContext context, CeitAlumniOptions newModel) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>();
    scope.modelBindingState.updateModel(newModel);
  }
}

// Applies text GalleryOptions to a widget
class ApplyTextOptions extends StatelessWidget {
  const ApplyTextOptions({@required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final options = CeitAlumniOptions.of(context);
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
    Key key,
    @required this.modelBindingState,
    Widget child,
  })  : assert(modelBindingState != null),
        super(key: key, child: child);

  final _ModelBindingState modelBindingState;

  @override
  bool updateShouldNotify(_ModelBindingScope oldWidget) => true;
}

class ModelBinding extends StatefulWidget {
  ModelBinding({
    Key key,
    this.initialModel = const CeitAlumniOptions(),
    this.child,
  })  : assert(initialModel != null),
        super(key: key);

  final CeitAlumniOptions initialModel;
  final Widget child;

  @override
  _ModelBindingState createState() => _ModelBindingState();
}

class _ModelBindingState extends State<ModelBinding> {
  CeitAlumniOptions currentModel;

  @override
  void initState() {
    super.initState();
    currentModel = widget.initialModel;
  }

  void updateModel(CeitAlumniOptions newModel) {
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
