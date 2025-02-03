import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import 'package:template/core/di/app_di.dart';
import 'package:template/modules/authentication/presentation/viewmodel/login_event.dart';
import 'package:template/modules/authentication/presentation/viewmodel/login_state.dart';
import 'package:template/modules/authentication/presentation/viewmodel/login_viewmodel.dart';

import '../../../../app/resources/assets_manager.dart';
import '../../../../core/router/routes_manager.dart';

class LoginView extends StatefulWidget {
  static const routeName = '/login';

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final loginBloc = instance<LoginViewModel>();

  @override
  void initState() {
    _emailController.text = "emilys";
    _passwordController.text = "emilyspass";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<LoginViewModel>(
        create: (context) => loginBloc,
        child: BlocConsumer<LoginViewModel, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              // Handle login success (Navigate to HomePage or MainScreen)
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(content: Text("Login Successful")),
              // );
              goNext();
              // Navigate to the home screen or dashboard
            } else if (state is LoginFailure) {
              // Handle login failure (show error)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Login Failed: ${state.error.message}")),
              );
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: _buildBody(state),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody(LoginState state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w), // Responsive padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h),
          Image(
            image: AssetImage(ImageAssets.splashLogo),
          ),
          SizedBox(height: 5.h),
          Visibility(
            visible: state is LoginLoading,
            child: _loadingIndicator(),
          ),
          Visibility(
            visible: state is! LoginLoading,
            child: _loginForm(),
          ),
        ],
      ),
    );
  }

  Widget _loginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _emailController,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        SizedBox(height: 2.h),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(labelText: 'Password'),
        ),
        SizedBox(height: 5.h),
        _loginButton(),
      ],
    );
  }

  Widget _loginButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: ElevatedButton(
        onPressed: () {
          final email = _emailController.text;
          final password = _passwordController.text;

          loginBloc.add(LoginSubmitted(email, password));
        },
        child: const Text('Login'),
      ),
    );
  }

  Widget _loadingIndicator() {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }

  goNext() async {
    // navigate to main screen
    Navigator.pushReplacementNamed(context, Routes.mainRoute);
  }
}
