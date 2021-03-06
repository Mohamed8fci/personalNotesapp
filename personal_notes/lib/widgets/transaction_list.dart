import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
         final List<Transaction> transactions;
         TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
        child: transactions.isEmpty
            ? Column(
          children: <Widget>[
            Text('No Transaction added yet!',
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 200,
                child: Image.asset('assets/images/waiting.png',
                  fit: BoxFit.cover,)),
          ],
        )
            :ListView.builder(
          itemBuilder: (ctx,index){
              return Card(child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Text
                      ('\$${transactions[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                          ,color: Theme.of(context).primaryColor),
                    )
                    ,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(transactions[index].title,
                        // ignore: deprecated_member_use
                        style: Theme.of(context).textTheme.title,
                      ),
                      Text(DateFormat.yMMMd().format(transactions[index].date),
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],)
                ],
              )
              );
            },
          itemCount: transactions.length,
        ),
    );
  }
}
