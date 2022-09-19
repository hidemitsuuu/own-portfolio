import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample_model.freezed.dart';
part 'sample_model.g.dart';

@freezed
class SampleModel with _$SampleModel {
  const factory SampleModel({@Default(0) int count}) = _SampleModel;

  factory SampleModel.fromJson(Map<String, Object?> json) => _$SampleModelFromJson(json);
}
