import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onBackTap;
  final Widget? trailing;
  final Color? titleColor;
  final Color? iconColor;
  final Color? ellipseColor;

  const CustomAppBar({
    super.key,
    this.title,
    this.onBackTap,
    this.trailing,
    this.iconColor,
    this.titleColor,
    this.ellipseColor,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.00985, // 8 / 812
          left: screenWidth * 0.0533, // 20 / 375
          right: screenWidth * 0.0533, // 20 / 375
        ),
        child: SizedBox(
          height: 80,
          child: Row(
            children: [
              // Back Button
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/png/Ellipse 674.png',
                    width: 34,
                    height: 34,
                    color: ellipseColor ?? Colors.grey.shade200,
                  ),
                  GestureDetector(
                    onTap: onBackTap ?? () => Navigator.pop(context),
                    child: Image.asset(
                      'assets/png/icon arrow left.png',
                      width: 5.5,
                      height: 11.5,
                      color: iconColor ?? Colors.black,
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 12),

              // Title
              Expanded(
                child: Center(
                  child: Text(
                    title ?? '',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: titleColor ?? Colors.black,
                    ),
                  ),
                ),
              ),

              if (trailing != null) trailing!,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
