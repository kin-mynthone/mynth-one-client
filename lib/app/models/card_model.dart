class CardModel {
  List<Data>? data;

  CardModel({this.data});

  CardModel.fromJson(Map<dynamic, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? icon;
  int? startColor;
  int? endColor;
  String? amount;
  String? accountNumber;
  String? accountName;
  String? expiration;
  String? cvv;

  Data(
      {this.id,
      this.icon,
      this.startColor,
      this.endColor,
      this.amount,
      this.accountNumber,
      this.accountName,
      this.expiration,
      this.cvv});

  Data.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    startColor = int.parse(json['start_color']);
    endColor = int.parse(json['end_color']);
    amount = json['amount'];
    accountNumber = json['account_number'];
    accountName = json['account_name'];
    expiration = json['expiration'];
    cvv = json['cvv'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['icon'] = icon;
    data['start_color'] = int.parse(startColor as String);
    data['end_color'] = int.parse(endColor as String);
    data['amount'] = amount;
    data['account_number'] = accountNumber;
    data['account_name'] = accountName;
    data['expiration'] = expiration;
    data['cvv'] = cvv;
    return data;
  }
}
