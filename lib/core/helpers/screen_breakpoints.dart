import 'package:responsive_framework/responsive_wrapper.dart';

class ScreenBreakpoints {
  static const List<ResponsiveBreakpoint>? breakpoints = [
    ResponsiveBreakpoint.resize(350, name: MOBILE),
    ResponsiveBreakpoint.autoScale(600, name: TABLET),
    ResponsiveBreakpoint.resize(800, name: DESKTOP),
    ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
  ];
}
