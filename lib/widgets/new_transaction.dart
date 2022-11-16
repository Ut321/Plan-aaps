import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = amountController.text;
    if (enteredTitle.isEmpty || enteredAmount != Null) {
      return;
    }

    widget.addTx(
      enteredAmount,
      enteredAmount,
    );

  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => submitData,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                // onChanged: (val) => amountInput = val,
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData,
              ),
              TextButton(
                child: Text(" Add Transaction"),
                onPressed: (){
                  submitData();
                  setState(() {

                  });
                  Navigator.of(context).pop();

                },
              ),
            ],
          ),
        ));
  }
}
