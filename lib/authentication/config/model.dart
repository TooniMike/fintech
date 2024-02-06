// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  String? id;
  String? email;
  String? username;

  User({
    this.id,
    this.email,
    this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      email: json['email'],
      username: json['username'],
    );
  }
}

class UserBalanceModel {
  double? balance;
  String? currency;
  UserBalanceModel({
    this.balance,
    this.currency,
  });

  factory UserBalanceModel.fromJson(Map<String, dynamic> json){
    return UserBalanceModel(
      balance: json['balance'],
      currency: json['currency']
    );
  }

}

class TransactionsModel {

    String? id;
    String? toWallet;
    String? type;
    double? amount;
    String? currency;
    DateTime? timestamp;

    TransactionsModel({
         this.id,
         this.toWallet,
         this.type,
         this.amount,
         this.currency,
         this.timestamp,
    });

    factory TransactionsModel.fromJson(Map<String, dynamic> json) {
      return TransactionsModel(
        id: json["id"],
        toWallet: json["to_wallet"],
        type: json["type"],
        amount: json["amount"]?.toDouble(),
        currency: json["currency"],
        timestamp: DateTime.parse(json["timestamp"]),
    );
    } 
}
