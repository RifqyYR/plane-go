import 'package:flutter/material.dart';
import 'package:plane_go/models/destination_model.dart';
import 'package:plane_go/shared/theme.dart';
import 'package:plane_go/ui/pages/detail_page.dart';

class CardDestination extends StatelessWidget {
  final DestinationModel destination;

  const CardDestination(
    this.destination, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(destination),
          ),
        );
      },
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 30,
                left: 24,
              ),
              width: 200,
              height: 323,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 180,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(defaultRadius),
                        image: DecorationImage(
                          image: NetworkImage(destination.imageUrl),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 55,
                          height: 30,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(defaultRadius),
                            ),
                          ),
                          child: Row(
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
                                destination.rating.toString(),
                                style: blackTextStyle.copyWith(
                                  fontWeight: medium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 20,
                        left: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            destination.name,
                            style: blackTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            destination.city,
                            style: greyTextStyle.copyWith(
                              fontWeight: light,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
