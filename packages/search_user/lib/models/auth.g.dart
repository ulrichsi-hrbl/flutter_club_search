// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthenticatedImpl _$$AuthenticatedImplFromJson(Map<String, dynamic> json) =>
    _$AuthenticatedImpl(
      tokenType: json['token_type'] as String,
      expiresIn: (json['expires_in'] as num).toDouble(),
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$$AuthenticatedImplToJson(_$AuthenticatedImpl instance) =>
    <String, dynamic>{
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
