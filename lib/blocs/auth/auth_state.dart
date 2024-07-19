part of 'auth_cubit.dart';

enum AuthStatus { authenticated, unAuthenticated }

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    @Default(AuthStatus.unAuthenticated) AuthStatus authStatus,
    UserModel? user,
  }) = _AuthState;

  factory AuthState.authenticated(
      UserModel? currentUser,
  ) =>
      AuthState(
        user: currentUser,
        authStatus: AuthStatus.authenticated,
      );

  factory AuthState.unAuthenticated() => AuthState(
        user: null,
        authStatus: AuthStatus.unAuthenticated,
      );

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}
