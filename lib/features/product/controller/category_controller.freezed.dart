// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryControllerState {
  int get selectedCategory => throw _privateConstructorUsedError;
  List<String> get allCategories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryControllerStateCopyWith<CategoryControllerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryControllerStateCopyWith<$Res> {
  factory $CategoryControllerStateCopyWith(CategoryControllerState value,
          $Res Function(CategoryControllerState) then) =
      _$CategoryControllerStateCopyWithImpl<$Res, CategoryControllerState>;
  @useResult
  $Res call({int selectedCategory, List<String> allCategories});
}

/// @nodoc
class _$CategoryControllerStateCopyWithImpl<$Res,
        $Val extends CategoryControllerState>
    implements $CategoryControllerStateCopyWith<$Res> {
  _$CategoryControllerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCategory = null,
    Object? allCategories = null,
  }) {
    return _then(_value.copyWith(
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as int,
      allCategories: null == allCategories
          ? _value.allCategories
          : allCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryControllerStateImplCopyWith<$Res>
    implements $CategoryControllerStateCopyWith<$Res> {
  factory _$$CategoryControllerStateImplCopyWith(
          _$CategoryControllerStateImpl value,
          $Res Function(_$CategoryControllerStateImpl) then) =
      __$$CategoryControllerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int selectedCategory, List<String> allCategories});
}

/// @nodoc
class __$$CategoryControllerStateImplCopyWithImpl<$Res>
    extends _$CategoryControllerStateCopyWithImpl<$Res,
        _$CategoryControllerStateImpl>
    implements _$$CategoryControllerStateImplCopyWith<$Res> {
  __$$CategoryControllerStateImplCopyWithImpl(
      _$CategoryControllerStateImpl _value,
      $Res Function(_$CategoryControllerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCategory = null,
    Object? allCategories = null,
  }) {
    return _then(_$CategoryControllerStateImpl(
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as int,
      allCategories: null == allCategories
          ? _value._allCategories
          : allCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$CategoryControllerStateImpl implements _CategoryControllerState {
  _$CategoryControllerStateImpl(
      {required this.selectedCategory,
      required final List<String> allCategories})
      : _allCategories = allCategories;

  @override
  final int selectedCategory;
  final List<String> _allCategories;
  @override
  List<String> get allCategories {
    if (_allCategories is EqualUnmodifiableListView) return _allCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allCategories);
  }

  @override
  String toString() {
    return 'CategoryControllerState(selectedCategory: $selectedCategory, allCategories: $allCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryControllerStateImpl &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            const DeepCollectionEquality()
                .equals(other._allCategories, _allCategories));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedCategory,
      const DeepCollectionEquality().hash(_allCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryControllerStateImplCopyWith<_$CategoryControllerStateImpl>
      get copyWith => __$$CategoryControllerStateImplCopyWithImpl<
          _$CategoryControllerStateImpl>(this, _$identity);
}

abstract class _CategoryControllerState implements CategoryControllerState {
  factory _CategoryControllerState(
          {required final int selectedCategory,
          required final List<String> allCategories}) =
      _$CategoryControllerStateImpl;

  @override
  int get selectedCategory;
  @override
  List<String> get allCategories;
  @override
  @JsonKey(ignore: true)
  _$$CategoryControllerStateImplCopyWith<_$CategoryControllerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}