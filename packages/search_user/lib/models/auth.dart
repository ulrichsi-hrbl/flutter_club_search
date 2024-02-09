import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
class Authenticated with _$Authenticated {
  const factory Authenticated({
    @JsonKey(name: 'token_type') required String tokenType,
    @JsonKey(name: 'expires_in') required double expiresIn,
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
  }) = _Authenticated;

  factory Authenticated.fromJson(Map<String, dynamic> json) =>
      _$AuthenticatedFromJson(json);

  factory Authenticated.empty() => const Authenticated(
      tokenType: '',
      expiresIn: double.infinity,
      accessToken: '',
      refreshToken: '');
}
