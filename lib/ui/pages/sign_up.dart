import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plane_go/cubit/auth_cubit.dart';
import 'package:plane_go/shared/theme.dart';
import 'package:plane_go/ui/widgets/custom_button.dart';
import 'package:plane_go/ui/widgets/custom_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController hobbyController = TextEditingController(text: '');

  Widget title() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Text(
        'Join us and get\nyour next journey',
        style: blackTextStyle.copyWith(
          fontSize: 24,
          fontWeight: semiBold,
        ),
      ),
    );
  }

  Widget nameInput() {
    return CustomTextFormField(
      title: 'Full Name',
      hintText: 'Your full name',
      controller: nameController,
    );
  }

  Widget emailInput() {
    return CustomTextFormField(
      title: 'Email',
      hintText: 'Your Email',
      controller: emailController,
    );
  }

  Widget passwordInput() {
    return CustomTextFormField(
      title: 'Password',
      hintText: 'Your Password',
      obscureText: true,
      controller: passwordController,
    );
  }

  Widget hobbyInput() {
    return CustomTextFormField(
      title: 'Hobby',
      hintText: 'Your Hobby',
      controller: hobbyController,
    );
  }

  Widget submitButton() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // ignore: todo
        // TODO: implement listener
        if (state is AuthSuccess) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/bonus', (route) => false);
        } else if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return CustomButton(
          title: 'Get Started',
          onPressed: () {
            context.read<AuthCubit>().signUp(
                  email: emailController.text,
                  password: passwordController.text,
                  name: nameController.text,
                  hobby: hobbyController.text,
                );
          },
          width: 287,
          margin: const EdgeInsets.symmetric(
            vertical: 30,
          ),
        );
      },
    );
  }

  Widget formInput() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: Column(
        children: [
          nameInput(),
          emailInput(),
          passwordInput(),
          hobbyInput(),
          submitButton(),
        ],
      ),
    );
  }

  Widget signInButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/sign-in');
      },
      child: Container(
        width: 175,
        margin: const EdgeInsets.only(
          top: 50,
          bottom: 73,
        ),
        child: Center(
          child: Text(
            'Have an account? Sign in',
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            title(),
            formInput(),
            signInButton(),
          ],
        ),
      ),
    );
  }
}
