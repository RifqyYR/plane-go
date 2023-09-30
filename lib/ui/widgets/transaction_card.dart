import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plane_go/models/transaction_model.dart';
import 'package:plane_go/shared/theme.dart';

import 'booking_details_item.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCard(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: Column(
        children: [
          // NOTE: HEADER
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      transaction.destination.imageUrl,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.destination.name,
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      transaction.destination.city,
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: const EdgeInsets.only(right: 2),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/star.png',
                        ),
                      ),
                    ),
                  ),
                  Text(
                    transaction.destination.rating.toString(),
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // NOTE: BOOKING DETAILS
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Booking Details',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                BookingDetailsItem(
                  nama: "Traveler",
                  desc: "${transaction.amountOfTravelers} person",
                  textColor: blackColor,
                ),
                BookingDetailsItem(
                  nama: "Seat",
                  desc: transaction.selectedSeats,
                  textColor: blackColor,
                ),
                BookingDetailsItem(
                  nama: "Insurance",
                  desc: transaction.insurance == true ? "YES" : "NO",
                  textColor:
                      transaction.insurance == true ? greenColor : redColor,
                ),
                BookingDetailsItem(
                  nama: "Refundable",
                  desc: transaction.refundable == true ? "YES" : "NO",
                  textColor:
                      transaction.refundable == true ? greenColor : redColor,
                ),
                BookingDetailsItem(
                  nama: "VAT",
                  desc: "${(transaction.vat * 100).toInt()}%",
                  textColor: blackColor,
                ),
                BookingDetailsItem(
                  nama: "Price",
                  desc: NumberFormat.currency(
                    locale: 'id',
                    decimalDigits: 0,
                    symbol: 'IDR ',
                  ).format(transaction.destination.price *
                      transaction.amountOfTravelers),
                  textColor: blackColor,
                ),
                BookingDetailsItem(
                  nama: "Grand Total",
                  desc: NumberFormat.currency(
                    locale: 'id',
                    decimalDigits: 0,
                    symbol: 'IDR ',
                  ).format(transaction.grandTotal),
                  textColor: primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
