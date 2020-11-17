import 'package:CatchTheGoal/core/constants/app/app_constants.dart';
import 'package:flutter/material.dart';

Widget text(var text,
    {var fontSize = ApplicationConstants.text_size_large_medium,
    textColor = Colors.green,
    var fontFamily = ApplicationConstants.font_regular,
    var isCentered = false,
    var maxLine = 1,
    var latterSpacing = 0.5}) {
  return Text(
    text,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: maxLine,
    style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: textColor,
        height: 1.5,
        letterSpacing: latterSpacing),
  );
}
