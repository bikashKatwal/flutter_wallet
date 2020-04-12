import 'package:flutter/material.dart';
import 'package:master_card/config/styles.dart';
import 'package:master_card/widgets/card_section.dart';
import 'package:master_card/widgets/expense_section.dart';
import 'package:master_card/widgets/wallet_header.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 120.0,
            child: WalletHeader(),
          ),
          Expanded(
            child: CardSection(),
          ),
          Expanded(
            child: ExpenseSection(),
          ),
        ],
      ),
    );
  }
}
