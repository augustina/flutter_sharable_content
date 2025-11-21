// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentModelImpl _$$ContentModelImplFromJson(Map<String, dynamic> json) =>
    _$ContentModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      done: json['done'] as bool,
      sharedWith: (json['sharedWith'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ContentModelImplToJson(_$ContentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'done': instance.done,
      'sharedWith': instance.sharedWith,
    };
