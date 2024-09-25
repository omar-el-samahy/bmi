import 'package:flutter/material.dart';

class Secondscreen extends StatelessWidget {
  Secondscreen({super.key});
  String result = "Normal", comment = "Comment";
  Color textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    double bmi = ModalRoute.of(context)?.settings.arguments as double;
    BMIStatus() {
      if (bmi <= 18.5) {
        result = "Underweight";
        comment = "You Need To Gain More Weight";
        textColor = Colors.lightGreen;
      } else if (bmi > 18.5 && bmi <= 24.9) {
        result = "Normal";
        comment = "Your Weight Is Perfect";
        textColor = Colors.green;
      } else if (bmi > 24.9 && bmi <= 29.9) {
        result = "Overweight";
        comment = "You Need To Be Careful And Lose Some Weight";
        textColor = Colors.orange;
      } else if (bmi >= 30) {
        result = "Obese";
        comment = "You Need To Start Losing Weight Soon";
        textColor = Colors.red;
      }
    }

    BMIStatus();
    return Scaffold(
      backgroundColor: Color(0xff041732),
      appBar: AppBar(
        backgroundColor: Color(0xff041732),
        centerTitle: true,
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Your BMI Is",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 45,
              )),
          Container(
            child: Column(
              children: [
                Text("$result",
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    )),
                Text("${bmi.round()}",
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    )),
                Text("$comment",
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xff041732),
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: textColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Recalculate",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              )),
            ],
          )
        ],
      ),
    );
  }
}
