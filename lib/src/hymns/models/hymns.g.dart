// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hymns.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HymnsListImpl _$$HymnsListImplFromJson(Map<String, dynamic> json) =>
    _$HymnsListImpl(
      (json['categories'] as List<dynamic>)
          .map((e) =>
              e == null ? null : HymnTitle.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['hymns'] as List<dynamic>)
          .map((e) =>
              e == null ? null : Hymn.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HymnsListImplToJson(_$HymnsListImpl instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'hymns': instance.hymns,
    };

_$HymnImpl _$$HymnImplFromJson(Map<String, dynamic> json) => _$HymnImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      verses:
          (json['verses'] as List<dynamic>).map((e) => e as String).toList(),
      antiphones: (json['antiphones'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      refrains: (json['refrains'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      chorus: (json['chorus'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$HymnImplToJson(_$HymnImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'verses': instance.verses,
      'antiphones': instance.antiphones,
      'refrains': instance.refrains,
      'chorus': instance.chorus,
    };

_$HymnTitleImpl _$$HymnTitleImplFromJson(Map<String, dynamic> json) =>
    _$HymnTitleImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      hymns: (json['hymns'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
    );

Map<String, dynamic> _$$HymnTitleImplToJson(_$HymnTitleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'hymns': instance.hymns,
    };
