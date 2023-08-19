class CardModel {
  List<Data>? data;

  CardModel({this.data});

  CardModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  String? id;
  String? icon;
  String? endColor;
  String? startColor;
  String? amount;
  String? accountNumber;
  String? accountName;
  String? expiration;

  Data(
      {this.id,
      this.icon,
      this.endColor,
      this.startColor,
      this.amount,
      this.accountNumber,
      this.accountName,
      this.expiration});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    endColor = json['end_color'];
    startColor = json['start_color'];
    amount = json['amount'];
    accountNumber = json['account_number'];
    accountName = json['account_name'];
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['icon'] = icon;
    data['end_color'] = endColor;
    data['start_color'] = startColor;
    data['amount'] = amount;
    data['account_number'] = accountNumber;
    data['account_name'] = accountName;
    data['expiration'] = expiration;
    return data;
  }
}
