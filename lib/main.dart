import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 230, 139, 12)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("flutter container"),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'BMI',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10),
              TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your weight'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number),
              SizedBox(height: 10),
              TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your height in feet'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number),
              SizedBox(height: 10),
              TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                    label: Text('Enter your height in inchs'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inchController.text.toString();

                  if (wt != "" && ft != "" && inch != "") {
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (iFt * 12) + iInch;
                    var tCm = tInch * 2.54;
                    var tM = tCm / 100;
                    var BMI = iWt / (tM * tM);

                    var msg = "";
                    if (BMI > 25) {
                      msg = 'you are obese';
                    } else if (BMI < 18) {
                      msg = 'You are under weight';
                    } else {
                      msg = 'you are healthy!';
                    }
                    setState(() {
                      result = "  your BMI is ${BMI.toStringAsFixed(4)} $msg";
                    });
                  } else {
                    setState(() {
                      result = 'Please fill all the required fields';
                    });
                  }
                },
                child: Text('Calculate'),
              ),
              SizedBox(
                height: 11,
              ),
              Text(result)
            ],
          ),
        ),
      ),
    );
  }

  // void calculatedBMI() {
  //   var bmi = weightController / (heightController * heightController);
  // }
}
