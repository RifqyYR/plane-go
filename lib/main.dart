import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plane_go/cubit/auth_cubit.dart';
import 'package:plane_go/cubit/destination_cubit.dart';
import 'package:plane_go/cubit/new_destination_cubit.dart';
import 'package:plane_go/cubit/page_cubit.dart';
import 'package:plane_go/cubit/seat_cubit.dart';
import 'package:plane_go/ui/pages/bonus_page.dart';
import 'package:plane_go/ui/pages/get_started_page.dart';
import 'package:plane_go/ui/pages/main_page.dart';
import 'package:plane_go/ui/pages/sign_in.dart';
import 'package:plane_go/ui/pages/sign_up.dart';
import 'package:plane_go/ui/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:plane_go/ui/pages/succes_checkout_page.dart';

import 'cubit/transaction_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => NewDestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/get-started': (context) => const GetStartedPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/sign-in': (context) => const SignInPage(),
          '/bonus': (context) => const BonusPage(),
          '/main': (context) => const MainPage(),
          '/succes': (context) => const SuccesCheckoutPage(),
        },
      ),
    );
  }
}
