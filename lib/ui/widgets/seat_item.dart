import 'package:flutter/material.dart';
import 'package:plane_go/cubit/seat_cubit.dart';
import 'package:plane_go/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  // NOTE: 0. AVAILABLE, 1. SELECTED, 2. UNAVAILABLE
  final String id;
  final bool isAvailable;

  const SeatItem({
    required this.id,
    this.isAvailable = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    backgroundColor() {
      if (!isAvailable) {
        return unavailableSeatColor;
      } else {
        if (isSelected) {
          return primaryColor;
        } else {
          return availableSeatColor;
        }
      }
    }

    borderColor() {
      if (!isAvailable) {
        return unavailableSeatColor;
      } else {
        return primaryColor;
      }
    }

    child() {
      if (isSelected) {
        return Center(
          child: Text(
            'YOU',
            style: whiteTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 14,
            ),
          ),
        );
      } else {
        return const SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: backgroundColor(),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor(),
            width: 2,
          ),
        ),
        child: child(),
      ),
    );
  }
}
