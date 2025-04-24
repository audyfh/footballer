import 'package:footballer/core/error/server_exception.dart';
import 'package:footballer/features/auth/data/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemote {
  Future<UserModel> loginEmail(
      {required String email, required String password});
  Future<UserModel> registerEmail(
      {required String username,
      required String email,
      required String password});
}

class AuthRemoteImpl implements AuthRemote {
  final SupabaseClient supabaseClient;
  AuthRemoteImpl(this.supabaseClient);

  @override
  Future<UserModel> loginEmail(
      {required String email, required String password}) async {
    try {
      final res = await supabaseClient.auth
          .signInWithPassword(email: email, password: password);
      return UserModel.fromJson(res.user!.toJson());
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel> registerEmail(
      {required String username,
      required String email,
      required String password}) async {
    try {
      final res = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': username,
        }
      );
      return UserModel.fromJson(res.user!.toJson());
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
