// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthStateImpl _$$AuthStateImplFromJson(Map<String, dynamic> json) =>
    _$AuthStateImpl(
      authStatus:
          $enumDecodeNullable(_$AuthStatusEnumMap, json['authStatus']) ??
              AuthStatus.unAuthenticated,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AuthStateImplToJson(_$AuthStateImpl instance) =>
    <String, dynamic>{
      'authStatus': _$AuthStatusEnumMap[instance.authStatus]!,
      'user': instance.user,
    };

const _$AuthStatusEnumMap = {
  AuthStatus.authenticated: 'authenticated',
  AuthStatus.unAuthenticated: 'unAuthenticated',
};
