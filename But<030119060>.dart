import 'dart:convert';

void main() {
  String jsonString = '{"isim": "Miraç Yusuf Çalışkan", "okuladi": "IZU", "OgrenciNo": "030119060", "permissions": ["admin", "editor", "contributor"]}';

  Welcome welcome = welcomeFromJson(jsonString);
  print(welcome.isim); // Miraç Yusuf Çalışkan
  print(welcome.okuladi); // IZU
  print(welcome.ogrenciNo); // 030119060
  print(welcome.permissions); // [admin, editor, contributor]

  String newJsonString = welcomeToJson(welcome);
  print(newJsonString); // {"isim":"Miraç Yusuf Çalışkan","okuladi":"IZU","OgrenciNo":"030119060","permissions":["admin","editor","contributor"]}

  OgrenciNo ogrenciNo = OgrenciNo.fromJson(jsonString);
  print(ogrenciNo.OgrenciNo); // 030119060

  String newOgrenciNoJson = ogrenciNo.toJson();
  print(newOgrenciNoJson); // {"OgrenciNo":"030119060"}
}

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  String isim;
  String okuladi;
  String ogrenciNo;
  List<String> permissions;

  Welcome({
    required this.isim,
    required this.okuladi,
    required this.ogrenciNo,
    required this.permissions,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        isim: json["isim"],
        okuladi: json["okuladi"],
        ogrenciNo: json["OgrenciNo"],
        permissions: List<String>.from(json["permissions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "isim": isim,
        "okuladi": okuladi,
        "OgrenciNo": ogrenciNo,
        "permissions": List<dynamic>.from(permissions.map((x) => x)),
      };
}

class OgrenciNo {
  String OgrenciNo;

  OgrenciNo({
    required this.OgrenciNo,
  });

  factory OgrenciNo.fromJson(String str) => OgrenciNo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OgrenciNo.fromMap(Map<String, dynamic> json) => OgrenciNo(
        OgrenciNo: json["OgrenciNo"],
      );

  Map<String, dynamic> toMap() => {
        "OgrenciNo": OgrenciNo,
      };
}
