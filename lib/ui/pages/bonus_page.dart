import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plane_go/cubit/auth_cubit.dart';
import 'package:plane_go/shared/theme.dart';
import 'package:plane_go/ui/widgets/custom_button.dart';

class BonusPage extends StatefulWidget {
  const BonusPage({Key? key}) : super(key: key);

  @override
  _BonusPageState createState() => _BonusPageState();
}

class _BonusPageState extends State<BonusPage> {
  Widget box() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            width: 300,
            padding: EdgeInsets.all(defaultMargin),
            height: 211,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                  'assets/layer.png',
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: primaryColor.withOpacity(0.5),
                  blurRadius: 50,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: whiteTextStyle.copyWith(
                              fontWeight: light,
                            ),
                          ),
                          Text(
                            state.user.name,
                            style: whiteTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: medium,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      margin: const EdgeInsets.only(
                        right: 6,
                      ),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/logo.png',
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Pay',
                      style: whiteTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 41,
                ),
                Text(
                  'Balance',
                  style: whiteTextStyle.copyWith(
                    fontWeight: light,
                  ),
                ),
                Text(
                  'IDR 280.000.000',
                  style: whiteTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 26,
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget title() {
    return Container(
      margin: const EdgeInsets.only(
        top: 80,
      ),
      child: Text(
        "Big Bonus 🎉",
        style: blackTextStyle.copyWith(
          fontSize: 32,
          fontWeight: semiBold,
        ),
      ),
    );
  }

  Widget subtitle() {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: Text(
        "We give you early credit so that\nyou can buy a flight ticket",
        style: blackTextStyle.copyWith(
          fontSize: 16,
          fontWeight: light,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget submitButton() {
    return CustomButton(
      title: 'Start Fly Now',
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      },
      width: 220,
      margin: const EdgeInsets.only(
        top: 50,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            box(),
            title(),
            subtitle(),
            submitButton(),
          ],
        ),
      ),
    );
  }
}
