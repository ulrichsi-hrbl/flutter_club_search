import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/endpoints.dart';
import '../models/auth.dart';
import 'dio_auth_provider.dart';

part 'async_auth_provider.g.dart';

@riverpod
class Authenticate extends _$Authenticate {
  @override
  FutureOr<Authenticated> build() {
    ref.onDispose(() {
      print('[authenticateProvider disposed');
    });
    return fetchToken();
  }

  String? getCurrentToken(){
    return state.value?.accessToken;
  }

  FutureOr<Authenticated> fetchToken() async {
    final authDio = ref.watch(dioAuthProvider);
    final response = await authDio.post(Endpoints.loginURL, data: {
      'grant_type': 'password',
      'username': 'manasaworld@gmail.com',
      'client_id': 58,
      'password': 'test@123',
      'locale': 'en-US',
      'client_secret': '0B3BB70401B7F7601FCDE96C0C6AC0CD0CFCCE760923FC19C1BAE03208AA8CCC'
    });
    return Authenticated.fromJson(response.data);
  }
}
