import 'package:flutter/material.dart';

main() {
  runApp(Calculator());
}

class Calculator extends StatefulWidget {
  Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  String error = "";
  dynamic result =0;
  @override
  add() {
    setState(() {
      double n1 = double.tryParse(t1.text)!;
      double n2 = double.tryParse(t2.text)!;
      result = n1 + n2;
    });
  }

  sub() {
    setState(() {
      double n1 = double.tryParse(t1.text)!;
      double n2 = double.tryParse(t2.text)!;
      result = n1 - n2;
    });
  }

  mul() {
    setState(() {
      double n1 = double.tryParse(t1.text)!;
      double n2 = double.tryParse(t2.text)!;
      result = n1 * n2;
    });
  }

  div() {
    setState(() {
      double n1 = double.tryParse(t1.text)!;
      double n2 = double.tryParse(t2.text)!;
      result = n1 / n2;
      if(n2 == 0){
result= "Infinity\nBecause You Divided By Zero\n You Can't Divide By Zero \nPlease Enter Different Number";
      }
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text("Basic Calculator",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                )),
            backgroundColor: Colors.lightGreen),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: t1,
                      decoration: InputDecoration(
                          labelText: "First Number",
                          labelStyle: TextStyle(
                            fontSize: 15,
                          ),
                          prefixIcon: Icon(Icons.numbers),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: t2,
                      decoration: InputDecoration(
                          labelText: "Second Number",
                          labelStyle: TextStyle(
                            fontSize: 15,
                          ),
                          prefixIcon: Icon(Icons.numbers),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                              borderRadius: BorderRadius.circular(15))),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.red[900],
                    borderRadius: BorderRadius.circular(10)),
                child: Text("Result Is $result",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                        shape: CircleBorder(),
                        onPressed: add,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.add, color: Colors.red[900])),
                    FloatingActionButton(
                        shape: CircleBorder(),
                        onPressed: sub,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.remove, color: Colors.red[900])),
                    FloatingActionButton(
                        shape: CircleBorder(),
                        onPressed: mul,
                        backgroundColor: Colors.white,
                        child: Text("X",
                            style: TextStyle(
                                color: Colors.red[900],
                                fontSize: 20,
                                fontWeight: FontWeight.bold))),
                    FloatingActionButton(
                        shape: CircleBorder(),
                        onPressed: div,
                        backgroundColor: Colors.white,
                        child: Text("/",
                            style: TextStyle(
                                color: Colors.red[900],
                                fontSize: 20,
                                fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
