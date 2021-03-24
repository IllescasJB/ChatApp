import 'package:chatApp/data/auth_repository.dart';
import 'package:chatApp/domain/models/auth_user.dart';

class AuthLocalImpl extends AuthRepository {
  @override
  Future<AuthUser> getAuthUser() async {
    await Future.delayed(const Duration(seconds: 2));
    return AuthUser('jovaniillescas');
  }

  @override
  Future<AuthUser> signIn() async {
    await Future.delayed(const Duration(seconds: 2));
    return AuthUser('jovaniillescas');
  }

  @override
  Future<void> logout() async {
    return;
  }
}
