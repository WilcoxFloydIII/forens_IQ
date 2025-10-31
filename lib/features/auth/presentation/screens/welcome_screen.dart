import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forens_iq/core/themes/app_colors.dart';
import 'package:forens_iq/core/themes/app_text_styles.dart';
import 'package:forens_iq/routes/route_names.dart';
import 'package:forens_iq/shared/widgets/app_button.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brandBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 320.sp,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/717dd2942312d1c16e016ff05cf586a53a92ee36.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 114.sp),
            Text('Welcome to ForensIQ', style: AppTextStyles.heading1),
            SizedBox(height: 24.sp),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.sp),
              child: Text(
                'Uncover digital evidence with AI-powered precision. Analyze files, logs, and network data to reveal hidden threats and insights.',
                style: AppTextStyles.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 12.sp,
                  children: [
                    AppButton(
                      onPressed: () {
                        context.pushNamed(RouteName.signup);
                      },
                      height: 48,
                      brandButton: true,
                      text: 'Get Started',
                    ),
                    AppButton(
                      onPressed: () {
                        context.pushNamed(RouteName.learnMore);
                      },
                      height: 48,
                      brandButton: false,
                      text: 'Learn More',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
