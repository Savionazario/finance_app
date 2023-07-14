import 'package:finance_app/layers/presentation/ui/cubits/signUp/sign_up_cubit.dart';
import 'package:finance_app/layers/presentation/ui/cubits/signUp/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late final SignUpCubit _signUpCubit;

  @override
  void initState() {
    _signUpCubit = GetIt.I.get<SignUpCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 440,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cadastrar",
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
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
                                "Nome",
                                style: TextStyle(),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 340,
                              child: TextFormField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  // icon: Icon(Icons.person),
                                  // labelText: 'Email',
                                  hintText: 'Digite seu nome',
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
                              const Padding(
                                padding: EdgeInsets.only(bottom: 4.0),
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
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: SizedBox(
                        width: 340,
                        height: 50,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xFF0E3AAA),
                          ),
                          child: BlocBuilder<SignUpCubit, SignUpState>(
                            bloc: _signUpCubit,
                            builder: (context, state) {
                              // if (state is SignUpInitialState) {
                              //   return Text(
                              //     "Criar conta",
                              //     style: TextStyle(
                              //       color: Colors.white,
                              //     ),
                              //   );
                              // }

                              if (state is SignUpLoadingState) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                );
                              } else if (state is SignUpErrorState) {
                                _onWidgetDidBuild(() {
                                  _showUserInvalidDialog(
                                      context, state.errorMessage);
                                });
                                return const Text(
                                  "Criar conta",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                );
                              } else {
                                return const Text(
                                  "Criar conta",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                );
                              }
                            },
                          ),
                          onPressed: () async {
                            _signUpCubit.signUpButtonPressed(
                              name: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
}
