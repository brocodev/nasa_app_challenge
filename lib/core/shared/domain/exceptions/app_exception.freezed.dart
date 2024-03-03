// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) unknown,
    required TResult Function() timeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function() badCertificate,
    required TResult Function(String? message) badResponse,
    required TResult Function() cancel,
    required TResult Function() connectionError,
    required TResult Function() userNotFound,
    required TResult Function() notNetworkAccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? unknown,
    TResult? Function()? timeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function()? badCertificate,
    TResult? Function(String? message)? badResponse,
    TResult? Function()? cancel,
    TResult? Function()? connectionError,
    TResult? Function()? userNotFound,
    TResult? Function()? notNetworkAccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? unknown,
    TResult Function()? timeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function()? badCertificate,
    TResult Function(String? message)? badResponse,
    TResult Function()? cancel,
    TResult Function()? connectionError,
    TResult Function()? userNotFound,
    TResult Function()? notNetworkAccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownException value) unknown,
    required TResult Function(_TimeoutException value) timeout,
    required TResult Function(_SendTimeoutException value) sendTimeout,
    required TResult Function(_ReceiveTimeoutException value) receiveTimeout,
    required TResult Function(_BadCertificateException value) badCertificate,
    required TResult Function(_BadResponseException value) badResponse,
    required TResult Function(_CancelException value) cancel,
    required TResult Function(_ConnectionException value) connectionError,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_NotNetworkAccess value) notNetworkAccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnknownException value)? unknown,
    TResult? Function(_TimeoutException value)? timeout,
    TResult? Function(_SendTimeoutException value)? sendTimeout,
    TResult? Function(_ReceiveTimeoutException value)? receiveTimeout,
    TResult? Function(_BadCertificateException value)? badCertificate,
    TResult? Function(_BadResponseException value)? badResponse,
    TResult? Function(_CancelException value)? cancel,
    TResult? Function(_ConnectionException value)? connectionError,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_NotNetworkAccess value)? notNetworkAccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownException value)? unknown,
    TResult Function(_TimeoutException value)? timeout,
    TResult Function(_SendTimeoutException value)? sendTimeout,
    TResult Function(_ReceiveTimeoutException value)? receiveTimeout,
    TResult Function(_BadCertificateException value)? badCertificate,
    TResult Function(_BadResponseException value)? badResponse,
    TResult Function(_CancelException value)? cancel,
    TResult Function(_ConnectionException value)? connectionError,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_NotNetworkAccess value)? notNetworkAccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppExceptionCopyWith<$Res> {
  factory $AppExceptionCopyWith(
          AppException value, $Res Function(AppException) then) =
      _$AppExceptionCopyWithImpl<$Res, AppException>;
}

/// @nodoc
class _$AppExceptionCopyWithImpl<$Res, $Val extends AppException>
    implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UnknownExceptionImplCopyWith<$Res> {
  factory _$$UnknownExceptionImplCopyWith(_$UnknownExceptionImpl value,
          $Res Function(_$UnknownExceptionImpl) then) =
      __$$UnknownExceptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$UnknownExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$UnknownExceptionImpl>
    implements _$$UnknownExceptionImplCopyWith<$Res> {
  __$$UnknownExceptionImplCopyWithImpl(_$UnknownExceptionImpl _value,
      $Res Function(_$UnknownExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$UnknownExceptionImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnknownExceptionImpl
    with DiagnosticableTreeMixin
    implements _UnknownException {
  const _$UnknownExceptionImpl({required this.message});

  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppException.unknown(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppException.unknown'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownExceptionImplCopyWith<_$UnknownExceptionImpl> get copyWith =>
      __$$UnknownExceptionImplCopyWithImpl<_$UnknownExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) unknown,
    required TResult Function() timeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function() badCertificate,
    required TResult Function(String? message) badResponse,
    required TResult Function() cancel,
    required TResult Function() connectionError,
    required TResult Function() userNotFound,
    required TResult Function() notNetworkAccess,
  }) {
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? unknown,
    TResult? Function()? timeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function()? badCertificate,
    TResult? Function(String? message)? badResponse,
    TResult? Function()? cancel,
    TResult? Function()? connectionError,
    TResult? Function()? userNotFound,
    TResult? Function()? notNetworkAccess,
  }) {
    return unknown?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? unknown,
    TResult Function()? timeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function()? badCertificate,
    TResult Function(String? message)? badResponse,
    TResult Function()? cancel,
    TResult Function()? connectionError,
    TResult Function()? userNotFound,
    TResult Function()? notNetworkAccess,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownException value) unknown,
    required TResult Function(_TimeoutException value) timeout,
    required TResult Function(_SendTimeoutException value) sendTimeout,
    required TResult Function(_ReceiveTimeoutException value) receiveTimeout,
    required TResult Function(_BadCertificateException value) badCertificate,
    required TResult Function(_BadResponseException value) badResponse,
    required TResult Function(_CancelException value) cancel,
    required TResult Function(_ConnectionException value) connectionError,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_NotNetworkAccess value) notNetworkAccess,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnknownException value)? unknown,
    TResult? Function(_TimeoutException value)? timeout,
    TResult? Function(_SendTimeoutException value)? sendTimeout,
    TResult? Function(_ReceiveTimeoutException value)? receiveTimeout,
    TResult? Function(_BadCertificateException value)? badCertificate,
    TResult? Function(_BadResponseException value)? badResponse,
    TResult? Function(_CancelException value)? cancel,
    TResult? Function(_ConnectionException value)? connectionError,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_NotNetworkAccess value)? notNetworkAccess,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownException value)? unknown,
    TResult Function(_TimeoutException value)? timeout,
    TResult Function(_SendTimeoutException value)? sendTimeout,
    TResult Function(_ReceiveTimeoutException value)? receiveTimeout,
    TResult Function(_BadCertificateException value)? badCertificate,
    TResult Function(_BadResponseException value)? badResponse,
    TResult Function(_CancelException value)? cancel,
    TResult Function(_ConnectionException value)? connectionError,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_NotNetworkAccess value)? notNetworkAccess,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _UnknownException implements AppException {
  const factory _UnknownException({required final String? message}) =
      _$UnknownExceptionImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$UnknownExceptionImplCopyWith<_$UnknownExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimeoutExceptionImplCopyWith<$Res> {
  factory _$$TimeoutExceptionImplCopyWith(_$TimeoutExceptionImpl value,
          $Res Function(_$TimeoutExceptionImpl) then) =
      __$$TimeoutExceptionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimeoutExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$TimeoutExceptionImpl>
    implements _$$TimeoutExceptionImplCopyWith<$Res> {
  __$$TimeoutExceptionImplCopyWithImpl(_$TimeoutExceptionImpl _value,
      $Res Function(_$TimeoutExceptionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TimeoutExceptionImpl
    with DiagnosticableTreeMixin
    implements _TimeoutException {
  const _$TimeoutExceptionImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppException.timeout()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AppException.timeout'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimeoutExceptionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) unknown,
    required TResult Function() timeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function() badCertificate,
    required TResult Function(String? message) badResponse,
    required TResult Function() cancel,
    required TResult Function() connectionError,
    required TResult Function() userNotFound,
    required TResult Function() notNetworkAccess,
  }) {
    return timeout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? unknown,
    TResult? Function()? timeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function()? badCertificate,
    TResult? Function(String? message)? badResponse,
    TResult? Function()? cancel,
    TResult? Function()? connectionError,
    TResult? Function()? userNotFound,
    TResult? Function()? notNetworkAccess,
  }) {
    return timeout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? unknown,
    TResult Function()? timeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function()? badCertificate,
    TResult Function(String? message)? badResponse,
    TResult Function()? cancel,
    TResult Function()? connectionError,
    TResult Function()? userNotFound,
    TResult Function()? notNetworkAccess,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownException value) unknown,
    required TResult Function(_TimeoutException value) timeout,
    required TResult Function(_SendTimeoutException value) sendTimeout,
    required TResult Function(_ReceiveTimeoutException value) receiveTimeout,
    required TResult Function(_BadCertificateException value) badCertificate,
    required TResult Function(_BadResponseException value) badResponse,
    required TResult Function(_CancelException value) cancel,
    required TResult Function(_ConnectionException value) connectionError,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_NotNetworkAccess value) notNetworkAccess,
  }) {
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnknownException value)? unknown,
    TResult? Function(_TimeoutException value)? timeout,
    TResult? Function(_SendTimeoutException value)? sendTimeout,
    TResult? Function(_ReceiveTimeoutException value)? receiveTimeout,
    TResult? Function(_BadCertificateException value)? badCertificate,
    TResult? Function(_BadResponseException value)? badResponse,
    TResult? Function(_CancelException value)? cancel,
    TResult? Function(_ConnectionException value)? connectionError,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_NotNetworkAccess value)? notNetworkAccess,
  }) {
    return timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownException value)? unknown,
    TResult Function(_TimeoutException value)? timeout,
    TResult Function(_SendTimeoutException value)? sendTimeout,
    TResult Function(_ReceiveTimeoutException value)? receiveTimeout,
    TResult Function(_BadCertificateException value)? badCertificate,
    TResult Function(_BadResponseException value)? badResponse,
    TResult Function(_CancelException value)? cancel,
    TResult Function(_ConnectionException value)? connectionError,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_NotNetworkAccess value)? notNetworkAccess,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class _TimeoutException implements AppException {
  const factory _TimeoutException() = _$TimeoutExceptionImpl;
}

/// @nodoc
abstract class _$$SendTimeoutExceptionImplCopyWith<$Res> {
  factory _$$SendTimeoutExceptionImplCopyWith(_$SendTimeoutExceptionImpl value,
          $Res Function(_$SendTimeoutExceptionImpl) then) =
      __$$SendTimeoutExceptionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendTimeoutExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$SendTimeoutExceptionImpl>
    implements _$$SendTimeoutExceptionImplCopyWith<$Res> {
  __$$SendTimeoutExceptionImplCopyWithImpl(_$SendTimeoutExceptionImpl _value,
      $Res Function(_$SendTimeoutExceptionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SendTimeoutExceptionImpl
    with DiagnosticableTreeMixin
    implements _SendTimeoutException {
  const _$SendTimeoutExceptionImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppException.sendTimeout()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AppException.sendTimeout'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendTimeoutExceptionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) unknown,
    required TResult Function() timeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function() badCertificate,
    required TResult Function(String? message) badResponse,
    required TResult Function() cancel,
    required TResult Function() connectionError,
    required TResult Function() userNotFound,
    required TResult Function() notNetworkAccess,
  }) {
    return sendTimeout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? unknown,
    TResult? Function()? timeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function()? badCertificate,
    TResult? Function(String? message)? badResponse,
    TResult? Function()? cancel,
    TResult? Function()? connectionError,
    TResult? Function()? userNotFound,
    TResult? Function()? notNetworkAccess,
  }) {
    return sendTimeout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? unknown,
    TResult Function()? timeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function()? badCertificate,
    TResult Function(String? message)? badResponse,
    TResult Function()? cancel,
    TResult Function()? connectionError,
    TResult Function()? userNotFound,
    TResult Function()? notNetworkAccess,
    required TResult orElse(),
  }) {
    if (sendTimeout != null) {
      return sendTimeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownException value) unknown,
    required TResult Function(_TimeoutException value) timeout,
    required TResult Function(_SendTimeoutException value) sendTimeout,
    required TResult Function(_ReceiveTimeoutException value) receiveTimeout,
    required TResult Function(_BadCertificateException value) badCertificate,
    required TResult Function(_BadResponseException value) badResponse,
    required TResult Function(_CancelException value) cancel,
    required TResult Function(_ConnectionException value) connectionError,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_NotNetworkAccess value) notNetworkAccess,
  }) {
    return sendTimeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnknownException value)? unknown,
    TResult? Function(_TimeoutException value)? timeout,
    TResult? Function(_SendTimeoutException value)? sendTimeout,
    TResult? Function(_ReceiveTimeoutException value)? receiveTimeout,
    TResult? Function(_BadCertificateException value)? badCertificate,
    TResult? Function(_BadResponseException value)? badResponse,
    TResult? Function(_CancelException value)? cancel,
    TResult? Function(_ConnectionException value)? connectionError,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_NotNetworkAccess value)? notNetworkAccess,
  }) {
    return sendTimeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownException value)? unknown,
    TResult Function(_TimeoutException value)? timeout,
    TResult Function(_SendTimeoutException value)? sendTimeout,
    TResult Function(_ReceiveTimeoutException value)? receiveTimeout,
    TResult Function(_BadCertificateException value)? badCertificate,
    TResult Function(_BadResponseException value)? badResponse,
    TResult Function(_CancelException value)? cancel,
    TResult Function(_ConnectionException value)? connectionError,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_NotNetworkAccess value)? notNetworkAccess,
    required TResult orElse(),
  }) {
    if (sendTimeout != null) {
      return sendTimeout(this);
    }
    return orElse();
  }
}

abstract class _SendTimeoutException implements AppException {
  const factory _SendTimeoutException() = _$SendTimeoutExceptionImpl;
}

/// @nodoc
abstract class _$$ReceiveTimeoutExceptionImplCopyWith<$Res> {
  factory _$$ReceiveTimeoutExceptionImplCopyWith(
          _$ReceiveTimeoutExceptionImpl value,
          $Res Function(_$ReceiveTimeoutExceptionImpl) then) =
      __$$ReceiveTimeoutExceptionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReceiveTimeoutExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$ReceiveTimeoutExceptionImpl>
    implements _$$ReceiveTimeoutExceptionImplCopyWith<$Res> {
  __$$ReceiveTimeoutExceptionImplCopyWithImpl(
      _$ReceiveTimeoutExceptionImpl _value,
      $Res Function(_$ReceiveTimeoutExceptionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReceiveTimeoutExceptionImpl
    with DiagnosticableTreeMixin
    implements _ReceiveTimeoutException {
  const _$ReceiveTimeoutExceptionImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppException.receiveTimeout()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AppException.receiveTimeout'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiveTimeoutExceptionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) unknown,
    required TResult Function() timeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function() badCertificate,
    required TResult Function(String? message) badResponse,
    required TResult Function() cancel,
    required TResult Function() connectionError,
    required TResult Function() userNotFound,
    required TResult Function() notNetworkAccess,
  }) {
    return receiveTimeout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? unknown,
    TResult? Function()? timeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function()? badCertificate,
    TResult? Function(String? message)? badResponse,
    TResult? Function()? cancel,
    TResult? Function()? connectionError,
    TResult? Function()? userNotFound,
    TResult? Function()? notNetworkAccess,
  }) {
    return receiveTimeout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? unknown,
    TResult Function()? timeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function()? badCertificate,
    TResult Function(String? message)? badResponse,
    TResult Function()? cancel,
    TResult Function()? connectionError,
    TResult Function()? userNotFound,
    TResult Function()? notNetworkAccess,
    required TResult orElse(),
  }) {
    if (receiveTimeout != null) {
      return receiveTimeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownException value) unknown,
    required TResult Function(_TimeoutException value) timeout,
    required TResult Function(_SendTimeoutException value) sendTimeout,
    required TResult Function(_ReceiveTimeoutException value) receiveTimeout,
    required TResult Function(_BadCertificateException value) badCertificate,
    required TResult Function(_BadResponseException value) badResponse,
    required TResult Function(_CancelException value) cancel,
    required TResult Function(_ConnectionException value) connectionError,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_NotNetworkAccess value) notNetworkAccess,
  }) {
    return receiveTimeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnknownException value)? unknown,
    TResult? Function(_TimeoutException value)? timeout,
    TResult? Function(_SendTimeoutException value)? sendTimeout,
    TResult? Function(_ReceiveTimeoutException value)? receiveTimeout,
    TResult? Function(_BadCertificateException value)? badCertificate,
    TResult? Function(_BadResponseException value)? badResponse,
    TResult? Function(_CancelException value)? cancel,
    TResult? Function(_ConnectionException value)? connectionError,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_NotNetworkAccess value)? notNetworkAccess,
  }) {
    return receiveTimeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownException value)? unknown,
    TResult Function(_TimeoutException value)? timeout,
    TResult Function(_SendTimeoutException value)? sendTimeout,
    TResult Function(_ReceiveTimeoutException value)? receiveTimeout,
    TResult Function(_BadCertificateException value)? badCertificate,
    TResult Function(_BadResponseException value)? badResponse,
    TResult Function(_CancelException value)? cancel,
    TResult Function(_ConnectionException value)? connectionError,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_NotNetworkAccess value)? notNetworkAccess,
    required TResult orElse(),
  }) {
    if (receiveTimeout != null) {
      return receiveTimeout(this);
    }
    return orElse();
  }
}

abstract class _ReceiveTimeoutException implements AppException {
  const factory _ReceiveTimeoutException() = _$ReceiveTimeoutExceptionImpl;
}

/// @nodoc
abstract class _$$BadCertificateExceptionImplCopyWith<$Res> {
  factory _$$BadCertificateExceptionImplCopyWith(
          _$BadCertificateExceptionImpl value,
          $Res Function(_$BadCertificateExceptionImpl) then) =
      __$$BadCertificateExceptionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BadCertificateExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$BadCertificateExceptionImpl>
    implements _$$BadCertificateExceptionImplCopyWith<$Res> {
  __$$BadCertificateExceptionImplCopyWithImpl(
      _$BadCertificateExceptionImpl _value,
      $Res Function(_$BadCertificateExceptionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BadCertificateExceptionImpl
    with DiagnosticableTreeMixin
    implements _BadCertificateException {
  const _$BadCertificateExceptionImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppException.badCertificate()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AppException.badCertificate'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadCertificateExceptionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) unknown,
    required TResult Function() timeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function() badCertificate,
    required TResult Function(String? message) badResponse,
    required TResult Function() cancel,
    required TResult Function() connectionError,
    required TResult Function() userNotFound,
    required TResult Function() notNetworkAccess,
  }) {
    return badCertificate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? unknown,
    TResult? Function()? timeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function()? badCertificate,
    TResult? Function(String? message)? badResponse,
    TResult? Function()? cancel,
    TResult? Function()? connectionError,
    TResult? Function()? userNotFound,
    TResult? Function()? notNetworkAccess,
  }) {
    return badCertificate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? unknown,
    TResult Function()? timeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function()? badCertificate,
    TResult Function(String? message)? badResponse,
    TResult Function()? cancel,
    TResult Function()? connectionError,
    TResult Function()? userNotFound,
    TResult Function()? notNetworkAccess,
    required TResult orElse(),
  }) {
    if (badCertificate != null) {
      return badCertificate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownException value) unknown,
    required TResult Function(_TimeoutException value) timeout,
    required TResult Function(_SendTimeoutException value) sendTimeout,
    required TResult Function(_ReceiveTimeoutException value) receiveTimeout,
    required TResult Function(_BadCertificateException value) badCertificate,
    required TResult Function(_BadResponseException value) badResponse,
    required TResult Function(_CancelException value) cancel,
    required TResult Function(_ConnectionException value) connectionError,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_NotNetworkAccess value) notNetworkAccess,
  }) {
    return badCertificate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnknownException value)? unknown,
    TResult? Function(_TimeoutException value)? timeout,
    TResult? Function(_SendTimeoutException value)? sendTimeout,
    TResult? Function(_ReceiveTimeoutException value)? receiveTimeout,
    TResult? Function(_BadCertificateException value)? badCertificate,
    TResult? Function(_BadResponseException value)? badResponse,
    TResult? Function(_CancelException value)? cancel,
    TResult? Function(_ConnectionException value)? connectionError,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_NotNetworkAccess value)? notNetworkAccess,
  }) {
    return badCertificate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownException value)? unknown,
    TResult Function(_TimeoutException value)? timeout,
    TResult Function(_SendTimeoutException value)? sendTimeout,
    TResult Function(_ReceiveTimeoutException value)? receiveTimeout,
    TResult Function(_BadCertificateException value)? badCertificate,
    TResult Function(_BadResponseException value)? badResponse,
    TResult Function(_CancelException value)? cancel,
    TResult Function(_ConnectionException value)? connectionError,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_NotNetworkAccess value)? notNetworkAccess,
    required TResult orElse(),
  }) {
    if (badCertificate != null) {
      return badCertificate(this);
    }
    return orElse();
  }
}

abstract class _BadCertificateException implements AppException {
  const factory _BadCertificateException() = _$BadCertificateExceptionImpl;
}

/// @nodoc
abstract class _$$BadResponseExceptionImplCopyWith<$Res> {
  factory _$$BadResponseExceptionImplCopyWith(_$BadResponseExceptionImpl value,
          $Res Function(_$BadResponseExceptionImpl) then) =
      __$$BadResponseExceptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$BadResponseExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$BadResponseExceptionImpl>
    implements _$$BadResponseExceptionImplCopyWith<$Res> {
  __$$BadResponseExceptionImplCopyWithImpl(_$BadResponseExceptionImpl _value,
      $Res Function(_$BadResponseExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$BadResponseExceptionImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BadResponseExceptionImpl
    with DiagnosticableTreeMixin
    implements _BadResponseException {
  const _$BadResponseExceptionImpl({this.message});

  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppException.badResponse(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppException.badResponse'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadResponseExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BadResponseExceptionImplCopyWith<_$BadResponseExceptionImpl>
      get copyWith =>
          __$$BadResponseExceptionImplCopyWithImpl<_$BadResponseExceptionImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) unknown,
    required TResult Function() timeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function() badCertificate,
    required TResult Function(String? message) badResponse,
    required TResult Function() cancel,
    required TResult Function() connectionError,
    required TResult Function() userNotFound,
    required TResult Function() notNetworkAccess,
  }) {
    return badResponse(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? unknown,
    TResult? Function()? timeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function()? badCertificate,
    TResult? Function(String? message)? badResponse,
    TResult? Function()? cancel,
    TResult? Function()? connectionError,
    TResult? Function()? userNotFound,
    TResult? Function()? notNetworkAccess,
  }) {
    return badResponse?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? unknown,
    TResult Function()? timeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function()? badCertificate,
    TResult Function(String? message)? badResponse,
    TResult Function()? cancel,
    TResult Function()? connectionError,
    TResult Function()? userNotFound,
    TResult Function()? notNetworkAccess,
    required TResult orElse(),
  }) {
    if (badResponse != null) {
      return badResponse(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownException value) unknown,
    required TResult Function(_TimeoutException value) timeout,
    required TResult Function(_SendTimeoutException value) sendTimeout,
    required TResult Function(_ReceiveTimeoutException value) receiveTimeout,
    required TResult Function(_BadCertificateException value) badCertificate,
    required TResult Function(_BadResponseException value) badResponse,
    required TResult Function(_CancelException value) cancel,
    required TResult Function(_ConnectionException value) connectionError,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_NotNetworkAccess value) notNetworkAccess,
  }) {
    return badResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnknownException value)? unknown,
    TResult? Function(_TimeoutException value)? timeout,
    TResult? Function(_SendTimeoutException value)? sendTimeout,
    TResult? Function(_ReceiveTimeoutException value)? receiveTimeout,
    TResult? Function(_BadCertificateException value)? badCertificate,
    TResult? Function(_BadResponseException value)? badResponse,
    TResult? Function(_CancelException value)? cancel,
    TResult? Function(_ConnectionException value)? connectionError,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_NotNetworkAccess value)? notNetworkAccess,
  }) {
    return badResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownException value)? unknown,
    TResult Function(_TimeoutException value)? timeout,
    TResult Function(_SendTimeoutException value)? sendTimeout,
    TResult Function(_ReceiveTimeoutException value)? receiveTimeout,
    TResult Function(_BadCertificateException value)? badCertificate,
    TResult Function(_BadResponseException value)? badResponse,
    TResult Function(_CancelException value)? cancel,
    TResult Function(_ConnectionException value)? connectionError,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_NotNetworkAccess value)? notNetworkAccess,
    required TResult orElse(),
  }) {
    if (badResponse != null) {
      return badResponse(this);
    }
    return orElse();
  }
}

abstract class _BadResponseException implements AppException {
  const factory _BadResponseException({final String? message}) =
      _$BadResponseExceptionImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$BadResponseExceptionImplCopyWith<_$BadResponseExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelExceptionImplCopyWith<$Res> {
  factory _$$CancelExceptionImplCopyWith(_$CancelExceptionImpl value,
          $Res Function(_$CancelExceptionImpl) then) =
      __$$CancelExceptionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CancelExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$CancelExceptionImpl>
    implements _$$CancelExceptionImplCopyWith<$Res> {
  __$$CancelExceptionImplCopyWithImpl(
      _$CancelExceptionImpl _value, $Res Function(_$CancelExceptionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CancelExceptionImpl
    with DiagnosticableTreeMixin
    implements _CancelException {
  const _$CancelExceptionImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppException.cancel()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AppException.cancel'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CancelExceptionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) unknown,
    required TResult Function() timeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function() badCertificate,
    required TResult Function(String? message) badResponse,
    required TResult Function() cancel,
    required TResult Function() connectionError,
    required TResult Function() userNotFound,
    required TResult Function() notNetworkAccess,
  }) {
    return cancel();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? unknown,
    TResult? Function()? timeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function()? badCertificate,
    TResult? Function(String? message)? badResponse,
    TResult? Function()? cancel,
    TResult? Function()? connectionError,
    TResult? Function()? userNotFound,
    TResult? Function()? notNetworkAccess,
  }) {
    return cancel?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? unknown,
    TResult Function()? timeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function()? badCertificate,
    TResult Function(String? message)? badResponse,
    TResult Function()? cancel,
    TResult Function()? connectionError,
    TResult Function()? userNotFound,
    TResult Function()? notNetworkAccess,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownException value) unknown,
    required TResult Function(_TimeoutException value) timeout,
    required TResult Function(_SendTimeoutException value) sendTimeout,
    required TResult Function(_ReceiveTimeoutException value) receiveTimeout,
    required TResult Function(_BadCertificateException value) badCertificate,
    required TResult Function(_BadResponseException value) badResponse,
    required TResult Function(_CancelException value) cancel,
    required TResult Function(_ConnectionException value) connectionError,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_NotNetworkAccess value) notNetworkAccess,
  }) {
    return cancel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnknownException value)? unknown,
    TResult? Function(_TimeoutException value)? timeout,
    TResult? Function(_SendTimeoutException value)? sendTimeout,
    TResult? Function(_ReceiveTimeoutException value)? receiveTimeout,
    TResult? Function(_BadCertificateException value)? badCertificate,
    TResult? Function(_BadResponseException value)? badResponse,
    TResult? Function(_CancelException value)? cancel,
    TResult? Function(_ConnectionException value)? connectionError,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_NotNetworkAccess value)? notNetworkAccess,
  }) {
    return cancel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownException value)? unknown,
    TResult Function(_TimeoutException value)? timeout,
    TResult Function(_SendTimeoutException value)? sendTimeout,
    TResult Function(_ReceiveTimeoutException value)? receiveTimeout,
    TResult Function(_BadCertificateException value)? badCertificate,
    TResult Function(_BadResponseException value)? badResponse,
    TResult Function(_CancelException value)? cancel,
    TResult Function(_ConnectionException value)? connectionError,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_NotNetworkAccess value)? notNetworkAccess,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel(this);
    }
    return orElse();
  }
}

abstract class _CancelException implements AppException {
  const factory _CancelException() = _$CancelExceptionImpl;
}

/// @nodoc
abstract class _$$ConnectionExceptionImplCopyWith<$Res> {
  factory _$$ConnectionExceptionImplCopyWith(_$ConnectionExceptionImpl value,
          $Res Function(_$ConnectionExceptionImpl) then) =
      __$$ConnectionExceptionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectionExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$ConnectionExceptionImpl>
    implements _$$ConnectionExceptionImplCopyWith<$Res> {
  __$$ConnectionExceptionImplCopyWithImpl(_$ConnectionExceptionImpl _value,
      $Res Function(_$ConnectionExceptionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ConnectionExceptionImpl
    with DiagnosticableTreeMixin
    implements _ConnectionException {
  const _$ConnectionExceptionImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppException.connectionError()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AppException.connectionError'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionExceptionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) unknown,
    required TResult Function() timeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function() badCertificate,
    required TResult Function(String? message) badResponse,
    required TResult Function() cancel,
    required TResult Function() connectionError,
    required TResult Function() userNotFound,
    required TResult Function() notNetworkAccess,
  }) {
    return connectionError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? unknown,
    TResult? Function()? timeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function()? badCertificate,
    TResult? Function(String? message)? badResponse,
    TResult? Function()? cancel,
    TResult? Function()? connectionError,
    TResult? Function()? userNotFound,
    TResult? Function()? notNetworkAccess,
  }) {
    return connectionError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? unknown,
    TResult Function()? timeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function()? badCertificate,
    TResult Function(String? message)? badResponse,
    TResult Function()? cancel,
    TResult Function()? connectionError,
    TResult Function()? userNotFound,
    TResult Function()? notNetworkAccess,
    required TResult orElse(),
  }) {
    if (connectionError != null) {
      return connectionError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownException value) unknown,
    required TResult Function(_TimeoutException value) timeout,
    required TResult Function(_SendTimeoutException value) sendTimeout,
    required TResult Function(_ReceiveTimeoutException value) receiveTimeout,
    required TResult Function(_BadCertificateException value) badCertificate,
    required TResult Function(_BadResponseException value) badResponse,
    required TResult Function(_CancelException value) cancel,
    required TResult Function(_ConnectionException value) connectionError,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_NotNetworkAccess value) notNetworkAccess,
  }) {
    return connectionError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnknownException value)? unknown,
    TResult? Function(_TimeoutException value)? timeout,
    TResult? Function(_SendTimeoutException value)? sendTimeout,
    TResult? Function(_ReceiveTimeoutException value)? receiveTimeout,
    TResult? Function(_BadCertificateException value)? badCertificate,
    TResult? Function(_BadResponseException value)? badResponse,
    TResult? Function(_CancelException value)? cancel,
    TResult? Function(_ConnectionException value)? connectionError,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_NotNetworkAccess value)? notNetworkAccess,
  }) {
    return connectionError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownException value)? unknown,
    TResult Function(_TimeoutException value)? timeout,
    TResult Function(_SendTimeoutException value)? sendTimeout,
    TResult Function(_ReceiveTimeoutException value)? receiveTimeout,
    TResult Function(_BadCertificateException value)? badCertificate,
    TResult Function(_BadResponseException value)? badResponse,
    TResult Function(_CancelException value)? cancel,
    TResult Function(_ConnectionException value)? connectionError,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_NotNetworkAccess value)? notNetworkAccess,
    required TResult orElse(),
  }) {
    if (connectionError != null) {
      return connectionError(this);
    }
    return orElse();
  }
}

abstract class _ConnectionException implements AppException {
  const factory _ConnectionException() = _$ConnectionExceptionImpl;
}

/// @nodoc
abstract class _$$UserNotFoundImplCopyWith<$Res> {
  factory _$$UserNotFoundImplCopyWith(
          _$UserNotFoundImpl value, $Res Function(_$UserNotFoundImpl) then) =
      __$$UserNotFoundImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserNotFoundImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$UserNotFoundImpl>
    implements _$$UserNotFoundImplCopyWith<$Res> {
  __$$UserNotFoundImplCopyWithImpl(
      _$UserNotFoundImpl _value, $Res Function(_$UserNotFoundImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserNotFoundImpl with DiagnosticableTreeMixin implements _UserNotFound {
  const _$UserNotFoundImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppException.userNotFound()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AppException.userNotFound'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserNotFoundImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) unknown,
    required TResult Function() timeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function() badCertificate,
    required TResult Function(String? message) badResponse,
    required TResult Function() cancel,
    required TResult Function() connectionError,
    required TResult Function() userNotFound,
    required TResult Function() notNetworkAccess,
  }) {
    return userNotFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? unknown,
    TResult? Function()? timeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function()? badCertificate,
    TResult? Function(String? message)? badResponse,
    TResult? Function()? cancel,
    TResult? Function()? connectionError,
    TResult? Function()? userNotFound,
    TResult? Function()? notNetworkAccess,
  }) {
    return userNotFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? unknown,
    TResult Function()? timeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function()? badCertificate,
    TResult Function(String? message)? badResponse,
    TResult Function()? cancel,
    TResult Function()? connectionError,
    TResult Function()? userNotFound,
    TResult Function()? notNetworkAccess,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownException value) unknown,
    required TResult Function(_TimeoutException value) timeout,
    required TResult Function(_SendTimeoutException value) sendTimeout,
    required TResult Function(_ReceiveTimeoutException value) receiveTimeout,
    required TResult Function(_BadCertificateException value) badCertificate,
    required TResult Function(_BadResponseException value) badResponse,
    required TResult Function(_CancelException value) cancel,
    required TResult Function(_ConnectionException value) connectionError,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_NotNetworkAccess value) notNetworkAccess,
  }) {
    return userNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnknownException value)? unknown,
    TResult? Function(_TimeoutException value)? timeout,
    TResult? Function(_SendTimeoutException value)? sendTimeout,
    TResult? Function(_ReceiveTimeoutException value)? receiveTimeout,
    TResult? Function(_BadCertificateException value)? badCertificate,
    TResult? Function(_BadResponseException value)? badResponse,
    TResult? Function(_CancelException value)? cancel,
    TResult? Function(_ConnectionException value)? connectionError,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_NotNetworkAccess value)? notNetworkAccess,
  }) {
    return userNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownException value)? unknown,
    TResult Function(_TimeoutException value)? timeout,
    TResult Function(_SendTimeoutException value)? sendTimeout,
    TResult Function(_ReceiveTimeoutException value)? receiveTimeout,
    TResult Function(_BadCertificateException value)? badCertificate,
    TResult Function(_BadResponseException value)? badResponse,
    TResult Function(_CancelException value)? cancel,
    TResult Function(_ConnectionException value)? connectionError,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_NotNetworkAccess value)? notNetworkAccess,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound(this);
    }
    return orElse();
  }
}

abstract class _UserNotFound implements AppException {
  const factory _UserNotFound() = _$UserNotFoundImpl;
}

/// @nodoc
abstract class _$$NotNetworkAccessImplCopyWith<$Res> {
  factory _$$NotNetworkAccessImplCopyWith(_$NotNetworkAccessImpl value,
          $Res Function(_$NotNetworkAccessImpl) then) =
      __$$NotNetworkAccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotNetworkAccessImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$NotNetworkAccessImpl>
    implements _$$NotNetworkAccessImplCopyWith<$Res> {
  __$$NotNetworkAccessImplCopyWithImpl(_$NotNetworkAccessImpl _value,
      $Res Function(_$NotNetworkAccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotNetworkAccessImpl
    with DiagnosticableTreeMixin
    implements _NotNetworkAccess {
  const _$NotNetworkAccessImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppException.notNetworkAccess()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'AppException.notNetworkAccess'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotNetworkAccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) unknown,
    required TResult Function() timeout,
    required TResult Function() sendTimeout,
    required TResult Function() receiveTimeout,
    required TResult Function() badCertificate,
    required TResult Function(String? message) badResponse,
    required TResult Function() cancel,
    required TResult Function() connectionError,
    required TResult Function() userNotFound,
    required TResult Function() notNetworkAccess,
  }) {
    return notNetworkAccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? unknown,
    TResult? Function()? timeout,
    TResult? Function()? sendTimeout,
    TResult? Function()? receiveTimeout,
    TResult? Function()? badCertificate,
    TResult? Function(String? message)? badResponse,
    TResult? Function()? cancel,
    TResult? Function()? connectionError,
    TResult? Function()? userNotFound,
    TResult? Function()? notNetworkAccess,
  }) {
    return notNetworkAccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? unknown,
    TResult Function()? timeout,
    TResult Function()? sendTimeout,
    TResult Function()? receiveTimeout,
    TResult Function()? badCertificate,
    TResult Function(String? message)? badResponse,
    TResult Function()? cancel,
    TResult Function()? connectionError,
    TResult Function()? userNotFound,
    TResult Function()? notNetworkAccess,
    required TResult orElse(),
  }) {
    if (notNetworkAccess != null) {
      return notNetworkAccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownException value) unknown,
    required TResult Function(_TimeoutException value) timeout,
    required TResult Function(_SendTimeoutException value) sendTimeout,
    required TResult Function(_ReceiveTimeoutException value) receiveTimeout,
    required TResult Function(_BadCertificateException value) badCertificate,
    required TResult Function(_BadResponseException value) badResponse,
    required TResult Function(_CancelException value) cancel,
    required TResult Function(_ConnectionException value) connectionError,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_NotNetworkAccess value) notNetworkAccess,
  }) {
    return notNetworkAccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnknownException value)? unknown,
    TResult? Function(_TimeoutException value)? timeout,
    TResult? Function(_SendTimeoutException value)? sendTimeout,
    TResult? Function(_ReceiveTimeoutException value)? receiveTimeout,
    TResult? Function(_BadCertificateException value)? badCertificate,
    TResult? Function(_BadResponseException value)? badResponse,
    TResult? Function(_CancelException value)? cancel,
    TResult? Function(_ConnectionException value)? connectionError,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_NotNetworkAccess value)? notNetworkAccess,
  }) {
    return notNetworkAccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownException value)? unknown,
    TResult Function(_TimeoutException value)? timeout,
    TResult Function(_SendTimeoutException value)? sendTimeout,
    TResult Function(_ReceiveTimeoutException value)? receiveTimeout,
    TResult Function(_BadCertificateException value)? badCertificate,
    TResult Function(_BadResponseException value)? badResponse,
    TResult Function(_CancelException value)? cancel,
    TResult Function(_ConnectionException value)? connectionError,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_NotNetworkAccess value)? notNetworkAccess,
    required TResult orElse(),
  }) {
    if (notNetworkAccess != null) {
      return notNetworkAccess(this);
    }
    return orElse();
  }
}

abstract class _NotNetworkAccess implements AppException {
  const factory _NotNetworkAccess() = _$NotNetworkAccessImpl;
}
