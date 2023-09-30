import 'package:flutter/material.dart';
import 'package:plane_go/shared/theme.dart';

class InterestItems extends StatelessWidget {
  final String text;
  const InterestItems({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/check_icon.png',
                ),
              ),
            ),
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            text,
            style: blackTextStyle,
          ),
        ],
      ),
    );
  }
}
