
import 'package:json_annotation/json_annotation.dart';

part 'TrackList.g.dart';

@JsonSerializable()
class Title {
  String title;
  String searchTerms;

  Title({ required this.title, required this.searchTerms});

  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);
  Map<String, dynamic> toJson() => _$TitleToJson(this);
}

@JsonSerializable()
class Quries {
  List<Title> request;
  List<Title> nextPage;

  Quries({ required this.request, required this.nextPage });

  factory Quries.fromJson(Map<String, dynamic> json) => _$QuriesFromJson(json);
  Map<String, dynamic> toJson() => _$QuriesToJson(this);
  
}

@JsonSerializable()

class Images {
  String src;

  Images({ required this.src});

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
  Map<String, dynamic> toJson() => _$ImagesToJson(this);

}

@JsonSerializable()

class Pagemap {
  List<Images>? cse_thumbnail;

  Pagemap({ this.cse_thumbnail});

  factory Pagemap.fromJson(Map<String, dynamic> json) => _$PagemapFromJson(json);
  Map<String, dynamic> toJson() => _$PagemapToJson(this);

}

@JsonSerializable()

class ListData {
  String title;
  String link;
  String snippet;
  Pagemap? pagemap;

  ListData({ required this.title, required this.link, required this.snippet, this.pagemap});

  factory ListData.fromJson(Map<String, dynamic> json) => _$ListDataFromJson(json);
  Map<String, dynamic> toJson() => _$ListDataToJson(this);


}

@JsonSerializable()

class SearchList {

  List<ListData> items;
  Quries queries;

  SearchList ({ required this.items, required this.queries});

  factory SearchList.fromJson(Map<String, dynamic> json) => _$SearchListFromJson(json);
  Map<String, dynamic> toJson() => _$SearchListToJson(this);
  
}