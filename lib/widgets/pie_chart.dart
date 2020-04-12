import 'dart:math';

import 'package:flutter/material.dart';
import 'package:master_card/config/colors.dart';
import 'package:master_card/config/strings.dart';
import 'package:master_card/config/styles.dart';

class PieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        height: 200,
        width: 200,
        decoration: boxDecoration[0],
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: CustomPaint(
                child: Container(),
                foregroundPainter: PieChartPainer(),
              ),
            ),
            Center(
              child: Container(
                height: 70.0,
                width: 70,
                decoration: boxDecoration[0],
                child: Center(child: Text("\$1235", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PieChartPainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    var paint = new Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 50;

    double total = 0;
    expenses.forEach((element) {
      total += element['amount'];
    });

    var startRadian = -pi / 2;
    for (int i = 0; i < expenses.length; i++) {
      var currentExpense = expenses[i];
      var sweepRadian = (currentExpense['amount'] / total) * 2 * pi;
      paint.color = AppColors.pieColors[i];
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          startRadian, sweepRadian, false, paint);
      startRadian += sweepRadian;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

final boxDecoration = [
  BoxDecoration(
      shape: BoxShape.circle, boxShadow: customShadow, color: primaryColor)
];
