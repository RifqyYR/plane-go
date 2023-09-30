import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plane_go/cubit/page_cubit.dart';
import 'package:plane_go/shared/theme.dart';
import 'package:plane_go/ui/pages/home_page.dart';
import 'package:plane_go/ui/pages/savings_page.dart';
import 'package:plane_go/ui/pages/setting_page.dart';
import 'package:plane_go/ui/pages/transaction_page.dart';
import 'package:plane_go/ui/widgets/custom_bottom_navigation_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const TransactionPage();
        case 2:
          return const SavingsPage();
        case 3:
          return const SettingPage();
        default:
          return const HomePage();
      }
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: const EdgeInsets.only(
            bottom: 30,
            left: 24,
            right: 24,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const CustomBottomNavigationItem(
                index: 0,
                imageUrl: 'assets/globe_icon.png',
              ),
              const CustomBottomNavigationItem(
                index: 1,
                imageUrl: 'assets/book_icon.png',
              ),
              const CustomBottomNavigationItem(
                index: 2,
                imageUrl: 'assets/card_icon.png',
              ),
              const CustomBottomNavigationItem(
                index: 3,
                imageUrl: 'assets/setting_icon.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kbackgroundColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customBottomNavigation(),
            ],
          ),
        );
      },
    );
  }
}
