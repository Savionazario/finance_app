import 'package:finance_app/cubits/login/login_cubit.dart';
import 'package:finance_app/cubits/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late final LoginCubit _loginCubit;

  @override
  void initState() {
    _loginCubit = context.read<LoginCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Image.asset("assets/vector_transparent.png", width: 350),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 0.0, bottom: 6.0),
                      child: Text(
                        "Seja bem-vindo!",
                        style: GoogleFonts.nunitoSans(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Faça seu login para continuar.",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 54,
                    width: 340,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        // icon: Icon(Icons.person),
                        labelText: 'Email',
                        hintText: 'Digite seu email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      height: 54,
                      width: 340,
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          // icon: Icon(Icons.person),
                          labelText: 'Senha',
                          hintText: 'Digite sua senha',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  BlocBuilder<LoginCubit, LoginState>(
                    bloc: _loginCubit,
                    builder: (context, state) {
                      if (state is LoginInitialState) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: SizedBox(
                            width: 340,
                            height: 50,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xFF0E3AAA),
                              ),
                              child: const Text(
                                "Entrar",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                print("Email: ${_emailController.text}");
                                print("Smail: ${_passwordController.text}");
        
                                _loginCubit.signIn(
                                    email: _emailController.text,
                                    password: _passwordController.text);
                              },
                            ),
                          ),
                        );
                      }
                      if (state is LoginErrorState) {
                        _onWidgetDidBuild(() {
                          _showUserInvalidDialog(context, state.errorMessage);
                        });
        
                        return Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: SizedBox(
                            width: 340,
                            height: 50,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xFF0E3AAA),
                              ),
                              child: const Text(
                                "Entrar",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                print("Email: ${_emailController.text}");
                                print("Smail: ${_passwordController.text}");
        
                                _loginCubit.signIn(
                                    email: _emailController.text,
                                    password: _passwordController.text);
                              },
                            ),
                          ),
                        );
                      }
        
                      return const Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Não tem uma conta? ",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Text(
                          "Cadastre-se.",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Color(0xFF0E3AAA),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _onWidgetDidBuild(Function callback) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    callback();
  });
}

_showUserInvalidDialog(BuildContext context, String errorMessage) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Ops, algo está errado"),
          content: Text("$errorMessage"),
          actions: [
            TextButton(
              child: Text("Entendi"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      });
}
