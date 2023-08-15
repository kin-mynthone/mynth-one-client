class ActivityModel {
  List<Data>? data;

  ActivityModel({this.data});

  ActivityModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? amount;
  String? typeOfActivity;
  String? receiver;
  String? sender;
  bool? debit;
  String? accountNumber;
  String? accountName;
  int? timeStamp;
  String? description;

  Data(
      {this.id,
      this.amount,
      this.typeOfActivity,
      this.receiver,
      this.sender,
      this.debit,
      this.accountNumber,
      this.accountName,
      this.timeStamp,
      this.description});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    typeOfActivity = json['type_of_activity'];
    receiver = json['receiver'];
    sender = json['sender'];
    debit = json['debit'];
    accountNumber = json['account_number'];
    accountName = json['account_name'];
    timeStamp = json['time_stamp'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['type_of_activity'] = this.typeOfActivity;
    data['receiver'] = this.receiver;
    data['sender'] = this.sender;
    data['debit'] = this.debit;
    data['account_number'] = this.accountNumber;
    data['account_name'] = this.accountName;
    data['time_stamp'] = this.timeStamp;
    data['description'] = this.description;
    return data;
  }
}
