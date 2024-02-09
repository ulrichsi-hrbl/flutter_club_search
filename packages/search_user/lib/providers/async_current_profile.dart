import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/endpoints.dart';
import '../models/selected_user.dart';
import 'dio_engage_provider.dart';

part 'async_current_profile.g.dart';

@riverpod
class CurrentProfile extends _$CurrentProfile {
  @override
  FutureOr<SelectedUser> build() {
    return fetchCurrentUser();
  }

  Future<SelectedUser> fetchCurrentUser() async {
    final dio = ref.watch(dioEngageProvider);
    final response = await dio.get(Endpoints.getUser);

    final loggedInUser = SelectedUser(
        firstName: response.data['data']['firstName'] ?? '',
        lastName: response.data['data']['lastName'] ?? '',
        email: response.data['data']['email'] ?? '',
        phoneNumber: response.data['data']['phoneNumber'] ?? '',
        id: response.data['data']['id'] ?? '');

    // print('fetchCurrentUser $loggedInUser');

    return loggedInUser;
  }
}
