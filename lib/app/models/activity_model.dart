class ActivityModel {
  List<Data>? data;

  ActivityModel({this.data});

  ActivityModel.fromJson(Map<String, dynamic> json) {
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
  String? startColor;
  String? endColor;
  String? amount;
  String? typeOfActivity;
  String? merchant;
  bool? debit;
  String? accountNumber;
  String? accountName;
  int? timeStamp;
  String? description;
  String? status;

  Data(
      {this.id,
      this.icon,
      this.startColor,
      this.endColor,
      this.amount,
      this.typeOfActivity,
      this.merchant,
      this.debit,
      this.accountNumber,
      this.accountName,
      this.timeStamp,
      this.description,
      this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    startColor = json['start_color'];
    endColor = json['end_color'];
    amount = json['amount'];
    typeOfActivity = json['type_of_activity'];
    merchant = json['merchant'];
    debit = json['debit'];
    accountNumber = json['account_number'];
    accountName = json['account_name'];
    timeStamp = json['time_stamp'];
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['icon'] = icon;
    data['start_color'] = startColor;
    data['end_color'] = endColor;
    data['amount'] = amount;
    data['type_of_activity'] = typeOfActivity;
    data['merchant'] = merchant;
    data['debit'] = debit;
    data['account_number'] = accountNumber;
    data['account_name'] = accountName;
    data['time_stamp'] = timeStamp;
    data['description'] = description;
    data['status'] = status;
    return data;
  }
}
