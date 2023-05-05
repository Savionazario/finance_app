import 'package:finance_app/cubits/authentication/authentication_cubit.dart';
import 'package:finance_app/cubits/authentication/authentication_state.dart';
import 'package:finance_app/pages/inital_page.dart';
import 'package:finance_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({ Key? key }) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  late final AuthenticationCubit _authenticationCubit;

  @override
  void initState() {
    _authenticationCubit = context.read<AuthenticationCubit>();
    _authenticationCubit.appStarted();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        bloc: _authenticationCubit,
        builder: (context, state) {
          if(state is AuthenticationLoadingState){
            return Center(child: CircularProgressIndicator(color: Colors.black,));
          }
          if(state is AuthenticationErrorState){
            return LoginPage();
          }
          return InitalPage();
        },
      ),
    );
  }
}