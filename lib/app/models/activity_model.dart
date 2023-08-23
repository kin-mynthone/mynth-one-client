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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['type_of_activity'] = typeOfActivity;
    data['receiver'] = receiver;
    data['sender'] = sender;
    data['debit'] = debit;
    data['account_number'] = accountNumber;
    data['account_name'] = accountName;
    data['time_stamp'] = timeStamp;
    data['description'] = description;
    return data;
  }
}
