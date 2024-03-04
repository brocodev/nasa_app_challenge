import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_common/ui_common.dart';

class NasaSnackBar extends StatelessWidget {
  const NasaSnackBar({
    required this.title,
    required this.subtitle,
    this.color,
    this.iconData,
    this.onPressed,
    super.key,
  });

  factory NasaSnackBar.error({
    required String title,
    required String subtitle,
    IconData? iconData,
  }) {
    return NasaSnackBar(
      title: title,
      subtitle: subtitle,
      color: AppColors.red,
      iconData: iconData ?? Icons.cancel_outlined,
    );
  }

  /// SnackBar for error message
  factory NasaSnackBar.success({
    required String title,
    required String subtitle,
    IconData? iconData,
  }) {
    return NasaSnackBar(
      title: title,
      subtitle: subtitle,
      color: AppColors.green,
      iconData: iconData ?? Icons.check_circle_outline,
    );
  }

  /// [NasaSnackBar]  for alert message
  factory NasaSnackBar.alert({
    required String title,
    required String subtitle,
    IconData? iconData,
  }) {
    return NasaSnackBar(
      title: title,
      subtitle: subtitle,
      color: AppColors.yellow,
      iconData: iconData ?? Icons.warning_amber_rounded,
    );
  }

  /// [NasaSnackBar] for info message
  factory NasaSnackBar.info({
    required String title,
    required String subtitle,
    IconData? iconData,
    VoidCallback? onPressed,
  }) {
    return NasaSnackBar(
      title: title,
      subtitle: subtitle,
      color: AppColors.blue,
      onPressed: onPressed,
      iconData: iconData ?? Icons.info_outlined,
    );
  }

  /// Title
  final String title;

  /// Subtitle
  final String subtitle;

  /// Color
  final Color? color;

  /// IconData
  final IconData? iconData;

  /// On press callback
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: _SnackBarContainer(
        child: Row(
          children: [
            10.horizontalSpace,
            _SnackBarIcon(iconData: iconData, color: color),
            12.horizontalSpace,
            Expanded(
              child: _TitleAndSubtitleTexts(
                title: title,
                color: color,
                subtitle: subtitle,
              ),
            ),
            const _CloseButton(),
          ],
        ),
      ),
    );
  }
}

class _SnackBarContainer extends StatelessWidget {
  const _SnackBarContainer({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.sp,
        vertical: 16.sp,
      ),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: child,
    );
  }
}

class _SnackBarIcon extends StatelessWidget {
  const _SnackBarIcon({
    required this.iconData,
    required this.color,
  });

  final IconData? iconData;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: color,
      size: 34.sp,
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        onPressed: () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
        icon: Icon(
          Icons.close,
          color: context.theme.hintColor,
        ),
      ),
    );
  }
}

class _TitleAndSubtitleTexts extends StatelessWidget {
  const _TitleAndSubtitleTexts({
    required this.title,
    required this.color,
    required this.subtitle,
  });

  final String title;
  final Color? color;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.titleMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
        2.verticalSpace,
        Text(
          subtitle,
          style: context.bodyMedium.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
