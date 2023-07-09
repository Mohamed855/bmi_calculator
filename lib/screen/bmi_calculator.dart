import 'dart:math';

import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});
  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  Color boxColor = Color.fromARGB(255, 14, 16, 34);
  double height = 170.0, weight = 60.0, age = 20.0;
  bool isMale = true;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Color.fromARGB(255, 1, 4, 24),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 1, 4, 24),
          title: Text(
            'BMI CALCULATOR',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: isMale ? Colors.blue : boxColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              color: Colors.white,
                              size: 120.0,
                            ),
                            Text(
                              'MALE',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: isMale ? boxColor : Colors.blue,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              color: Colors.white,
                              size: 120.0,
                            ),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.toInt()}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' cm',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: height,
                      min: 80,
                      max: 220,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT (Kg)',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${weight.toInt()}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              increaseDecreaseButton(
                                onPressed: () {
                                  setState(
                                    () => weight > 35 ? weight-- : weight,
                                  );
                                },
                                icon: Icons.remove,
                              ),
                              increaseDecreaseButton(
                                onPressed: () {
                                  setState(
                                    () => weight < 150 ? weight++ : weight,
                                  );
                                },
                                icon: Icons.add,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${age.toInt()}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              increaseDecreaseButton(
                                onPressed: () {
                                  setState(
                                    () => age > 10 ? age-- : age,
                                  );
                                },
                                icon: Icons.remove,
                              ),
                              increaseDecreaseButton(
                                onPressed: () {
                                  setState(
                                    () => age < 80 ? age++ : age,
                                  );
                                },
                                icon: Icons.add,
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
            SizedBox(
              height: 70.0,
              child: ElevatedButton(
                onPressed: () {
                  bmiResultShowDialog(weight, height, isMale, context);
                },
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromWidth(double.infinity),
                ),
              ),
            ),
          ],
        ),
      );
}

Widget increaseDecreaseButton({
  required onPressed,
  required icon,
}) =>
    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: FloatingActionButton(
        onPressed: onPressed,
        child: Icon(
          icon,
          size: 25.0,
        ),
        mini: true,
      ),
    );

bmiResultShowDialog(weight, height, isMale, ctx) {
  double bmi = weight / pow(height / 100, 2);
  int healthyWeight = 0;
  String state = '';

  if (isMale) {
    if (bmi <= 18.5) {
      state = 'Under Weight';
    } else if (bmi <= 24.9) {
      state = 'Healthy Weight';
    } else if (bmi <= 29.9) {
      state = 'Over Weight';
    } else {
      state = 'Obesity';
    }
  } else {
    if (bmi <= 21) {
      state = 'Under Weight';
    } else if (bmi <= 28) {
      state = 'Healthy Weight';
    } else if (bmi <= 31) {
      state = 'Over Weight';
    } else {
      state = 'Obesity';
    }
  }

  if (isMale) {
    healthyWeight = (height - 100).round();
  } else {
    healthyWeight = (height - 90).round();
  }

  showDialog<void>(
    context: ctx,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(state),
        content: Text(
          '''Your BMI = ${bmi.round()}
${state != 'Healthy Weight' && height >= 140.0 ? 'Your healthy weight is $healthyWeight Kg' : ''}''',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
