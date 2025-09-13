// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ToolsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ToolsState()';
}


}

/// @nodoc
class $ToolsStateCopyWith<$Res>  {
$ToolsStateCopyWith(ToolsState _, $Res Function(ToolsState) __);
}


/// Adds pattern-matching-related methods to [ToolsState].
extension ToolsStatePatterns on ToolsState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ToolsStateLoading value)?  loading,TResult Function( ToolsStateData value)?  data,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ToolsStateLoading() when loading != null:
return loading(_that);case ToolsStateData() when data != null:
return data(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ToolsStateLoading value)  loading,required TResult Function( ToolsStateData value)  data,}){
final _that = this;
switch (_that) {
case ToolsStateLoading():
return loading(_that);case ToolsStateData():
return data(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ToolsStateLoading value)?  loading,TResult? Function( ToolsStateData value)?  data,}){
final _that = this;
switch (_that) {
case ToolsStateLoading() when loading != null:
return loading(_that);case ToolsStateData() when data != null:
return data(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<Tool> tools)?  data,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ToolsStateLoading() when loading != null:
return loading();case ToolsStateData() when data != null:
return data(_that.tools);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<Tool> tools)  data,}) {final _that = this;
switch (_that) {
case ToolsStateLoading():
return loading();case ToolsStateData():
return data(_that.tools);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<Tool> tools)?  data,}) {final _that = this;
switch (_that) {
case ToolsStateLoading() when loading != null:
return loading();case ToolsStateData() when data != null:
return data(_that.tools);case _:
  return null;

}
}

}

/// @nodoc


class ToolsStateLoading implements ToolsState {
  const ToolsStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolsStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ToolsState.loading()';
}


}




/// @nodoc


class ToolsStateData implements ToolsState {
  const ToolsStateData({required final  List<Tool> tools}): _tools = tools;
  

 final  List<Tool> _tools;
 List<Tool> get tools {
  if (_tools is EqualUnmodifiableListView) return _tools;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tools);
}


/// Create a copy of ToolsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolsStateDataCopyWith<ToolsStateData> get copyWith => _$ToolsStateDataCopyWithImpl<ToolsStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolsStateData&&const DeepCollectionEquality().equals(other._tools, _tools));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tools));

@override
String toString() {
  return 'ToolsState.data(tools: $tools)';
}


}

/// @nodoc
abstract mixin class $ToolsStateDataCopyWith<$Res> implements $ToolsStateCopyWith<$Res> {
  factory $ToolsStateDataCopyWith(ToolsStateData value, $Res Function(ToolsStateData) _then) = _$ToolsStateDataCopyWithImpl;
@useResult
$Res call({
 List<Tool> tools
});




}
/// @nodoc
class _$ToolsStateDataCopyWithImpl<$Res>
    implements $ToolsStateDataCopyWith<$Res> {
  _$ToolsStateDataCopyWithImpl(this._self, this._then);

  final ToolsStateData _self;
  final $Res Function(ToolsStateData) _then;

/// Create a copy of ToolsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tools = null,}) {
  return _then(ToolsStateData(
tools: null == tools ? _self._tools : tools // ignore: cast_nullable_to_non_nullable
as List<Tool>,
  ));
}


}

/// @nodoc
mixin _$XcodeState {

 FolderResultInfo get archives; FolderResultInfo get derivedData; List<FSEntityInfo> get iOSDeviceLogs; FolderResultInfo get iOSDeviceSupport; FolderResultInfo get macOSDeviceSupport;
/// Create a copy of XcodeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XcodeStateCopyWith<XcodeState> get copyWith => _$XcodeStateCopyWithImpl<XcodeState>(this as XcodeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XcodeState&&(identical(other.archives, archives) || other.archives == archives)&&(identical(other.derivedData, derivedData) || other.derivedData == derivedData)&&const DeepCollectionEquality().equals(other.iOSDeviceLogs, iOSDeviceLogs)&&(identical(other.iOSDeviceSupport, iOSDeviceSupport) || other.iOSDeviceSupport == iOSDeviceSupport)&&(identical(other.macOSDeviceSupport, macOSDeviceSupport) || other.macOSDeviceSupport == macOSDeviceSupport));
}


@override
int get hashCode => Object.hash(runtimeType,archives,derivedData,const DeepCollectionEquality().hash(iOSDeviceLogs),iOSDeviceSupport,macOSDeviceSupport);

@override
String toString() {
  return 'XcodeState(archives: $archives, derivedData: $derivedData, iOSDeviceLogs: $iOSDeviceLogs, iOSDeviceSupport: $iOSDeviceSupport, macOSDeviceSupport: $macOSDeviceSupport)';
}


}

/// @nodoc
abstract mixin class $XcodeStateCopyWith<$Res>  {
  factory $XcodeStateCopyWith(XcodeState value, $Res Function(XcodeState) _then) = _$XcodeStateCopyWithImpl;
@useResult
$Res call({
 FolderResultInfo archives, FolderResultInfo derivedData, List<FSEntityInfo> iOSDeviceLogs, FolderResultInfo iOSDeviceSupport, FolderResultInfo macOSDeviceSupport
});




}
/// @nodoc
class _$XcodeStateCopyWithImpl<$Res>
    implements $XcodeStateCopyWith<$Res> {
  _$XcodeStateCopyWithImpl(this._self, this._then);

  final XcodeState _self;
  final $Res Function(XcodeState) _then;

/// Create a copy of XcodeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? archives = null,Object? derivedData = null,Object? iOSDeviceLogs = null,Object? iOSDeviceSupport = null,Object? macOSDeviceSupport = null,}) {
  return _then(_self.copyWith(
archives: null == archives ? _self.archives : archives // ignore: cast_nullable_to_non_nullable
as FolderResultInfo,derivedData: null == derivedData ? _self.derivedData : derivedData // ignore: cast_nullable_to_non_nullable
as FolderResultInfo,iOSDeviceLogs: null == iOSDeviceLogs ? _self.iOSDeviceLogs : iOSDeviceLogs // ignore: cast_nullable_to_non_nullable
as List<FSEntityInfo>,iOSDeviceSupport: null == iOSDeviceSupport ? _self.iOSDeviceSupport : iOSDeviceSupport // ignore: cast_nullable_to_non_nullable
as FolderResultInfo,macOSDeviceSupport: null == macOSDeviceSupport ? _self.macOSDeviceSupport : macOSDeviceSupport // ignore: cast_nullable_to_non_nullable
as FolderResultInfo,
  ));
}

}


/// Adds pattern-matching-related methods to [XcodeState].
extension XcodeStatePatterns on XcodeState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _XcodeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XcodeState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _XcodeState value)  $default,){
final _that = this;
switch (_that) {
case _XcodeState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _XcodeState value)?  $default,){
final _that = this;
switch (_that) {
case _XcodeState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FolderResultInfo archives,  FolderResultInfo derivedData,  List<FSEntityInfo> iOSDeviceLogs,  FolderResultInfo iOSDeviceSupport,  FolderResultInfo macOSDeviceSupport)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XcodeState() when $default != null:
return $default(_that.archives,_that.derivedData,_that.iOSDeviceLogs,_that.iOSDeviceSupport,_that.macOSDeviceSupport);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FolderResultInfo archives,  FolderResultInfo derivedData,  List<FSEntityInfo> iOSDeviceLogs,  FolderResultInfo iOSDeviceSupport,  FolderResultInfo macOSDeviceSupport)  $default,) {final _that = this;
switch (_that) {
case _XcodeState():
return $default(_that.archives,_that.derivedData,_that.iOSDeviceLogs,_that.iOSDeviceSupport,_that.macOSDeviceSupport);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FolderResultInfo archives,  FolderResultInfo derivedData,  List<FSEntityInfo> iOSDeviceLogs,  FolderResultInfo iOSDeviceSupport,  FolderResultInfo macOSDeviceSupport)?  $default,) {final _that = this;
switch (_that) {
case _XcodeState() when $default != null:
return $default(_that.archives,_that.derivedData,_that.iOSDeviceLogs,_that.iOSDeviceSupport,_that.macOSDeviceSupport);case _:
  return null;

}
}

}

/// @nodoc


class _XcodeState implements XcodeState {
  const _XcodeState({required this.archives, required this.derivedData, required final  List<FSEntityInfo> iOSDeviceLogs, required this.iOSDeviceSupport, required this.macOSDeviceSupport}): _iOSDeviceLogs = iOSDeviceLogs;
  

@override final  FolderResultInfo archives;
@override final  FolderResultInfo derivedData;
 final  List<FSEntityInfo> _iOSDeviceLogs;
@override List<FSEntityInfo> get iOSDeviceLogs {
  if (_iOSDeviceLogs is EqualUnmodifiableListView) return _iOSDeviceLogs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_iOSDeviceLogs);
}

@override final  FolderResultInfo iOSDeviceSupport;
@override final  FolderResultInfo macOSDeviceSupport;

/// Create a copy of XcodeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XcodeStateCopyWith<_XcodeState> get copyWith => __$XcodeStateCopyWithImpl<_XcodeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XcodeState&&(identical(other.archives, archives) || other.archives == archives)&&(identical(other.derivedData, derivedData) || other.derivedData == derivedData)&&const DeepCollectionEquality().equals(other._iOSDeviceLogs, _iOSDeviceLogs)&&(identical(other.iOSDeviceSupport, iOSDeviceSupport) || other.iOSDeviceSupport == iOSDeviceSupport)&&(identical(other.macOSDeviceSupport, macOSDeviceSupport) || other.macOSDeviceSupport == macOSDeviceSupport));
}


@override
int get hashCode => Object.hash(runtimeType,archives,derivedData,const DeepCollectionEquality().hash(_iOSDeviceLogs),iOSDeviceSupport,macOSDeviceSupport);

@override
String toString() {
  return 'XcodeState(archives: $archives, derivedData: $derivedData, iOSDeviceLogs: $iOSDeviceLogs, iOSDeviceSupport: $iOSDeviceSupport, macOSDeviceSupport: $macOSDeviceSupport)';
}


}

/// @nodoc
abstract mixin class _$XcodeStateCopyWith<$Res> implements $XcodeStateCopyWith<$Res> {
  factory _$XcodeStateCopyWith(_XcodeState value, $Res Function(_XcodeState) _then) = __$XcodeStateCopyWithImpl;
@override @useResult
$Res call({
 FolderResultInfo archives, FolderResultInfo derivedData, List<FSEntityInfo> iOSDeviceLogs, FolderResultInfo iOSDeviceSupport, FolderResultInfo macOSDeviceSupport
});




}
/// @nodoc
class __$XcodeStateCopyWithImpl<$Res>
    implements _$XcodeStateCopyWith<$Res> {
  __$XcodeStateCopyWithImpl(this._self, this._then);

  final _XcodeState _self;
  final $Res Function(_XcodeState) _then;

/// Create a copy of XcodeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? archives = null,Object? derivedData = null,Object? iOSDeviceLogs = null,Object? iOSDeviceSupport = null,Object? macOSDeviceSupport = null,}) {
  return _then(_XcodeState(
archives: null == archives ? _self.archives : archives // ignore: cast_nullable_to_non_nullable
as FolderResultInfo,derivedData: null == derivedData ? _self.derivedData : derivedData // ignore: cast_nullable_to_non_nullable
as FolderResultInfo,iOSDeviceLogs: null == iOSDeviceLogs ? _self._iOSDeviceLogs : iOSDeviceLogs // ignore: cast_nullable_to_non_nullable
as List<FSEntityInfo>,iOSDeviceSupport: null == iOSDeviceSupport ? _self.iOSDeviceSupport : iOSDeviceSupport // ignore: cast_nullable_to_non_nullable
as FolderResultInfo,macOSDeviceSupport: null == macOSDeviceSupport ? _self.macOSDeviceSupport : macOSDeviceSupport // ignore: cast_nullable_to_non_nullable
as FolderResultInfo,
  ));
}


}

/// @nodoc
mixin _$FlutterState {

 BigInt get globalCacheSize; List<FilesInDirResult> get groupedProjects;
/// Create a copy of FlutterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlutterStateCopyWith<FlutterState> get copyWith => _$FlutterStateCopyWithImpl<FlutterState>(this as FlutterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlutterState&&(identical(other.globalCacheSize, globalCacheSize) || other.globalCacheSize == globalCacheSize)&&const DeepCollectionEquality().equals(other.groupedProjects, groupedProjects));
}


@override
int get hashCode => Object.hash(runtimeType,globalCacheSize,const DeepCollectionEquality().hash(groupedProjects));

@override
String toString() {
  return 'FlutterState(globalCacheSize: $globalCacheSize, groupedProjects: $groupedProjects)';
}


}

/// @nodoc
abstract mixin class $FlutterStateCopyWith<$Res>  {
  factory $FlutterStateCopyWith(FlutterState value, $Res Function(FlutterState) _then) = _$FlutterStateCopyWithImpl;
@useResult
$Res call({
 BigInt globalCacheSize, List<FilesInDirResult> groupedProjects
});




}
/// @nodoc
class _$FlutterStateCopyWithImpl<$Res>
    implements $FlutterStateCopyWith<$Res> {
  _$FlutterStateCopyWithImpl(this._self, this._then);

  final FlutterState _self;
  final $Res Function(FlutterState) _then;

/// Create a copy of FlutterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? globalCacheSize = null,Object? groupedProjects = null,}) {
  return _then(_self.copyWith(
globalCacheSize: null == globalCacheSize ? _self.globalCacheSize : globalCacheSize // ignore: cast_nullable_to_non_nullable
as BigInt,groupedProjects: null == groupedProjects ? _self.groupedProjects : groupedProjects // ignore: cast_nullable_to_non_nullable
as List<FilesInDirResult>,
  ));
}

}


/// Adds pattern-matching-related methods to [FlutterState].
extension FlutterStatePatterns on FlutterState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlutterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlutterState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlutterState value)  $default,){
final _that = this;
switch (_that) {
case _FlutterState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlutterState value)?  $default,){
final _that = this;
switch (_that) {
case _FlutterState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BigInt globalCacheSize,  List<FilesInDirResult> groupedProjects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlutterState() when $default != null:
return $default(_that.globalCacheSize,_that.groupedProjects);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BigInt globalCacheSize,  List<FilesInDirResult> groupedProjects)  $default,) {final _that = this;
switch (_that) {
case _FlutterState():
return $default(_that.globalCacheSize,_that.groupedProjects);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BigInt globalCacheSize,  List<FilesInDirResult> groupedProjects)?  $default,) {final _that = this;
switch (_that) {
case _FlutterState() when $default != null:
return $default(_that.globalCacheSize,_that.groupedProjects);case _:
  return null;

}
}

}

/// @nodoc


class _FlutterState implements FlutterState {
  const _FlutterState({required this.globalCacheSize, required final  List<FilesInDirResult> groupedProjects}): _groupedProjects = groupedProjects;
  

@override final  BigInt globalCacheSize;
 final  List<FilesInDirResult> _groupedProjects;
@override List<FilesInDirResult> get groupedProjects {
  if (_groupedProjects is EqualUnmodifiableListView) return _groupedProjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groupedProjects);
}


/// Create a copy of FlutterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlutterStateCopyWith<_FlutterState> get copyWith => __$FlutterStateCopyWithImpl<_FlutterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlutterState&&(identical(other.globalCacheSize, globalCacheSize) || other.globalCacheSize == globalCacheSize)&&const DeepCollectionEquality().equals(other._groupedProjects, _groupedProjects));
}


@override
int get hashCode => Object.hash(runtimeType,globalCacheSize,const DeepCollectionEquality().hash(_groupedProjects));

@override
String toString() {
  return 'FlutterState(globalCacheSize: $globalCacheSize, groupedProjects: $groupedProjects)';
}


}

/// @nodoc
abstract mixin class _$FlutterStateCopyWith<$Res> implements $FlutterStateCopyWith<$Res> {
  factory _$FlutterStateCopyWith(_FlutterState value, $Res Function(_FlutterState) _then) = __$FlutterStateCopyWithImpl;
@override @useResult
$Res call({
 BigInt globalCacheSize, List<FilesInDirResult> groupedProjects
});




}
/// @nodoc
class __$FlutterStateCopyWithImpl<$Res>
    implements _$FlutterStateCopyWith<$Res> {
  __$FlutterStateCopyWithImpl(this._self, this._then);

  final _FlutterState _self;
  final $Res Function(_FlutterState) _then;

/// Create a copy of FlutterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? globalCacheSize = null,Object? groupedProjects = null,}) {
  return _then(_FlutterState(
globalCacheSize: null == globalCacheSize ? _self.globalCacheSize : globalCacheSize // ignore: cast_nullable_to_non_nullable
as BigInt,groupedProjects: null == groupedProjects ? _self._groupedProjects : groupedProjects // ignore: cast_nullable_to_non_nullable
as List<FilesInDirResult>,
  ));
}


}

/// @nodoc
mixin _$FVMState {

 String get path; List<FMVVersion> get developer;
/// Create a copy of FVMState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FVMStateCopyWith<FVMState> get copyWith => _$FVMStateCopyWithImpl<FVMState>(this as FVMState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FVMState&&(identical(other.path, path) || other.path == path)&&const DeepCollectionEquality().equals(other.developer, developer));
}


@override
int get hashCode => Object.hash(runtimeType,path,const DeepCollectionEquality().hash(developer));

@override
String toString() {
  return 'FVMState(path: $path, developer: $developer)';
}


}

/// @nodoc
abstract mixin class $FVMStateCopyWith<$Res>  {
  factory $FVMStateCopyWith(FVMState value, $Res Function(FVMState) _then) = _$FVMStateCopyWithImpl;
@useResult
$Res call({
 String path, List<FMVVersion> developer
});




}
/// @nodoc
class _$FVMStateCopyWithImpl<$Res>
    implements $FVMStateCopyWith<$Res> {
  _$FVMStateCopyWithImpl(this._self, this._then);

  final FVMState _self;
  final $Res Function(FVMState) _then;

/// Create a copy of FVMState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? developer = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,developer: null == developer ? _self.developer : developer // ignore: cast_nullable_to_non_nullable
as List<FMVVersion>,
  ));
}

}


/// Adds pattern-matching-related methods to [FVMState].
extension FVMStatePatterns on FVMState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FVMState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FVMState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FVMState value)  $default,){
final _that = this;
switch (_that) {
case _FVMState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FVMState value)?  $default,){
final _that = this;
switch (_that) {
case _FVMState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String path,  List<FMVVersion> developer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FVMState() when $default != null:
return $default(_that.path,_that.developer);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String path,  List<FMVVersion> developer)  $default,) {final _that = this;
switch (_that) {
case _FVMState():
return $default(_that.path,_that.developer);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String path,  List<FMVVersion> developer)?  $default,) {final _that = this;
switch (_that) {
case _FVMState() when $default != null:
return $default(_that.path,_that.developer);case _:
  return null;

}
}

}

/// @nodoc


class _FVMState implements FVMState {
  const _FVMState({required this.path, required final  List<FMVVersion> developer}): _developer = developer;
  

@override final  String path;
 final  List<FMVVersion> _developer;
@override List<FMVVersion> get developer {
  if (_developer is EqualUnmodifiableListView) return _developer;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_developer);
}


/// Create a copy of FVMState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FVMStateCopyWith<_FVMState> get copyWith => __$FVMStateCopyWithImpl<_FVMState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FVMState&&(identical(other.path, path) || other.path == path)&&const DeepCollectionEquality().equals(other._developer, _developer));
}


@override
int get hashCode => Object.hash(runtimeType,path,const DeepCollectionEquality().hash(_developer));

@override
String toString() {
  return 'FVMState(path: $path, developer: $developer)';
}


}

/// @nodoc
abstract mixin class _$FVMStateCopyWith<$Res> implements $FVMStateCopyWith<$Res> {
  factory _$FVMStateCopyWith(_FVMState value, $Res Function(_FVMState) _then) = __$FVMStateCopyWithImpl;
@override @useResult
$Res call({
 String path, List<FMVVersion> developer
});




}
/// @nodoc
class __$FVMStateCopyWithImpl<$Res>
    implements _$FVMStateCopyWith<$Res> {
  __$FVMStateCopyWithImpl(this._self, this._then);

  final _FVMState _self;
  final $Res Function(_FVMState) _then;

/// Create a copy of FVMState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,Object? developer = null,}) {
  return _then(_FVMState(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,developer: null == developer ? _self._developer : developer // ignore: cast_nullable_to_non_nullable
as List<FMVVersion>,
  ));
}


}

/// @nodoc
mixin _$NodeState {

 BigInt get globalCacheSize; List<FilesInDirResult> get groupedProjects;
/// Create a copy of NodeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NodeStateCopyWith<NodeState> get copyWith => _$NodeStateCopyWithImpl<NodeState>(this as NodeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NodeState&&(identical(other.globalCacheSize, globalCacheSize) || other.globalCacheSize == globalCacheSize)&&const DeepCollectionEquality().equals(other.groupedProjects, groupedProjects));
}


@override
int get hashCode => Object.hash(runtimeType,globalCacheSize,const DeepCollectionEquality().hash(groupedProjects));

@override
String toString() {
  return 'NodeState(globalCacheSize: $globalCacheSize, groupedProjects: $groupedProjects)';
}


}

/// @nodoc
abstract mixin class $NodeStateCopyWith<$Res>  {
  factory $NodeStateCopyWith(NodeState value, $Res Function(NodeState) _then) = _$NodeStateCopyWithImpl;
@useResult
$Res call({
 BigInt globalCacheSize, List<FilesInDirResult> groupedProjects
});




}
/// @nodoc
class _$NodeStateCopyWithImpl<$Res>
    implements $NodeStateCopyWith<$Res> {
  _$NodeStateCopyWithImpl(this._self, this._then);

  final NodeState _self;
  final $Res Function(NodeState) _then;

/// Create a copy of NodeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? globalCacheSize = null,Object? groupedProjects = null,}) {
  return _then(_self.copyWith(
globalCacheSize: null == globalCacheSize ? _self.globalCacheSize : globalCacheSize // ignore: cast_nullable_to_non_nullable
as BigInt,groupedProjects: null == groupedProjects ? _self.groupedProjects : groupedProjects // ignore: cast_nullable_to_non_nullable
as List<FilesInDirResult>,
  ));
}

}


/// Adds pattern-matching-related methods to [NodeState].
extension NodeStatePatterns on NodeState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NodeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NodeState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NodeState value)  $default,){
final _that = this;
switch (_that) {
case _NodeState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NodeState value)?  $default,){
final _that = this;
switch (_that) {
case _NodeState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BigInt globalCacheSize,  List<FilesInDirResult> groupedProjects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NodeState() when $default != null:
return $default(_that.globalCacheSize,_that.groupedProjects);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BigInt globalCacheSize,  List<FilesInDirResult> groupedProjects)  $default,) {final _that = this;
switch (_that) {
case _NodeState():
return $default(_that.globalCacheSize,_that.groupedProjects);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BigInt globalCacheSize,  List<FilesInDirResult> groupedProjects)?  $default,) {final _that = this;
switch (_that) {
case _NodeState() when $default != null:
return $default(_that.globalCacheSize,_that.groupedProjects);case _:
  return null;

}
}

}

/// @nodoc


class _NodeState implements NodeState {
  const _NodeState({required this.globalCacheSize, required final  List<FilesInDirResult> groupedProjects}): _groupedProjects = groupedProjects;
  

@override final  BigInt globalCacheSize;
 final  List<FilesInDirResult> _groupedProjects;
@override List<FilesInDirResult> get groupedProjects {
  if (_groupedProjects is EqualUnmodifiableListView) return _groupedProjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groupedProjects);
}


/// Create a copy of NodeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NodeStateCopyWith<_NodeState> get copyWith => __$NodeStateCopyWithImpl<_NodeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NodeState&&(identical(other.globalCacheSize, globalCacheSize) || other.globalCacheSize == globalCacheSize)&&const DeepCollectionEquality().equals(other._groupedProjects, _groupedProjects));
}


@override
int get hashCode => Object.hash(runtimeType,globalCacheSize,const DeepCollectionEquality().hash(_groupedProjects));

@override
String toString() {
  return 'NodeState(globalCacheSize: $globalCacheSize, groupedProjects: $groupedProjects)';
}


}

/// @nodoc
abstract mixin class _$NodeStateCopyWith<$Res> implements $NodeStateCopyWith<$Res> {
  factory _$NodeStateCopyWith(_NodeState value, $Res Function(_NodeState) _then) = __$NodeStateCopyWithImpl;
@override @useResult
$Res call({
 BigInt globalCacheSize, List<FilesInDirResult> groupedProjects
});




}
/// @nodoc
class __$NodeStateCopyWithImpl<$Res>
    implements _$NodeStateCopyWith<$Res> {
  __$NodeStateCopyWithImpl(this._self, this._then);

  final _NodeState _self;
  final $Res Function(_NodeState) _then;

/// Create a copy of NodeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? globalCacheSize = null,Object? groupedProjects = null,}) {
  return _then(_NodeState(
globalCacheSize: null == globalCacheSize ? _self.globalCacheSize : globalCacheSize // ignore: cast_nullable_to_non_nullable
as BigInt,groupedProjects: null == groupedProjects ? _self._groupedProjects : groupedProjects // ignore: cast_nullable_to_non_nullable
as List<FilesInDirResult>,
  ));
}


}

/// @nodoc
mixin _$RustState {

 BigInt get globalCacheSize; List<FilesInDirResult> get groupedProjects;
/// Create a copy of RustState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RustStateCopyWith<RustState> get copyWith => _$RustStateCopyWithImpl<RustState>(this as RustState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RustState&&(identical(other.globalCacheSize, globalCacheSize) || other.globalCacheSize == globalCacheSize)&&const DeepCollectionEquality().equals(other.groupedProjects, groupedProjects));
}


@override
int get hashCode => Object.hash(runtimeType,globalCacheSize,const DeepCollectionEquality().hash(groupedProjects));

@override
String toString() {
  return 'RustState(globalCacheSize: $globalCacheSize, groupedProjects: $groupedProjects)';
}


}

/// @nodoc
abstract mixin class $RustStateCopyWith<$Res>  {
  factory $RustStateCopyWith(RustState value, $Res Function(RustState) _then) = _$RustStateCopyWithImpl;
@useResult
$Res call({
 BigInt globalCacheSize, List<FilesInDirResult> groupedProjects
});




}
/// @nodoc
class _$RustStateCopyWithImpl<$Res>
    implements $RustStateCopyWith<$Res> {
  _$RustStateCopyWithImpl(this._self, this._then);

  final RustState _self;
  final $Res Function(RustState) _then;

/// Create a copy of RustState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? globalCacheSize = null,Object? groupedProjects = null,}) {
  return _then(_self.copyWith(
globalCacheSize: null == globalCacheSize ? _self.globalCacheSize : globalCacheSize // ignore: cast_nullable_to_non_nullable
as BigInt,groupedProjects: null == groupedProjects ? _self.groupedProjects : groupedProjects // ignore: cast_nullable_to_non_nullable
as List<FilesInDirResult>,
  ));
}

}


/// Adds pattern-matching-related methods to [RustState].
extension RustStatePatterns on RustState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RustState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RustState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RustState value)  $default,){
final _that = this;
switch (_that) {
case _RustState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RustState value)?  $default,){
final _that = this;
switch (_that) {
case _RustState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BigInt globalCacheSize,  List<FilesInDirResult> groupedProjects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RustState() when $default != null:
return $default(_that.globalCacheSize,_that.groupedProjects);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BigInt globalCacheSize,  List<FilesInDirResult> groupedProjects)  $default,) {final _that = this;
switch (_that) {
case _RustState():
return $default(_that.globalCacheSize,_that.groupedProjects);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BigInt globalCacheSize,  List<FilesInDirResult> groupedProjects)?  $default,) {final _that = this;
switch (_that) {
case _RustState() when $default != null:
return $default(_that.globalCacheSize,_that.groupedProjects);case _:
  return null;

}
}

}

/// @nodoc


class _RustState implements RustState {
  const _RustState({required this.globalCacheSize, required final  List<FilesInDirResult> groupedProjects}): _groupedProjects = groupedProjects;
  

@override final  BigInt globalCacheSize;
 final  List<FilesInDirResult> _groupedProjects;
@override List<FilesInDirResult> get groupedProjects {
  if (_groupedProjects is EqualUnmodifiableListView) return _groupedProjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groupedProjects);
}


/// Create a copy of RustState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RustStateCopyWith<_RustState> get copyWith => __$RustStateCopyWithImpl<_RustState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RustState&&(identical(other.globalCacheSize, globalCacheSize) || other.globalCacheSize == globalCacheSize)&&const DeepCollectionEquality().equals(other._groupedProjects, _groupedProjects));
}


@override
int get hashCode => Object.hash(runtimeType,globalCacheSize,const DeepCollectionEquality().hash(_groupedProjects));

@override
String toString() {
  return 'RustState(globalCacheSize: $globalCacheSize, groupedProjects: $groupedProjects)';
}


}

/// @nodoc
abstract mixin class _$RustStateCopyWith<$Res> implements $RustStateCopyWith<$Res> {
  factory _$RustStateCopyWith(_RustState value, $Res Function(_RustState) _then) = __$RustStateCopyWithImpl;
@override @useResult
$Res call({
 BigInt globalCacheSize, List<FilesInDirResult> groupedProjects
});




}
/// @nodoc
class __$RustStateCopyWithImpl<$Res>
    implements _$RustStateCopyWith<$Res> {
  __$RustStateCopyWithImpl(this._self, this._then);

  final _RustState _self;
  final $Res Function(_RustState) _then;

/// Create a copy of RustState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? globalCacheSize = null,Object? groupedProjects = null,}) {
  return _then(_RustState(
globalCacheSize: null == globalCacheSize ? _self.globalCacheSize : globalCacheSize // ignore: cast_nullable_to_non_nullable
as BigInt,groupedProjects: null == groupedProjects ? _self._groupedProjects : groupedProjects // ignore: cast_nullable_to_non_nullable
as List<FilesInDirResult>,
  ));
}


}

// dart format on
