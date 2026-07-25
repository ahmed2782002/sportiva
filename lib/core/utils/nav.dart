import 'package:flutter/material.dart';
import 'constants/app_context.dart';

void navigateTo(Widget widget) => Navigator.push(
  AppContext.context,
  MaterialPageRoute(builder: (context) => widget),
);

void navigateBack({dynamic result}) =>
    Navigator.pop(AppContext.context, result);

void navigateReplacementTo(Widget widget) => Navigator.pushReplacement(
  AppContext.context,
  MaterialPageRoute(builder: (context) => widget),
);

void navigateNamedTo(String routeName) =>
    Navigator.pushNamed(AppContext.context, routeName);

void navigateFinish(Widget widget) => Navigator.pushAndRemoveUntil(
  AppContext.context,
  MaterialPageRoute(builder: (context) => widget),
  (route) => false,
);
