// import 'dart:async';
// import 'package:cozy_connect/core/themes/app_paddings.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:cozy_connect/core/themes/app_colors.dart';
// import 'package:cozy_connect/routes/route_names.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:cozy_connect/shared/providers/intro_provider.dart';

// class SplashScreen extends ConsumerStatefulWidget {
//   const SplashScreen({super.key, this.state});
//   final GoRouterState? state;

//   @override
//   ConsumerState<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends ConsumerState<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;
//   bool _showScene1 = true;
//   bool _showScene2 = false;
//   bool _showBrandIcon = false;
//   double? _logoSize;
//   bool _visible = false;
//   double imageSize = 150.0;
//   double logoSize = 120.0;
//   double offset = 30.0;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 2000),
//     );

//     // Start animation sequence after first frame
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _startAnimationSequence();
//     });
//   }

//   void _startAnimationSequence() {
//     setState(() {
//       _visible = true;
//     });
//     // Show scene 1 for 2 seconds
//     Future.delayed(const Duration(seconds: 2), () async {
//       // Setup animation
//       setState(() {
//         _logoSize = logoSize; // SAME SIZE AS LOGO CONTAINER
//         _showScene2 = true;
//       });

//       // Start scale animation
//       _scaleAnimation = Tween<double>(
//         begin: 1.0,
//         end: 100.0, // Large enough to cover screen
//       ).animate(CurvedAnimation(
//         parent: _controller,
//         curve: Curves.easeInOutQuart,
//       ));

//       _controller.forward().then((_) {
//         setState(() {
//           _showBrandIcon = true;
//           _showScene1 = false;
//         });

//         // Navigate to home after showing brand icon
//         Future.delayed(const Duration(seconds: 2), () {
//           if (mounted) {
//             final introState = ref.watch(introProvider);
//             if (introState) {
//               context.pushReplacementNamed(RouteName.signIn);
//             } else {
//               context.pushReplacementNamed(RouteName.intro);
//             }
//           }
//         });
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           // BOTTOM IMAGE
//           Positioned(
//             bottom: -25,
//             left: 0,
//             child: Image.asset(
//               'assets/images/splash-bg.png',
//               fit: BoxFit.cover,
//               width: 250.0,
//               height: 180.0,
//             ),
//           ),

//           // LOGO
//           if (_showScene1)
//             Positioned(
//               top: MediaQuery.of(context).size.height / 2 -
//                   (imageSize / 2) -
//                   offset,
//               left: MediaQuery.of(context).size.width / 2 - (imageSize / 2),
//               child: AnimatedOpacity(
//                 opacity: _visible ? 1.0 : 0.0,
//                 curve: Curves.easeIn,
//                 duration: const Duration(milliseconds: 500),
//                 child: Image.asset(
//                   'assets/images/splash-logo.png',
//                   height: imageSize,
//                   width: imageSize,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),

//           // SCENE 2 - CIRCULAR EXPANSION
//           if (_showScene2)
//             Positioned(
//               top: MediaQuery.of(context).size.height / 2 -
//                   (logoSize / 2) -
//                   offset,
//               left: MediaQuery.of(context).size.width / 2 - (logoSize / 2),
//               child: Center(
//                 child: AnimatedBuilder(
//                   animation: _controller,
//                   builder: (context, child) {
//                     return Transform.scale(
//                       scale: _scaleAnimation.value,
//                       child: Container(
//                         width: _logoSize,
//                         height: _logoSize,
//                         decoration: const BoxDecoration(
//                           color: AppColors.brandDark,
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),

//           // BRAND ICON (FADE IN AFTER EXPANSION)
//           Center(
//             child: AnimatedOpacity(
//               duration: const Duration(milliseconds: 500),
//               curve: Curves.easeIn,
//               opacity: _showBrandIcon ? 1.0 : 0,
//               child: Padding(
//                 padding: AppPaddings.screenPadding,
//                 child: Image.asset(
//                   'assets/images/logo.png',
//                   width: 250.sp,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
