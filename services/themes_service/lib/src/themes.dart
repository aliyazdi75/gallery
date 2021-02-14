import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout_service/layout_service.dart';

class GalleryThemeData {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static final ThemeData _lightThemeData = ThemeData.light();
  static final ThemeData _darkThemeData = ThemeData.dark();

  static ThemeData lightThemeData(BuildContext context) =>
      themeData(_lightThemeData, context, lightColorScheme, _lightFocusColor);

  static ThemeData darkThemeData(BuildContext context) =>
      themeData(_darkThemeData, context, darkColorScheme, _darkFocusColor);

  static CupertinoThemeData cupertinoLightThemeData =
      cupertinoThemeData(Brightness.light, lightColorScheme, _lightFocusColor);
  static CupertinoThemeData cupertinoDarkThemeData =
      cupertinoThemeData(Brightness.dark, darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ThemeData themeData, BuildContext context,
      ColorScheme colorScheme, Color focusColor) {
    return themeData.copyWith(
      colorScheme: colorScheme,
      textTheme: isFarsiLocale(context)
          ? _faTextTheme(themeData.textTheme, colorScheme.onPrimary)
          : _textTheme(themeData.textTheme, colorScheme.onPrimary),
      primaryTextTheme: isFarsiLocale(context)
          ? _faTextTheme(themeData.textTheme, colorScheme.onPrimary)
          : _textTheme(themeData.textTheme, colorScheme.onPrimary),
      appBarTheme: AppBarTheme(
        textTheme: isFarsiLocale(context)
            ? _faTextTheme(themeData.textTheme, colorScheme.onPrimary)
            : _textTheme(themeData.textTheme, colorScheme.onPrimary),
        color: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
        brightness: colorScheme.brightness,
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: colorScheme.primary,
      ),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        colorScheme: colorScheme,
      ),
      floatingActionButtonTheme: themeData.floatingActionButtonTheme
          .copyWith(foregroundColor: colorScheme.primary),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: colorScheme.primary),
      toggleableActiveColor: colorScheme.primary,
      indicatorColor: colorScheme.onPrimary,
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      accentColor: colorScheme.primary,
      focusColor: focusColor,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        contentTextStyle: isFarsiLocale(context)
            ? _faTextTheme(themeData.textTheme, colorScheme.onPrimary)
                .subtitle1!
                .copyWith(color: _darkFillColor)
            : _textTheme(themeData.textTheme, colorScheme.onPrimary)
                .subtitle1!
                .copyWith(color: _darkFillColor),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static CupertinoThemeData cupertinoThemeData(
      Brightness brightness, ColorScheme colorScheme, Color focusColor) {
    return CupertinoThemeData(
      brightness: brightness,
      primaryColor: colorScheme.primary,
      primaryContrastingColor: colorScheme.primaryVariant,
      barBackgroundColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
    );
  }

  static ColorScheme lightColorScheme = const ColorScheme.dark().copyWith(
    primary: const Color(0xFFB93C5D),
    primaryVariant: const Color(0xFF117378),
    secondary: const Color(0xFFEFF3F3),
    secondaryVariant: const Color(0xFFFAFBFB),
    background: const Color(0xFFE6EBEB),
    surface: const Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: const Color(0xFF322942),
    onSurface: const Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static ColorScheme darkColorScheme = const ColorScheme.light().copyWith(
    primary: const Color(0xFFFF8383),
    primaryVariant: const Color(0xFF1CDEC9),
    secondary: const Color(0xFF4D1F7C),
    secondaryVariant: const Color(0xFF451B6F),
    background: const Color(0xFF241E30),
    surface: const Color(0xFF1F1929),
    onBackground: Colors.white.withOpacity(0.05),
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static TextTheme _textTheme(TextTheme textTheme, Color color) {
    return textTheme
        .copyWith(
          bodyText1: GoogleFonts.montserrat(
            fontWeight: _regular,
            fontSize: 14.0,
            textStyle: textTheme.bodyText1,
          ),
          bodyText2: GoogleFonts.montserrat(
            fontWeight: _regular,
            fontSize: 16.0,
            textStyle: textTheme.bodyText2,
          ),
          headline4: GoogleFonts.montserrat(
            fontWeight: _bold,
            fontSize: 20.0,
            textStyle: textTheme.headline4,
          ),
          headline5: GoogleFonts.oswald(
            fontWeight: _medium,
            fontSize: 16.0,
            textStyle: textTheme.headline5,
          ),
          headline6: GoogleFonts.montserrat(
            fontWeight: _bold,
            fontSize: 16.0,
            textStyle: textTheme.headline6,
          ),
          subtitle1: GoogleFonts.montserrat(
            fontWeight: _medium,
            fontSize: 16.0,
            textStyle: textTheme.subtitle1,
          ),
          subtitle2: GoogleFonts.montserrat(
            fontWeight: _medium,
            fontSize: 14.0,
            textStyle: textTheme.subtitle2,
          ),
          caption: GoogleFonts.oswald(
            fontWeight: _semiBold,
            fontSize: 16.0,
            textStyle: textTheme.caption,
          ),
          overline: GoogleFonts.montserrat(
            fontWeight: _medium,
            fontSize: 12.0,
            textStyle: textTheme.overline,
          ),
          button: GoogleFonts.montserrat(
            fontWeight: _semiBold,
            fontSize: 14.0,
            textStyle: textTheme.button,
          ),
        )
        .apply(bodyColor: color);
  }

  static TextTheme _faTextTheme(TextTheme textTheme, Color color) {
    return textTheme
        .copyWith(
          bodyText1: textTheme.bodyText1!.copyWith(
            fontWeight: _regular,
            fontSize: 14.0,
            fontFamily: 'IRANSans-Regular',
          ),
          bodyText2: textTheme.bodyText2!.copyWith(
            fontWeight: _regular,
            fontSize: 15.0,
            fontFamily: 'IRANSans-Regular',
          ),
          headline4: textTheme.headline4!.copyWith(
            fontWeight: _bold,
            fontSize: 20.0,
            fontFamily: 'IRANSans-Bold',
          ),
          headline5: textTheme.headline5!.copyWith(
            fontWeight: _medium,
            fontSize: 16.0,
            fontFamily: 'IRANSans-Medium',
          ),
          headline6: textTheme.headline6!.copyWith(
            fontWeight: _bold,
            fontSize: 16.0,
            fontFamily: 'IRANSans-Bold',
          ),
          subtitle1: textTheme.subtitle1!.copyWith(
            fontWeight: _medium,
            fontSize: 16.0,
            fontFamily: 'IRANSans-Medium',
          ),
          subtitle2: textTheme.subtitle2!.copyWith(
            fontWeight: _medium,
            fontSize: 14.0,
            fontFamily: 'IRANSans-Medium',
          ),
          caption: textTheme.caption!.copyWith(
            fontWeight: _semiBold,
            fontSize: 16.0,
            fontFamily: 'IRANSans-SemiBold',
          ),
          overline: textTheme.overline!.copyWith(
            fontWeight: _medium,
            fontSize: 12.0,
            fontFamily: 'IRANSans-Medium',
          ),
          button: textTheme.button!.copyWith(
            fontWeight: _semiBold,
            fontSize: 14.0,
            fontFamily: 'IRANSans-Medium',
          ),
        )
        .apply(bodyColor: color);
  }
}
