import 'package:flutter/material.dart';
import 'package:master_card/config/colors.dart';
import 'package:master_card/config/strings.dart';
import 'package:master_card/widgets/pie_chart.dart';

class ExpenseSection extends StatelessWidget {
  List _buildRowList() {
    final _children = <Widget>[];
    for (int i = 0; i < expenses.length; i++) {
      _children.add(Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 5,
              backgroundColor:
                  AppColors.pieColors[expenses.indexOf(expenses[i])],
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              expenses[i]['name'],
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ));
    }
    return _children.toList();
  }

  _buildExpenses() {
    return expenses
        .map((value) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 5,
                    backgroundColor:
                        AppColors.pieColors[expenses.indexOf(value)],
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    value['name'],
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Expenses',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _buildRowList(),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: PieChart(),
            ),
          ],
        ),
      ],
    );
  }
}
