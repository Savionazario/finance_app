import 'package:finance_app/layers/data/datasources/authentication_datasource.dart';
import 'package:finance_app/layers/data/datasources/firebase/firebase_authentication_datasource_impl.dart';
import 'package:finance_app/layers/data/datasources/firebase/firebase_transaction_datasource.dart';
import 'package:finance_app/layers/data/datasources/transaction_datasource.dart';
import 'package:finance_app/layers/data/repositories/user_repository_impl.dart';
import 'package:finance_app/layers/domain/repositories/transaction_repository.dart';
import 'package:finance_app/layers/domain/repositories/user_repository.dart';
import 'package:finance_app/layers/domain/usecases/createTransaction/create_transaction_usecase.dart';
import 'package:finance_app/layers/domain/usecases/getUserWithFiltered_transactions/get_user_with_filtered_transactions_usecase.dart';
import 'package:finance_app/layers/domain/usecases/getUserWithFiltered_transactions/get_user_with_filtered_transactions_usecase_impl.dart';
import 'package:finance_app/layers/domain/usecases/getUserBydate/get_user_by_date_usecase.dart';
import 'package:finance_app/layers/domain/usecases/getUserBydate/get_user_by_date_usecase_impl.dart';
import 'package:finance_app/layers/domain/usecases/getUserWithRecentTransactions/get_user_with_recent_transactions_usecase.dart';
import 'package:finance_app/layers/domain/usecases/getUserWithRecentTransactions/get_user_with_recent_transactions_usecase_impl.dart';
import 'package:finance_app/layers/domain/usecases/isSignIn/is_sign_in_usecase.dart';
import 'package:finance_app/layers/domain/usecases/isSignIn/is_sign_in_usecase_impl.dart';
import 'package:finance_app/layers/domain/usecases/signIn/sign_in_with_email_and_password_usecase.dart';
import 'package:finance_app/layers/domain/usecases/signIn/sign_in_with_email_and_password_usecase_impl.dart';
import 'package:finance_app/layers/domain/usecases/signOut/sign_out_usecase.dart';
import 'package:finance_app/layers/domain/usecases/signOut/sign_out_usecase_impl.dart';
import 'package:finance_app/layers/domain/usecases/signUp/sign_up_usecase.dart';
import 'package:finance_app/layers/domain/usecases/signUp/sign_up_usecase_impl.dart';
import 'package:finance_app/layers/presentation/ui/createTransactionFeature/cubits/createTransaction/create_transaction_cubit.dart';
import 'package:finance_app/layers/presentation/ui/createTransactionFeature/cubits/selectPaymentMethod/select_payment_method_cubit.dart';
import 'package:finance_app/layers/presentation/ui/createTransactionFeature/cubits/selectTransactionCategory/select_transaction_category_cubit.dart';
import 'package:finance_app/layers/presentation/ui/cubits/authentication/authentication_cubit.dart';
import 'package:finance_app/layers/presentation/ui/cubits/changePage/change_page_cubit.dart';
import 'package:finance_app/layers/presentation/ui/cubits/getUserDetails/get_user_details_cubit.dart';
import 'package:finance_app/layers/presentation/ui/cubits/login/login_cubit.dart';
import 'package:finance_app/layers/presentation/ui/cubits/signUp/sign_up_cubit.dart';
import 'package:finance_app/layers/presentation/ui/cubits/transactionsList/transactions_list_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../layers/data/repositories/transaction_repository_impl.dart';
import '../../layers/domain/usecases/createTransaction/create_transaction_usecase_impl.dart';

class InjectionContainer {
  static void init() {
    GetIt getIt = GetIt.instance;

    //! Authentication
    // ? registerLazySingleton -> utiliza o patrão sigleton e só é criado quando é chamado a primeira vez
    //* datasouces
    getIt.registerLazySingleton<AuthenticationDataSource>(
      () => FirebaseAuthenticationDataSourceImpl(),
    );

    //* repositories
    getIt.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(getIt()),
    );

    //* usecases
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

    //* cubits
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

    //! User Details
    //* datasouces
    getIt.registerLazySingleton<TransactionDatasource>(
      () => FirebaseTransactionDataSourceImpl(),
    );

    //* repositories
    getIt.registerLazySingleton<TransactionRepository>(
      () => TransactionRepositoryImpl(getIt()),
    );

    //* usecases
    getIt.registerLazySingleton<GetUserWithFilteredTransactionsUsecase>(
      () => GetUserWithFilteredTransactionsUsecaseImpl(getIt()),
    );
    getIt.registerLazySingleton<GetUserByDateUseCase>(
      () => GetUserByDateUseCaseImpl(getIt()),
    );
    getIt.registerLazySingleton<GetUserWithRecentTransactionsUseCase>(
      () => GetUserWithRecentTransactionsUseCaseImpl(getIt()),
    );
    getIt.registerLazySingleton<CreateTransactionUseCase>(
      () => CreateTransactionUseCaseImpl(
        getIt(),
        getIt(),
      ),
    );

    //* cubits
    getIt.registerLazySingleton<GetUserDetailsCubit>(
      () => GetUserDetailsCubit(
        getIt(),
        getIt(),
      ),
    );
    getIt.registerLazySingleton<TransactionListCubit>(
      () => TransactionListCubit(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<CreateTransactionCubit>(
      () => CreateTransactionCubit(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<SelectTransactionCategoryCubit>(
      () => SelectTransactionCategoryCubit(),
    );
    getIt.registerLazySingleton<SelectPaymentMethodCubit>(
      () => SelectPaymentMethodCubit(),
    );
    getIt.registerLazySingleton<ChangePageCubit>(
      () => ChangePageCubit(),
    );
  }
}
