import 'package:finance_app/layers/presentation/ui/cubits/login/login_cubit.dart';
import 'package:finance_app/layers/presentation/ui/cubits/login/login_state.dart';
import 'package:finance_app/layers/presentation/ui/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

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
    _loginCubit = GetIt.I.get<LoginCubit>();
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          "Email",
                          style: TextStyle(),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 340,
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            // icon: Icon(Icons.person),
                            // labelText: 'Email',
                            hintText: 'Digite seu email',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey[300]!,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey[300]!,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            "Senha",
                            style: TextStyle(),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 340,
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              // icon: Icon(Icons.person),
                              // labelText: 'Senha',
                              hintText: 'Digite sua senha',
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                "Entrar",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () async {
                                print("Email: ${_emailController.text}");
                                print("Senha: ${_passwordController.text}");

                                await _loginCubit.signIn(
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
                              onPressed: () async {
                                print("Email: ${_emailController.text}");
                                print("Smail: ${_passwordController.text}");

                                await _loginCubit.signIn(
                                    email: _emailController.text,
                                    password: _passwordController.text);
                              },
                            ),
                          ),
                        );
                      }

                      return Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: SizedBox(
                            width: 340,
                            height: 50,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xFF0E3AAA),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 3,),
                              onPressed: () {},
                            ),
                          ),
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
                        InkWell(
                          child: Text(
                            "Cadastre-se.",
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                color: Color(0xFF0E3AAA),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpPage(),
                              ),
                            );
                          },
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
