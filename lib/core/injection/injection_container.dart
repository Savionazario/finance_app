import 'package:finance_app/layers/data/datasources/authentication_datasource.dart';
import 'package:finance_app/layers/data/datasources/firebase/firebase_datasource_impl.dart';
import 'package:finance_app/layers/data/repositories/firebase_repository_impl.dart';
import 'package:finance_app/layers/domain/repositories/firebase_repository.dart';
import 'package:finance_app/layers/domain/usecases/isSignIn/is_sign_in_usecase.dart';
import 'package:finance_app/layers/domain/usecases/isSignIn/is_sign_in_usecase_impl.dart';
import 'package:finance_app/layers/domain/usecases/signIn/sign_in_with_email_and_password_usecase.dart';
import 'package:finance_app/layers/domain/usecases/signIn/sign_in_with_email_and_password_usecase_impl.dart';
import 'package:finance_app/layers/domain/usecases/signOut/sign_out_usecase.dart';
import 'package:finance_app/layers/domain/usecases/signOut/sign_out_usecase_impl.dart';
import 'package:finance_app/layers/domain/usecases/signUp/sign_up_usecase.dart';
import 'package:finance_app/layers/domain/usecases/signUp/sign_up_usecase_impl.dart';
import 'package:finance_app/layers/presentation/ui/cubits/authentication/authentication_cubit.dart';
import 'package:finance_app/layers/presentation/ui/cubits/login/login_cubit.dart';
import 'package:finance_app/layers/presentation/ui/cubits/signUp/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

class InjectionContainer {
  static void init() {
    GetIt getIt = GetIt.instance;

    //! Authentication
    // ? registerLazySingleton -> utiliza o patrão sigleton e só é criado quando é chamado a primeira vez
    // datasouces
    getIt.registerLazySingleton<AuthenticationDataSource>(
      () => FirebaseDataSourceImpl(),
    );
    // repositories
    getIt.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(getIt()),
    );
    // usecases
    getIt.registerLazySingleton<SignInWithEmailAndPasswordUseCase>(
      () => SignInWithEmailAndPasswordUseCaseImpl(getIt()),
    );
    getIt.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCaseImpl(getIt()),
    );
    getIt.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCaseImpl(getIt()),
    );
    getIt.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCaseImpl(getIt()),
    );

    // cubits
    getIt.registerLazySingleton<AuthenticationCubit>(
      () => AuthenticationCubit(
        getIt(),
        getIt(),
      ),
    );
    getIt.registerLazySingleton<LoginCubit>(
      () => LoginCubit(
        getIt(),
        getIt(),
      ),
    );
    getIt.registerLazySingleton<SignUpCubit>(
      () => SignUpCubit(
        getIt(),
        getIt(),
      ),
    );
  }
}
