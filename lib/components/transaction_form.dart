import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {

  // Controladores

  final titleController = TextEditingController();
  final valueController = TextEditingController();

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
                    print(titleController.text);
                    print(valueController.text);
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
