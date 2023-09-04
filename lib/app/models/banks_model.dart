class BanksModel {
  List<Banks>? data;

  BanksModel({this.data});

  BanksModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Banks>[];
      json['data'].forEach((v) {
        data!.add(Banks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banks {
  String? id;
  String? icon;
  String? title;

  Banks({this.id, this.icon, this.title});

  Banks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['icon'] = icon;
    data['title'] = title;
    return data;
  }
}
