import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forens_iq/core/themes/app_colors.dart';
import 'package:forens_iq/core/themes/app_text_styles.dart';

class AppLayout extends StatefulWidget {
  final String? pageTitle;
  final Widget? trailing;
  final List<Widget> children;
  const AppLayout({
    super.key,
    this.trailing,
    this.pageTitle,
    required this.children,
  });

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brandBackground,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 72.sp,
        elevation: 0,
        scrolledUnderElevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: AppColors.brandBackground,
        animateColor: false,
        automaticallyImplyLeading: true,
        title: Text(widget.pageTitle ?? '', style: AppTextStyles.heading4),
        actions: [widget.trailing ?? SizedBox.shrink()],
        actionsPadding: EdgeInsets.only(right: 16),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        behavior: HitTestBehavior.translucent, //very important for the unfocus
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: widget.children),
          ),
        ),
      ),
    );
  }
}
