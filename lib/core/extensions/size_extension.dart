import 'dart:ui';

extension SizeExtension on Size {
  // Determine if the current device is in landscape or portrait mode.
  bool get isLandscape => width > height;
  bool get isPortrait => !isLandscape;

  // Arbitrarily determine if the current device is a tablet, mobile or desktop.
  bool get isTablet => shortestSide >= 600 && shortestSide < 1200;
  bool get isMobile => shortestSide < 600;
  bool get isDesktop => shortestSide >= 1200;
}