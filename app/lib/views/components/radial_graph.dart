import 'dart:math';

import 'package:app/models/project.dart';
import 'package:app/models/task.dart';
import 'package:flutter/material.dart';

class RadialGraph extends StatelessWidget {
  const RadialGraph({
    super.key,
    required this.project,
    required this.tasks
  });

  final Project project;
  final List<Task> tasks;

  List<List<double>> data(){
    List<List<double>> data = [];
    // group by category
    List<String> categories = tasks.map((e) => e.category ?? "").toSet().toList();
    tasks.forEach((Task task) {
      data.add([task.progress, 1.0 - task.progress]);
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewInsets.top + 112
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${project.created.difference(DateTime.now()).inDays.abs()} days".toUpperCase(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        "${tasks.where((e) => e.progress == 1.0).length}/${tasks.length}",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 42,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      Text(
                        "",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: CustomPaint(
                        painter: RadialGraphPainter(
                          data: [[1, 1], [1, 0.3]],
                        ),
                      )
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Wrap(
                            spacing: 4,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                                  shape: BoxShape.circle
                                ),
                              ),
                              Text(
                                "Done".toUpperCase(),
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                          Wrap(
                            spacing: 4,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(0.2),
                                  shape: BoxShape.circle
                                ),
                              ),
                              Text(
                                "To Do".toUpperCase(),
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RadialGraphPainter extends CustomPainter {
  RadialGraphPainter({
    required this.data
  });

  final List<List<double>> data;

  final List<Color> colors = [
    Colors.blueAccent,
    Colors.indigoAccent,
    Colors.purpleAccent,
    Colors.greenAccent,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.transparent
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    int index = 0;
    double last = (3 * pi) / 2;
    data.forEach((List<double> part) {
      double firstAngle = pi * part.first;
      paint.color = colors[index].withOpacity(0.2);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        last,
        (firstAngle - 0.12),
        false,
        paint
      );
      paint.color = colors[index].withOpacity(1);
      double lastAngle = pi * part.last;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        last,
        (lastAngle - 0.12),
        false,
        paint
      );
      last = last + firstAngle;
      index++;
    });
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}