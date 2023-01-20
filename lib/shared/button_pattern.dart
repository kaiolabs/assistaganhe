import 'package:flutter/material.dart';
import 'package:recover_password/shared/color_outlet.dart';
import 'package:recover_password/shared/font_family_outlet.dart';
import 'package:recover_password/shared/size_outlet.dart';

class ButtonPattern extends StatelessWidget {
  final String label;
  final Color? color;
  final Color? textColor;
  final String? fontFamily;
  final Function()? onPressed;
  const ButtonPattern({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = ColorOutlet.colorPrimary,
    this.textColor = Colors.white,
    this.fontFamily = FontFamilyOutlet.defaultFontFamilyMedium,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(SizeOutlet.borderRadiusSizeNormal),
      ),
      width: MediaQuery.of(context).size.width,
      height: 56,
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(SizeOutlet.borderRadiusSizeNormal),
        child: InkWell(
          onTap: onPressed ?? () {},
          borderRadius: BorderRadius.circular(SizeOutlet.borderRadiusSizeNormal),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'TTNorms_Medium',
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
