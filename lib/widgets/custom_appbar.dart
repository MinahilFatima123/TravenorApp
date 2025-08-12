import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onBackTap;
  final Widget? trailing;
  final Color? titleColor;
  final Color? iconColor;
  final Color? ellipseColor;
  final String? subtitle;
  final bool showBackButton;
  final List<Widget>? actions;


  const CustomAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.onBackTap,
    this.trailing,
    this.iconColor,
    this.titleColor,
    this.ellipseColor,
    this.showBackButton = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.00985,
          left: screenWidth * 0.0533,
          right: screenWidth * 0.0533,
        ),
        child: SizedBox(
          height: 80,
          child: Row(
            children: [
              showBackButton
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/png/Ellipse 674.png',
                          width: 44,
                          height: 44,
                          color: ellipseColor ?? Colors.grey.shade200,
                        ),
                        IconButton(
                          onPressed: onBackTap ?? () => Navigator.pop(context),
                          icon: Image.asset(
                            'assets/png/icon arrow left.png',
                            width: 5.5,
                            height: 11.5,
                            color: iconColor ?? Colors.black,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(width: 44),

              const SizedBox(width: 11),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title ?? '',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: titleColor ?? Colors.black,
                      ),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.green,
                        ),
                      ),
                  ],
                ),
              ),

              actions != null && actions!.isNotEmpty
                  ? Row(
                mainAxisSize: MainAxisSize.min,
                children: actions!,
              )
                  : const SizedBox(width: 44),

            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
