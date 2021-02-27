import '../models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {

  // Passando por parametros as informações
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  // Função para calcular o percentual de despesa de cada dia
  List<Map<String, Object>> get groupedTransactions {
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

        // Verificando os dias, mes e ano das transações
        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransaction[i].value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  // Função para calcular os gasto do dia da semana
  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, tr) {
      return sum + tr['value'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactions.map((tr) {
          return ChartBar(
            label: tr['day'],
            value: tr['value'],
            percentage: (tr['value'] as double) / _weekTotalValue,
          );
        }).toList(),
      ),
    );
  }
}