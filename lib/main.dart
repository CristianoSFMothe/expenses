import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transactions_list.dart';
import 'package:flutter/services.dart';
import 'models/transactions.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // Usando a classe transactions
  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Novo Têns de Corrida',
        value: 310.76,
        date: DateTime.now()),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.3,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoas'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Card(
              color: Colors.blue,
              child: Text('Grafico'),
              elevation: 5,
            ),
          ),

          // Importando a class TransactionList - que será responsável pela as transações
          TransactionList(_transactions),

          // Importando a class TransactionForm - que é responsável pelos os formulários
          TransactionForm(),
        ],
      ),
    );
  }
}
