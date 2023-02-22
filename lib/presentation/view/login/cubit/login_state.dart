part of 'login_cubit.dart';


class LoginState extends Equatable {
  const LoginState({
    required this.isLoading,
    required this.isAdmin,
    required this.isLogin,
  });

  final bool isLoading;
  final bool isAdmin;
  final bool isLogin;
LoginState copyWith({
  bool? isLoading,
  bool? isAdmin,
  bool? isLogin,

}) {
  return LoginState(
    isLoading: isLoading ?? this.isLoading, isAdmin: isAdmin ?? this.isAdmin, isLogin: isLogin ?? this.isLogin
  );
}

  @override
  // TODO: implement props
  List<Object?> get props => [
    isLoading,
    isAdmin,
    isLogin,
  ];

}
