import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class Chart extends StatelessWidget {
  // Passando por parametros as informações
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  // Função para calcular o percentual de despesa de cada dia
  List<Map<String, Object>> get grupedTransactions {
    return List.generate(7, (index) {
      // Função para recuperar os dias das semana dinamicamente
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      // somando os dias da semana
      double totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        // Verificando para saber se é o mesmo dia
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        // Verificando para saber se é o mesmo mês
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        // Verificando para saber se é o mesmo ano
        bool sameYear = recentTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransaction[i].value;
        }
      }

      print(DateFormat.E().format(weekDay)[0]);
      print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
