import 'package:json_annotation/json_annotation.dart';
part 'geo.g.dart';

@JsonSerializable()
class Geo {
  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
  Map<String, dynamic> toJson() => _$GeoToJson(this);
  final String lat;
  final String lng;
}
