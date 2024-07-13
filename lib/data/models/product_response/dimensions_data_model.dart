class DimensionsDM {
  DimensionsDM({
    this.width,
    this.height,
    this.depth,});

  DimensionsDM.fromJson(dynamic json) {
    width = json['width'];
    height = json['height'];
    depth = json['depth'];
  }
  double? width;
  double? height;
  double? depth;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['width'] = width;
    map['height'] = height;
    map['depth'] = depth;
    return map;
  }

}