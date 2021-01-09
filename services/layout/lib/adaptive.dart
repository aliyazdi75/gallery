import 'dart:io';

import 'package:constants_service/constants_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:options_service/options_service.dart';

enum DesignType {
  material,
  cupertino,
}

enum DisplayType {
  desktop,
  mobile,
}

enum OrientationType {
  landscape,
  portrait,
}

enum SizeType {
  large,
  medium,
  small,
}

DesignType designTypeOf(BuildContext context) {
  if (kIsWeb) {
    return DesignType.material;
  } else if (Platform.isMacOS || Platform.isIOS) {
    return DesignType.cupertino;
  } else {
    return DesignType.material;
  }
}

DisplayType displayTypeOf(BuildContext context) {
  if (MediaQuery.of(context).size.shortestSide > desktopBreakpoint) {
    return DisplayType.desktop;
  } else {
    return DisplayType.mobile;
  }
}

OrientationType orientationTypeOf(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return OrientationType.landscape;
  } else {
    return OrientationType.portrait;
  }
}

SizeType sizeTypeOf(BuildContext context) {
  final platformWidth = MediaQuery.of(context).size.width;
  if (displayTypeOf(context) == DisplayType.desktop) {
    if (platformWidth > mediumDesktopMaxWidth) {
      return SizeType.large;
    } else if (platformWidth > smallDesktopMaxWidth) {
      return SizeType.medium;
    } else {
      return SizeType.small;
    }
  } else {
    if (platformWidth > mediumMobileMaxWidth) {
      return SizeType.large;
    } else if (platformWidth > smallMobileMaxWidth) {
      return SizeType.medium;
    } else {
      return SizeType.small;
    }
  }
}

bool get isMobile => Platform.isIOS || Platform.isAndroid;

bool get isDesktop =>
    kIsWeb ||
    Platform.isLinux ||
    Platform.isMacOS ||
    Platform.isWindows ||
    Platform.isFuchsia;

bool isLargeDisplay(BuildContext context) {
  return sizeTypeOf(context) == SizeType.large;
}

bool isMediumDisplay(BuildContext context) {
  return sizeTypeOf(context) == SizeType.medium;
}

bool isSmallDisplay(BuildContext context) {
  return sizeTypeOf(context) == SizeType.small;
}

bool isFarsiLocale(BuildContext context) {
  return GalleryOptions.of(context).locale?.languageCode == 'fa' ?? false;
}

class AdaptiveSize extends StatelessWidget {
  const AdaptiveSize({
    Key key,
    @required this.large,
    this.medium,
    this.small,
  })  : assert(medium != null || small != null,
            'Both medium and small widgets must not be null.'),
        super(key: key);

  final Widget large;
  final Widget medium;
  final Widget small;

  @override
  Widget build(BuildContext context) {
    final isMedium = isMediumDisplay(context);
    final isSmall = isSmallDisplay(context);
    return isSmall
        ? small ?? large
        : isMedium
            ? medium ?? large
            : large;
  }
}

class AdaptiveDesign extends StatelessWidget {
  const AdaptiveDesign({
    Key key,
    @required this.material,
    @required this.cupertino,
  }) : super(key: key);

  final Widget material;
  final Widget cupertino;

  @override
  Widget build(BuildContext context) {
    final materialDesign = designTypeOf(context) == DesignType.material;
    return materialDesign ? material : cupertino;
  }
}
