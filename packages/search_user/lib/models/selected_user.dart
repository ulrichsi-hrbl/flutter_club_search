import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'selected_user.freezed.dart';
part 'selected_user.g.dart';

@freezed
class SelectedUser with _$SelectedUser {
  const factory SelectedUser({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String id,
  }) = _SelectedUser;

  factory SelectedUser.fromJson(Map<String, dynamic> json) =>
      _$SelectedUserFromJson(json);

  factory SelectedUser.empty() => const SelectedUser(
      email: '', firstName: '', id: '', lastName: '', phoneNumber: '');

  factory SelectedUser.add(
          {required firstName,
          required lastName,
          required email,
          required phoneNumber,
          required id}) =>
      SelectedUser(
          firstName: firstName,
          lastName: lastName,
          email: email,
          phoneNumber: phoneNumber,
          id: id);
}
