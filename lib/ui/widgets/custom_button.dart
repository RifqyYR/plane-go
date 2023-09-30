import 'package:flutter/material.dart';
import 'package:plane_go/shared/theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  // ignore: prefer_typing_uninitialized_variables
  final margin;
  final double width;
  final Function() onPressed;

  const CustomButton({
    Key? key,
    required this.title,
    this.margin = EdgeInsets.zero,
    this.width = double.infinity,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: 55,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}
