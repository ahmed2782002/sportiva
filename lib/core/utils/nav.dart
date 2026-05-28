// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'constants/app_context.dart';

void navigateTo(Widget widget) => Navigator.push(
  AppContext.context,
  MaterialPageRoute(builder: (context) => widget),
);

void navigateBack({dynamic result}) =>
    Navigator.pop(AppContext.context, result);

void navigateReplacementTo(widget) => Navigator.pushReplacement(
  AppContext.context,
  MaterialPageRoute(builder: (context) => widget),
);

void navigateNamedTo(widget) => Navigator.pushNamed(AppContext.context, widget);

void navigateFinish(Widget widget) => Navigator.pushAndRemoveUntil(
  AppContext.context,
  MaterialPageRoute(builder: (context) => widget),
  (route) {
    return false;
  },
);
