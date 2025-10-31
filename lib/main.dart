import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:forens_iq/core/themes/app_theme.dart';
import 'package:forens_iq/routes/app_router.dart';
// import 'package:flutter/scheduler.dart' show FrameTiming;
// import 'package:flutter/scheduler.dart' show SchedulerBinding;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Performance monitoring
  final scheduler = SchedulerBinding.instance;
  scheduler.addTimingsCallback((List<FrameTiming> timings) {
    for (final timing in timings) {
      final frameTime = timing.totalSpan.inMilliseconds;
      if (frameTime > 16) {
        debugPrint('⚠️ Slow frame: ${frameTime}ms');
      }
    }
  });

  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  ]).then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => MaterialApp.router(
        title: 'ForensIQ',
        theme: AppTheme.darkTheme,
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
