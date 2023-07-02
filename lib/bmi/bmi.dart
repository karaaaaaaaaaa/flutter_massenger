import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BMI extends StatefulWidget {
  // const BMI({super.key});
  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  double height = 120.0;
  int age = 16;
  bool Male = true;
  int weight = 16;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Male = true;
                    });
                  },
                  child: Container(
                    width: 160,
                    height: 170,
                    decoration: BoxDecoration(
                        color: Male ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          Icons.male,
                          size: 65,
                        ),
                        Text(
                          "male",
                          style: TextStyle(fontSize: 42),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                   setState(() {
                      Male = false;
                   });
                  },
                  child: Container(
                    width: 160,
                    height: 170,
                    decoration: BoxDecoration(
                        color: Male ? Colors.grey : Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          Icons.female,
                          size: 65,
                        ),
                        Text(
                          "female",
                          style: TextStyle(fontSize: 42),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(right: 15),
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "HEIGHT",
                    style: TextStyle(fontSize: 42),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${height.round()}",
                        style: TextStyle(fontSize: 42),
                      ),
                      Text(
                        "CM",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Slider(
                      value: height,
                      min: 20,
                      max: 200,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      })
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: 160,
                  height: 190,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "AGE",
                        style: TextStyle(fontSize: 42),
                      ),
                      Text(
                        "${age}",
                        style: TextStyle(fontSize: 42),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(Icons.add)),
                          SizedBox(
                            width: 20,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            child: Icon(Icons.remove),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 160,
                  height: 190,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "weight",
                        style: TextStyle(fontSize: 42),
                      ),
                      Text(
                        "${weight}",
                        style: TextStyle(fontSize: 42),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(Icons.add)),
                          SizedBox(
                            width: 20,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            child: Icon(Icons.remove),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            // SizedBox(height: 22,),
            Spacer(),
            Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12)),
                width: double.infinity,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "calculation",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ))),
          ],
        ),
      ),
    );
  }
}
