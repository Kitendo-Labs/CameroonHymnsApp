// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'hymns.g.dart';
part 'hymns.freezed.dart';

@freezed
class HymnsList with _$HymnsList {
  const HymnsList._();
  const factory HymnsList(
    @JsonSerializable(explicitToJson: true) List<HymnTitle?> categories,
    @JsonSerializable(explicitToJson: true) List<Hymn?> hymns,
  ) = _HymnsList;

  factory HymnsList.fromJson(Map<String, dynamic> json) =>
      _$HymnsListFromJson(json);
}

@freezed
class Hymn with _$Hymn {
  const Hymn._();
  const factory Hymn({
    required String id,
    required String title,
    required List<String> verses,
    @Default([]) List<String> antiphones,
    @Default([]) List<String> refrains,
    @Default([]) List<String> chorus,
  }) = _Hymn;

  factory Hymn.fromJson(Map<String, dynamic> json) => _$HymnFromJson(json);
}

@freezed
class HymnTitle with _$HymnTitle {
  const HymnTitle._();
  const factory HymnTitle({
    required String id,
    required String title,
    required List<List<String>> hymns,
  }) = _HymnTitle;

  factory HymnTitle.fromJson(Map<String, dynamic> json) =>
      _$HymnTitleFromJson(json);
}
