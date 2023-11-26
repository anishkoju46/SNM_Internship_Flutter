import 'dart:ui';

class CreditCard {
  String imageURL;
  String cardType;
  String cardNumber;
  double balance;
  String accountType;
  Color primaryColor;

  CreditCard(
      {required this.imageURL,
      required this.cardType,
      required this.cardNumber,
      required this.balance,
      required this.accountType,
      required this.primaryColor});
}
