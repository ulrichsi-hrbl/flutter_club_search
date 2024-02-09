// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SelectedUser _$SelectedUserFromJson(Map<String, dynamic> json) {
  return _SelectedUser.fromJson(json);
}

/// @nodoc
mixin _$SelectedUser {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectedUserCopyWith<SelectedUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedUserCopyWith<$Res> {
  factory $SelectedUserCopyWith(
          SelectedUser value, $Res Function(SelectedUser) then) =
      _$SelectedUserCopyWithImpl<$Res, SelectedUser>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String phoneNumber,
      String id});
}

/// @nodoc
class _$SelectedUserCopyWithImpl<$Res, $Val extends SelectedUser>
    implements $SelectedUserCopyWith<$Res> {
  _$SelectedUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectedUserImplCopyWith<$Res>
    implements $SelectedUserCopyWith<$Res> {
  factory _$$SelectedUserImplCopyWith(
          _$SelectedUserImpl value, $Res Function(_$SelectedUserImpl) then) =
      __$$SelectedUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String phoneNumber,
      String id});
}

/// @nodoc
class __$$SelectedUserImplCopyWithImpl<$Res>
    extends _$SelectedUserCopyWithImpl<$Res, _$SelectedUserImpl>
    implements _$$SelectedUserImplCopyWith<$Res> {
  __$$SelectedUserImplCopyWithImpl(
      _$SelectedUserImpl _value, $Res Function(_$SelectedUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? id = null,
  }) {
    return _then(_$SelectedUserImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectedUserImpl with DiagnosticableTreeMixin implements _SelectedUser {
  const _$SelectedUserImpl(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.id});

  factory _$SelectedUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectedUserImplFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SelectedUser(firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SelectedUser'))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedUserImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, firstName, lastName, email, phoneNumber, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedUserImplCopyWith<_$SelectedUserImpl> get copyWith =>
      __$$SelectedUserImplCopyWithImpl<_$SelectedUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectedUserImplToJson(
      this,
    );
  }
}

abstract class _SelectedUser implements SelectedUser {
  const factory _SelectedUser(
      {required final String firstName,
      required final String lastName,
      required final String email,
      required final String phoneNumber,
      required final String id}) = _$SelectedUserImpl;

  factory _SelectedUser.fromJson(Map<String, dynamic> json) =
      _$SelectedUserImpl.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$SelectedUserImplCopyWith<_$SelectedUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
