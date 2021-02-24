import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  // Controladores

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  // Função para enviar a transação para o formulário
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: valueController,
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: () {
                    final title = titleController.text;

                    // Tentando fazer a conversão do valor usando o double.tryParse, caso não ocorra
                    // passará o 0.0 (zero) por padrão
                    final value = double.tryParse(valueController.text) ?? 0;

                    onSubmit(title, value);
                  },
                  child: Text('Nova Tansação'),
                  textColor: Colors.purple,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
