import 'package:flutter/material.dart';
import 'package:plane_go/shared/theme.dart';

class BookingDetailsItem extends StatelessWidget {
  final String nama;
  final String desc;
  final Color textColor;
  const BookingDetailsItem({
    Key? key,
    required this.nama,
    required this.desc,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 16,
      ),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: const EdgeInsets.only(
              right: 6,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/check_icon.png'),
              ),
            ),
          ),
          Text(
            nama,
            style: blackTextStyle,
          ),
          const Spacer(),
          Text(
            desc,
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              color: textColor,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
