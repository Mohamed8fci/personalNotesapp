import 'package:flutter/material.dart';

class NewTransaction  extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titelController = TextEditingController();
  final amountController = TextEditingController();

  void submitData(){
    final entredTitle = titelController.text;
    final entredAmount = double.parse(amountController.text);

    if(entredTitle.isEmpty || entredAmount<=0){
      return;
    }

    widget.addTx(
        entredTitle,
        entredAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return  Card(
        elevation: 8,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'title'),
                controller: titelController,
              onSubmitted: (_) => submitData(),),

              TextField(
                decoration: InputDecoration(labelText: 'amount'),
                controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),),

              FlatButton(child: Text('Add Transaction'),
                textColor: Colors.purple,
                onPressed: (){
                   submitData();
                },)
            ],
          ),
        )
    );
  }
}

