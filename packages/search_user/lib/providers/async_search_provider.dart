import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/endpoints.dart';
import '../models/selected_user.dart';
import 'async_current_profile.dart';
import 'dio_engage_provider.dart';

part 'async_search_provider.g.dart';

@riverpod
class AsyncSearch extends _$AsyncSearch {
  String _selectedId = '';

  void setSelectedId(String str) {
    _selectedId = str;
  }

  @override
  FutureOr<List<SelectedUser>> build() async {
    final currentProfile = ref.watch(currentProfileProvider).value;
    ref.onDispose(() {
      _selectedId = '';
      print('[AsyncSearchProvider] disposed');
    });
    // await fetchSearchResult('manasa');
    return searchUsers(currentProfile!.firstName);
  }

  FutureOr<void> fetchSearchResult(String searchQuery) async {
    state = const AsyncValue.loading();
    // state = AsyncValue.guard(() => [
    //   SelectedUser.add(
    //     email: 'ulisinn@gmail.com',
    //     firstName: 'Uli',
    //     lastName: "sinn",
    //     id: '123',
    //     phoneNumber: '323-481-4060',
    //   )
    // ]);

    final dio = ref.watch(dioEngageProvider);
    final searchData = {
      'firstName': searchQuery,
      'lastName': null,
      'nutritionClub': null,
      'isGlobalSearch': true,
      'pagingParameters': {'skip': 0, 'take': 500},
      'phone': null,
      'email': null,
    };
    List<SelectedUser> newState = [];
    // print("SEARCH DATA $searchData");
    final response =
        await dio.post(Endpoints.getSearchProfile, data: searchData);
    print('#result ${response.data.length}');
    for (var i = 0; i < response.data.length; i++) {
      var email = '';
      var emailList = response.data[i]['emails'];

      try {
        if (emailList.length > 0) {
          email = response.data[i]['emails']?[0]['emailId'];
        }
      } catch (e) {
        // TODO
      }

      var phoneNumber = '';
      var phoneList = response.data[i]['phones'];

      try {
        if (phoneList.length > 0) {
          phoneNumber = response.data[i]['phones']?[0]['phoneNumber'];
        }
      } catch (e) {
        // TODO
      }

      final user = SelectedUser(
          firstName: response.data[i]['firstName'],
          lastName: response.data[i]['lastName'] ?? 'Sinn',
          email: email,
          phoneNumber: phoneNumber,
          id: response.data[i]['mdmProfileId'].toString());
      newState.add(user);
      // print('SEARCH DATA $user');
    }
    print('newState ${newState.length}');
    state = AsyncValue.data(newState);

    // return [
    //   SelectedUser.add(
    //     email: 'ulisinn@gmail.com',
    //     firstName: 'Uli',
    //     lastName: "sinn",
    //     id: '123',
    //     phoneNumber: '323-481-4060',
    //   )
    // ];

    // state = await AsyncValue.guard(Future.value(newState));
  }

  SelectedUser getSelectedProfile() {
    for (final user in state.value!) {
      if (user.id == _selectedId) {
        return user;
      }
    }
    return SelectedUser.empty();
  }

  Future<List<SelectedUser>> searchUsers(String searchQuery) async {
    final dio = ref.watch(dioEngageProvider);
    final searchData = {
      'firstName': searchQuery,
      'lastName': null,
      'nutritionClub': null,
      'isGlobalSearch': true,
      'pagingParameters': {'skip': 0, 'take': 500},
      'phone': null,
      'email': null,
    };
    List<SelectedUser> newState = [];

    final response =
        await dio.post(Endpoints.getSearchProfile, data: searchData);
    print('#result ${response.data.length}');
    for (var i = 0; i < response.data.length; i++) {
      var email = '';
      var emailList = response.data[i]['emails'];

      try {
        if (emailList.length > 0) {
          email = response.data[i]['emails']?[0]['emailId'];
        }
      } catch (e) {
        // TODO
      }

      var phoneNumber = '';
      var phoneList = response.data[i]['phones'];

      try {
        if (phoneList.length > 0) {
          phoneNumber = response.data[i]['phones']?[0]['phoneNumber'];
        }
      } catch (e) {
        // TODO
      }

      final user = SelectedUser(
          firstName: response.data[i]['firstName'],
          lastName: response.data[i]['lastName'] ?? 'Sinn',
          email: email,
          phoneNumber: phoneNumber,
          id: response.data[i]['mdmProfileId'].toString());
      newState.add(user);
      // print('SEARCH DATA $user');
    }

    return newState;
  }
}
