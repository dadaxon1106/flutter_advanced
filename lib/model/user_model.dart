class UserModel {
  String? name;
  int? cardNumber;
  double? balance;
  UserModel(this.name, this.cardNumber, this.balance);

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cardNumber = json['cardNumber'];
    balance = json['balance'];
  }
  Map<String, dynamic> toJson() =>
      {'name': name, 'cardNumber': cardNumber, 'balance': balance};
}
