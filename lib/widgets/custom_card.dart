import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCard extends StatelessWidget {
  final Transaction transaction;
  final Function deleteTrans;

  CustomCard(this.transaction, this.deleteTrans);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: ListTile(
          leading: CircleAvatar(
              radius: 30,
              child: FittedBox(
                child: Text('\u20B9${transaction.amount.toString()}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'OpenSans',
                    )),
              )),
          title: Text(transaction.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          subtitle: Text(DateFormat.yMMMd().format(transaction.date),
              style: TextStyle(fontSize: 14, color: Colors.grey)),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () => deleteTrans(transaction.id),
          ),
        ));
  }
}
