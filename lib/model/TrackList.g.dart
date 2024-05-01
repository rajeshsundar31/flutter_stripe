// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TrackList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Title _$TitleFromJson(Map<String, dynamic> json) => Title(
      title: json['title'] as String,
      searchTerms: json['searchTerms'] as String,
    );

Map<String, dynamic> _$TitleToJson(Title instance) => <String, dynamic>{
      'title': instance.title,
      'searchTerms': instance.searchTerms,
    };

Quries _$QuriesFromJson(Map<String, dynamic> json) => Quries(
      request: (json['request'] as List<dynamic>)
          .map((e) => Title.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPage: (json['nextPage'] as List<dynamic>)
          .map((e) => Title.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuriesToJson(Quries instance) => <String, dynamic>{
      'request': instance.request,
      'nextPage': instance.nextPage,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      src: json['src'] as String,
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'src': instance.src,
    };

Pagemap _$PagemapFromJson(Map<String, dynamic> json) => Pagemap(
      cse_thumbnail: (json['cse_thumbnail'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PagemapToJson(Pagemap instance) => <String, dynamic>{
      'cse_thumbnail': instance.cse_thumbnail,
    };

ListData _$ListDataFromJson(Map<String, dynamic> json) => ListData(
      title: json['title'] as String,
      link: json['link'] as String,
      snippet: json['snippet'] as String,
      pagemap: json['pagemap'] == null
          ? null
          : Pagemap.fromJson(json['pagemap'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListDataToJson(ListData instance) => <String, dynamic>{
      'title': instance.title,
      'link': instance.link,
      'snippet': instance.snippet,
      'pagemap': instance.pagemap,
    };

SearchList _$SearchListFromJson(Map<String, dynamic> json) => SearchList(
      items: (json['items'] as List<dynamic>)
          .map((e) => ListData.fromJson(e as Map<String, dynamic>))
          .toList(),
      queries: Quries.fromJson(json['queries'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchListToJson(SearchList instance) =>
    <String, dynamic>{
      'items': instance.items,
      'queries': instance.queries,
    };
