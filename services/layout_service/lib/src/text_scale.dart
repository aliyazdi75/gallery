import 'dart:math';

import 'package:flutter/material.dart';
import 'package:options_service/options_service.dart';

double _textScaleFactor(BuildContext context) {
  return GalleryOptions.of(context).textScaleFactor(context);
}

// When text is larger, this factor becomes larger, but at half the rate.
//
// | Text scaling | Text scale factor | reducedTextScale(context) |
// |--------------|-------------------|---------------------------|
// | Small        |               0.8 |                       1.0 |
// | Normal       |               1.0 |                       1.0 |
// | Large        |               2.0 |                       1.5 |
// | Huge         |               3.0 |                       2.0 |

double reducedTextScale(BuildContext context) {
  var textScaleFactor = _textScaleFactor(context);
  return textScaleFactor >= 1 ? (1 + textScaleFactor) / 2 : 1;
}

// When text is larger, this factor becomes larger at the same rate.
// But when text is smaller, this factor stays at 1.
//
// | Text scaling | Text scale factor |  cappedTextScale(context) |
// |--------------|-------------------|---------------------------|
// | Small        |               0.8 |                       1.0 |
// | Normal       |               1.0 |                       1.0 |
// | Large        |               2.0 |                       2.0 |
// | Huge         |               3.0 |                       3.0 |

double cappedTextScale(BuildContext context) {
  var textScaleFactor = _textScaleFactor(context);
  return max(textScaleFactor, 1);
}
