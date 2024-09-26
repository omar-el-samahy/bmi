import 'package:flutter/material.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  double h = 100, age = 20, weight = 50;
  late double calculatedBMI;
  late String g;
  bool tap = false;
  Color containerColor1 = Color(0xff041732);
  Color containerColor2 = Color(0xff041732);
  int i = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color(0xff041732),
          unselectedItemColor: Colors.blue,
          currentIndex: i,
          onTap: (int x) {
            i = x;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.contacts), label: "Login"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_max_outlined), label: "BMI"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate_outlined), label: "Calculator"),
          ]),
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
        children: [
          // Gender Selection
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  // Male
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: containerColor1,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            tap = true;
                            g = "male";
                            if (tap == true && g == "male") {
                              containerColor1 = Colors.green;
                              containerColor2 = Color(0xff041732);
                            }
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.male_rounded,
                                size: 100, color: Colors.white),
                            Text(
                              "Male",
                              style:
                                  TextStyle(fontSize: 35, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  // Female
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: containerColor2,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            tap = true;
                            g = "female";
                            if (tap == true && g == "female") {
                              containerColor2 = Colors.green;
                              containerColor1 = Color(0xff041732);
                            }
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.female_rounded,
                                size: 100, color: Colors.white),
                            Text(
                              "Female",
                              style:
                                  TextStyle(fontSize: 35, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Height Slider
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff041732),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Height",
                        style: TextStyle(fontSize: 20, color: Colors.white70),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${h.round()}",
                            style: TextStyle(fontSize: 35, color: Colors.white),
                          ),
                          Text(
                            "cm",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white70),
                          ),
                        ],
                      ),
                      Slider(
                        value: h,
                        onChanged: (double x) {
                          h = x;
                          setState(() {});
                        },
                        min: 100,
                        max: 220,
                        activeColor: Colors.blue,
                        inactiveColor: Color(0xffbdbdbd),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Age & Weight
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  // Age
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff041732),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                          Text(
                            "${age.round()}",
                            style: TextStyle(fontSize: 35, color: Colors.white),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: FloatingActionButton(
                                  heroTag: null,
                                  shape: CircleBorder(),
                                  onPressed: ageDown,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.remove,
                                      color: Color(0xff041732)),
                                ),
                              ),
                              Expanded(
                                child: FloatingActionButton(
                                  heroTag: null,
                                  shape: CircleBorder(),
                                  onPressed: ageUp,
                                  backgroundColor: Colors.white,
                                  child:
                                      Icon(Icons.add, color: Color(0xff041732)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  // Weight
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff041732),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                          Text(
                            "${weight.round()}",
                            style: TextStyle(fontSize: 35, color: Colors.white),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: FloatingActionButton(
                                  heroTag: null,
                                  shape: CircleBorder(),
                                  onPressed: wDown,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.remove,
                                      color: Color(0xff041732)),
                                ),
                              ),
                              Expanded(
                                child: FloatingActionButton(
                                  heroTag: null,
                                  shape: CircleBorder(),
                                  onPressed: wUp,
                                  backgroundColor: Colors.white,
                                  child:
                                      Icon(Icons.add, color: Color(0xff041732)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Calculate BMI Button
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff041732),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: MaterialButton(
                  onPressed: () {
                    calculatedBMI = calc();
                    Navigator.pushNamed(context, "s2",
                        arguments: calculatedBMI);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Color(0xff041732),
                  child: Text(
                    "Calculate BMI",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ageUp() {
    setState(() {
      age++;
    });
  }

  ageDown() {
    setState(() {
      age--;
    });
  }

  wUp() {
    setState(() {
      weight++;
    });
  }

  wDown() {
    setState(() {
      weight--;
    });
  }

  double calc() {
    double bmi = weight / ((h / 100) * (h / 100));
    return bmi;
  }
}
