abstract class AuthenticationState{}

class AuthenticationInitialState extends AuthenticationState{}

class AuthenticationLoadingState extends AuthenticationState{}

class AuthenticationSuccessfulState extends AuthenticationState{
  // User user;

  // AuthenticationSuccessfulState({required this.user});
}

class AuthenticationErrorState extends AuthenticationState{}