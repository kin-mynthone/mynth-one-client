class FavoriteReceiverModel {
  List<FavoriteReceiver>? data;

  FavoriteReceiverModel({this.data});

  FavoriteReceiverModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FavoriteReceiver>[];
      json['data'].forEach((v) {
        // ignore: unnecessary_new
        data!.add(new FavoriteReceiver.fromJson(v));
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

class FavoriteReceiver {
  String? id;
  String? icon;
  String? bank;
  String? receiver;
  String? accountNumber;

  FavoriteReceiver(
      {this.id, this.icon, this.bank, this.receiver, this.accountNumber});

  FavoriteReceiver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    bank = json['bank'];
    receiver = json['receiver'];
    accountNumber = json['account_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['icon'] = icon;
    data['bank'] = bank;
    data['receiver'] = receiver;
    data['account_number'] = accountNumber;
    return data;
  }
}
