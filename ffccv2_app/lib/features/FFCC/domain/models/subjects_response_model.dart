class SubjectsRes {
  SubjectsRes({
    required this.courses,
    required this.error,
    required this.message,
  });

  final List<Course> courses;
  final bool error;
  final String message;

  factory SubjectsRes.fromJson(Map<String, dynamic> json) => SubjectsRes(
        courses:
            List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
        error: json["error"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
        "error": error,
        "message": message,
      };
}

class Course {
  Course({
    required this.id,
    required this.code,
    required this.title,
    required this.credits,
    required this.type,
  });

  final String id;
  final String code;
  final String title;
  final int credits;
  final Type type;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["_id"],
        code: json["code"],
        title: json["title"],
        credits: json["credits"],
        type: typeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "code": code,
        "title": title,
        "credits": credits,
        "type": typeValues.reverse[type],
      };
}

enum Type { ETH, EPJ, SS, PJT, ELA, TH, LO }

final typeValues = EnumValues({
  "ELA": Type.ELA,
  "EPJ": Type.EPJ,
  "ETH": Type.ETH,
  "LO": Type.LO,
  "PJT": Type.PJT,
  "SS": Type.SS,
  "TH": Type.TH
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
