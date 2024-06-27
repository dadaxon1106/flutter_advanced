class MemberModel {
  String? name;
  int? cardNumber;
  double? balance;
  MemberModel(this.name, this.cardNumber, this.balance);

  MemberModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cardNumber = json['cardNumber'];
    balance = json['balance'];
  }
  Map<String, dynamic> toJson() =>
      {'name': name, 'cardNumber': cardNumber, 'balance': balance};
}
