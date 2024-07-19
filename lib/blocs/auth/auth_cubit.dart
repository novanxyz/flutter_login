
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:harman_app/models/user/user_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

part 'auth_cubit.g.dart';

@lazySingleton
class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit() : super(AuthState());

  void authenticated(
    UserModel user,
  ) {
    emit(AuthState.authenticated(user));
  }

  void unAuthenticated() {
    emit(AuthState.unAuthenticated());
  }

  void signOut() {
    unAuthenticated();
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state.toJson();
  }
}
