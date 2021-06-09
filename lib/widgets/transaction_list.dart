import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './custom_card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTrans;

  TransactionList(this.transactions, this.deleteTrans);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            "Transactions",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20),
        ),
        transactions.isEmpty
            ? Column(
                children: [
                  SizedBox(height: 10),
                  Text('No transactions added yet...',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      child: Image.asset('assets/image/waiting.png',
                          fit: BoxFit.cover, height: 300))
                ],
              )
            : Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: ListView.builder(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CustomCard(transactions[index], deleteTrans);
                  },
                  itemCount: transactions.length,
                ),
              ),
      ],
    );
  }
}
