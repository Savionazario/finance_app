import 'package:finance_app/core/injection/injection_container.dart';
import 'package:finance_app/layers/presentation/ui/cubits/authentication/authentication_cubit.dart';
import 'package:finance_app/layers/presentation/ui/cubits/login/login_cubit.dart';
import 'package:finance_app/layers/data/datasources/firebase/firebase_datasource_impl.dart';
import 'package:finance_app/layers/data/repositories/firebase_repository_impl.dart';
import 'package:finance_app/layers/domain/usecases/isSignIn/is_sign_in_usecase_impl.dart';
import 'package:finance_app/layers/domain/usecases/signIn/sign_in_with_email_and_password_usecase.dart';
import 'package:finance_app/layers/domain/usecases/signIn/sign_in_with_email_and_password_usecase_impl.dart';
import 'package:finance_app/layers/domain/usecases/signOut/sign_out_usecase_impl.dart';
import 'package:finance_app/layers/presentation/ui/pages/auth_check.dart';
import 'package:finance_app/layers/presentation/ui/pages/inital_page.dart';
import 'package:finance_app/layers/presentation/ui/pages/login_page.dart';
import 'package:finance_app/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
// import 'package:flutter/services.dart';
import 'firebase_options.dart';

void main() async {
  InjectionContainer.init();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => AuthService()),
        Provider(create: (context) => FirebaseDataSourceImpl()),
        Provider(
          create: (context) => FirebaseRepositoryImpl(
            context.read<FirebaseDataSourceImpl>(),
          ),
        ),
        Provider(
          create: (context) => IsSignInUseCaseImpl(
            context.read<FirebaseRepositoryImpl>(),
          ),
        ),
        Provider(
          create: (context) => SignInWithEmailAndPasswordUseCaseImpl(
            context.read<FirebaseRepositoryImpl>(),
          ),
        ),
        Provider(
          create: (context) => SignOutUseCaseImpl(
            context.read<FirebaseRepositoryImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => AuthenticationCubit(
            context.read<IsSignInUseCaseImpl>(),
            context.read<SignOutUseCaseImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => LoginCubit(
            context.read<SignInWithEmailAndPasswordUseCaseImpl>(),
            context.read<AuthenticationCubit>(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const AuthCheck(),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   mudarCores(){
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarIconBrightness: Brightness.light,
//       statusBarBrightness: Brightness.light,
//       statusBarColor: Color(0xFF233C65),
//     ));
//   }

//   @override
//   void initState() {
//     mudarCores();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
      
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomePage(),
//     );
//   }
// }