import './widgets/new_transaction.dart';

import './widgets/transaction_list.dart';
import './widgets/chart.dart';

import 'package:flutter/material.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

const MaterialColor myColor =
    const MaterialColor(0xFF42224A, const <int, Color>{
  50: const Color.fromRGBO(66, 34, 74, .1),
  100: const Color.fromRGBO(66, 34, 74, .2),
  200: const Color.fromRGBO(66, 34, 74, .3),
  300: const Color.fromRGBO(66, 34, 74, .4),
  400: const Color.fromRGBO(66, 34, 74, .5),
  500: const Color.fromRGBO(66, 34, 74, .6),
  600: const Color.fromRGBO(66, 34, 74, .7),
  700: const Color.fromRGBO(66, 34, 74, .8),
  800: const Color.fromRGBO(66, 34, 74, .9),
  900: const Color.fromRGBO(66, 34, 74, 1),
});

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: myColor,
        accentColor: Color(0xFFEF8767),
        fontFamily: 'OpenSans',
        errorColor: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String title, int amount, DateTime date) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: date);

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((trans) => trans.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: ctx,
        builder: (bCtx) {
          return Container(
            height: 500,
            child: NewTransaction(_addNewTransaction),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: Container(
        color: Color(0xFFF3F5F7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                width: double.infinity, child: Chart(_recentTransactions)),
            TransactionList(_userTransactions, _deleteTransaction)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
