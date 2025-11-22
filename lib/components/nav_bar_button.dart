import 'package:flutter/material.dart';

class NavBarButton extends StatelessWidget {
  final String icon;
  final bool isActive;
  final VoidCallback onTap;
  final Color? iconColor;
  final double size;

  const NavBarButton({
    super.key,
    required this.icon,
    required this.isActive,
    required this.onTap,
    this.iconColor,
    this.size = 28,
  });

  @override
  Widget build(BuildContext context) {
    // If iconColor is provided, always use it regardless of active state
    if (iconColor != null) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: size,
          height: size,
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(iconColor!, BlendMode.modulate),
            child: Image.asset(icon, fit: BoxFit.contain),
          ),
        ),
      );
    }

    // Otherwise, use active/inactive logic
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        child: isActive
            ? ColorFiltered(
                colorFilter: ColorFilter.mode(Colors.black, BlendMode.modulate),
                child: Image.asset(icon, fit: BoxFit.contain),
              )
            : ColorFiltered(
                colorFilter: ColorFilter.mode(Colors.grey, BlendMode.modulate),
                child: Image.asset(icon, fit: BoxFit.contain),
              ),
      ),
    );
  }
}

