import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_notes/widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';


void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomeapp(),
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',

        textTheme: ThemeData.light().textTheme.copyWith(
          // ignore: deprecated_member_use
          title: TextStyle(
            fontSize: 16,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            // ignore: deprecated_member_use
            title: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ),
    );
  }
}
class MyHomeapp extends StatefulWidget {

  @override
  _MyHomeappState createState() => _MyHomeappState();
}

class _MyHomeappState extends State<MyHomeapp> {

  final List<Transaction> _userTransactions = [
   /* Transaction(id: 't1'
        ,title: 'shoes',
        amount: 88.80,
        date: DateTime.now()),
    Transaction(id: 't2'
        ,title: 't-shirt',
        amount: 25.33,
        date: DateTime.now()) */
  ];

  void _addNewTransaction(String txTitle,double txAmount){
    final newTx = Transaction(title: txTitle,
        amount: txAmount,
        date: DateTime.now()
        ,id: DateTime.now().toString()
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return GestureDetector(
        onTap: (){},
        child: NewTransaction(_addNewTransaction),
        behavior: HitTestBehavior.opaque,
      );
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
         actions: <Widget>[
           IconButton(icon: Icon(Icons.add),
           onPressed: () =>_startAddNewTransaction(context),)
         ],
      ),

      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART!'),
                elevation: 8,
              ),
            ),
            TransactionList(_userTransactions),
          ],
           ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:  () =>_startAddNewTransaction(context),
      ),
      );
  }
}
