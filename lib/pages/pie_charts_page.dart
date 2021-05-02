import 'package:design/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class PieChartsPage extends StatefulWidget {
  @override
  _PieChartsPageState createState() => _PieChartsPageState();
}

class _PieChartsPageState extends State<PieChartsPage> {
  double percentage = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            percentage += 10;
            if (percentage > 100) {
              percentage = 0;
            }
          });
        },
        child: Icon(Icons.refresh),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                percentage: percentage,
                color: Colors.red,
              ),
              CustomRadialProgress(percentage: percentage, color: Colors.blue),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(percentage: percentage, color: Colors.green),
              CustomRadialProgress(percentage: percentage, color: Colors.amber),
            ],
          )
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  const CustomRadialProgress({
    @required this.percentage,
    @required this.color,
  });

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: RadialProgress(
        percentage: percentage,
        primaryColor: this.color,
        secondaryColor: Colors.grey,
        secondaryThickness: 5.0,
      ),
    );
  }
}
