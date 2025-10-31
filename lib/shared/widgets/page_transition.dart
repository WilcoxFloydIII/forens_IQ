import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage<void> platformTransition({
  required LocalKey key,
  required Widget child,
  required BuildContext context,
}) {
  final platform = Theme.of(context).platform;

  return CustomTransitionPage<void>(
    key: key,
    child: child,
    transitionDuration: _getTransitionDuration(platform),
    reverseTransitionDuration: _getTransitionDuration(platform),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return _buildTransition(platform, animation, secondaryAnimation, child);
    },
  );
}

Duration _getTransitionDuration(TargetPlatform platform) {
  switch (platform) {
    case TargetPlatform.iOS:
      return const Duration(milliseconds: 400);
    case TargetPlatform.android:
      return const Duration(milliseconds: 300);
    default:
      return const Duration(milliseconds: 300);
  }
}

Widget _buildTransition(
  TargetPlatform platform,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  switch (platform) {
    case TargetPlatform.iOS:
      // iOS-style slide from right
      return SlideTransition(
        position: animation.drive(
          Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
              .chain(CurveTween(curve: Curves.ease)),
        ),
        child: child,
      );

    case TargetPlatform.android:
      // Material Design shared axis transition
      return SlideTransition(
        position: animation.drive(
          Tween(begin: const Offset(0.0, 0.1), end: Offset.zero)
              .chain(CurveTween(curve: Curves.easeInOut)),
        ),
        child: FadeTransition(
          opacity: animation.drive(
            Tween(begin: 0.0, end: 1.0)
                .chain(CurveTween(curve: Curves.easeInOut)),
          ),
          child: child,
        ),
      );

    default:
      // Default fade transition
      return FadeTransition(
        opacity: animation,
        child: child,
      );
  }
}
