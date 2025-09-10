// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'simple.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DirSizeResult {
  String get path;
  int get nFiles;
  BigInt get len;

  /// Create a copy of DirSizeResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DirSizeResultCopyWith<DirSizeResult> get copyWith =>
      _$DirSizeResultCopyWithImpl<DirSizeResult>(this as DirSizeResult, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DirSizeResult &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.nFiles, nFiles) || other.nFiles == nFiles) &&
            (identical(other.len, len) || other.len == len));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path, nFiles, len);

  @override
  String toString() {
    return 'DirSizeResult(path: $path, nFiles: $nFiles, len: $len)';
  }
}

/// @nodoc
abstract mixin class $DirSizeResultCopyWith<$Res> {
  factory $DirSizeResultCopyWith(DirSizeResult value, $Res Function(DirSizeResult) _then) = _$DirSizeResultCopyWithImpl;
  @useResult
  $Res call({String path, int nFiles, BigInt len});
}

/// @nodoc
class _$DirSizeResultCopyWithImpl<$Res> implements $DirSizeResultCopyWith<$Res> {
  _$DirSizeResultCopyWithImpl(this._self, this._then);

  final DirSizeResult _self;
  final $Res Function(DirSizeResult) _then;

  /// Create a copy of DirSizeResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? nFiles = null,
    Object? len = null,
  }) {
    return _then(_self.copyWith(
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      nFiles: null == nFiles
          ? _self.nFiles
          : nFiles // ignore: cast_nullable_to_non_nullable
              as int,
      len: null == len
          ? _self.len
          : len // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class _DirSizeResult implements DirSizeResult {
  const _DirSizeResult({required this.path, required this.nFiles, required this.len});

  @override
  final String path;
  @override
  final int nFiles;
  @override
  final BigInt len;

  /// Create a copy of DirSizeResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DirSizeResultCopyWith<_DirSizeResult> get copyWith =>
      __$DirSizeResultCopyWithImpl<_DirSizeResult>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DirSizeResult &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.nFiles, nFiles) || other.nFiles == nFiles) &&
            (identical(other.len, len) || other.len == len));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path, nFiles, len);

  @override
  String toString() {
    return 'DirSizeResult(path: $path, nFiles: $nFiles, len: $len)';
  }
}

/// @nodoc
abstract mixin class _$DirSizeResultCopyWith<$Res> implements $DirSizeResultCopyWith<$Res> {
  factory _$DirSizeResultCopyWith(_DirSizeResult value, $Res Function(_DirSizeResult) _then) =
      __$DirSizeResultCopyWithImpl;
  @override
  @useResult
  $Res call({String path, int nFiles, BigInt len});
}

/// @nodoc
class __$DirSizeResultCopyWithImpl<$Res> implements _$DirSizeResultCopyWith<$Res> {
  __$DirSizeResultCopyWithImpl(this._self, this._then);

  final _DirSizeResult _self;
  final $Res Function(_DirSizeResult) _then;

  /// Create a copy of DirSizeResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? path = null,
    Object? nFiles = null,
    Object? len = null,
  }) {
    return _then(_DirSizeResult(
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      nFiles: null == nFiles
          ? _self.nFiles
          : nFiles // ignore: cast_nullable_to_non_nullable
              as int,
      len: null == len
          ? _self.len
          : len // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc
mixin _$FilesInDirResult {
  String get path;
  List<FSEntityInfo> get files;

  /// Create a copy of FilesInDirResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FilesInDirResultCopyWith<FilesInDirResult> get copyWith =>
      _$FilesInDirResultCopyWithImpl<FilesInDirResult>(this as FilesInDirResult, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FilesInDirResult &&
            (identical(other.path, path) || other.path == path) &&
            const DeepCollectionEquality().equals(other.files, files));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path, const DeepCollectionEquality().hash(files));

  @override
  String toString() {
    return 'FilesInDirResult(path: $path, files: $files)';
  }
}

/// @nodoc
abstract mixin class $FilesInDirResultCopyWith<$Res> {
  factory $FilesInDirResultCopyWith(FilesInDirResult value, $Res Function(FilesInDirResult) _then) =
      _$FilesInDirResultCopyWithImpl;
  @useResult
  $Res call({String path, List<FSEntityInfo> files});
}

/// @nodoc
class _$FilesInDirResultCopyWithImpl<$Res> implements $FilesInDirResultCopyWith<$Res> {
  _$FilesInDirResultCopyWithImpl(this._self, this._then);

  final FilesInDirResult _self;
  final $Res Function(FilesInDirResult) _then;

  /// Create a copy of FilesInDirResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? files = null,
  }) {
    return _then(_self.copyWith(
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      files: null == files
          ? _self.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FSEntityInfo>,
    ));
  }
}

/// @nodoc

class _FilesInDirResult implements FilesInDirResult {
  const _FilesInDirResult({required this.path, required final List<FSEntityInfo> files}) : _files = files;

  @override
  final String path;
  final List<FSEntityInfo> _files;
  @override
  List<FSEntityInfo> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  /// Create a copy of FilesInDirResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FilesInDirResultCopyWith<_FilesInDirResult> get copyWith =>
      __$FilesInDirResultCopyWithImpl<_FilesInDirResult>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FilesInDirResult &&
            (identical(other.path, path) || other.path == path) &&
            const DeepCollectionEquality().equals(other._files, _files));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path, const DeepCollectionEquality().hash(_files));

  @override
  String toString() {
    return 'FilesInDirResult(path: $path, files: $files)';
  }
}

/// @nodoc
abstract mixin class _$FilesInDirResultCopyWith<$Res> implements $FilesInDirResultCopyWith<$Res> {
  factory _$FilesInDirResultCopyWith(_FilesInDirResult value, $Res Function(_FilesInDirResult) _then) =
      __$FilesInDirResultCopyWithImpl;
  @override
  @useResult
  $Res call({String path, List<FSEntityInfo> files});
}

/// @nodoc
class __$FilesInDirResultCopyWithImpl<$Res> implements _$FilesInDirResultCopyWith<$Res> {
  __$FilesInDirResultCopyWithImpl(this._self, this._then);

  final _FilesInDirResult _self;
  final $Res Function(_FilesInDirResult) _then;

  /// Create a copy of FilesInDirResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? path = null,
    Object? files = null,
  }) {
    return _then(_FilesInDirResult(
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      files: null == files
          ? _self._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FSEntityInfo>,
    ));
  }
}

/// @nodoc
mixin _$FSEntityInfo {
  String get path;
  BigInt get len;

  /// Create a copy of FSEntityInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FSEntityInfoCopyWith<FSEntityInfo> get copyWith =>
      _$FSEntityInfoCopyWithImpl<FSEntityInfo>(this as FSEntityInfo, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FSEntityInfo &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.len, len) || other.len == len));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path, len);

  @override
  String toString() {
    return 'FSEntityInfo(path: $path, len: $len)';
  }
}

/// @nodoc
abstract mixin class $FSEntityInfoCopyWith<$Res> {
  factory $FSEntityInfoCopyWith(FSEntityInfo value, $Res Function(FSEntityInfo) _then) = _$FSEntityInfoCopyWithImpl;
  @useResult
  $Res call({String path, BigInt len});
}

/// @nodoc
class _$FSEntityInfoCopyWithImpl<$Res> implements $FSEntityInfoCopyWith<$Res> {
  _$FSEntityInfoCopyWithImpl(this._self, this._then);

  final FSEntityInfo _self;
  final $Res Function(FSEntityInfo) _then;

  /// Create a copy of FSEntityInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? len = null,
  }) {
    return _then(_self.copyWith(
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      len: null == len
          ? _self.len
          : len // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class _FSEntityInfo implements FSEntityInfo {
  const _FSEntityInfo({required this.path, required this.len});

  @override
  final String path;
  @override
  final BigInt len;

  /// Create a copy of FSEntityInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FSEntityInfoCopyWith<_FSEntityInfo> get copyWith => __$FSEntityInfoCopyWithImpl<_FSEntityInfo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FSEntityInfo &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.len, len) || other.len == len));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path, len);

  @override
  String toString() {
    return 'FSEntityInfo(path: $path, len: $len)';
  }
}

/// @nodoc
abstract mixin class _$FSEntityInfoCopyWith<$Res> implements $FSEntityInfoCopyWith<$Res> {
  factory _$FSEntityInfoCopyWith(_FSEntityInfo value, $Res Function(_FSEntityInfo) _then) = __$FSEntityInfoCopyWithImpl;
  @override
  @useResult
  $Res call({String path, BigInt len});
}

/// @nodoc
class __$FSEntityInfoCopyWithImpl<$Res> implements _$FSEntityInfoCopyWith<$Res> {
  __$FSEntityInfoCopyWithImpl(this._self, this._then);

  final _FSEntityInfo _self;
  final $Res Function(_FSEntityInfo) _then;

  /// Create a copy of FSEntityInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? path = null,
    Object? len = null,
  }) {
    return _then(_FSEntityInfo(
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      len: null == len
          ? _self.len
          : len // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

// dart format on
