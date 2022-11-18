import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpa_calculator/res/dynamic_widget.dart';
import 'package:gpa_calculator/res/text_styles.dart';
import 'package:gpa_calculator/result_screen.dart';
import 'package:gpa_calculator/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool validation = false;
  List<MyCustomWidget> dynamicWidget = [
    MyCustomWidget(),
    MyCustomWidget(),
    MyCustomWidget()
  ];
  void addWidget() {
    dynamicWidget.add(MyCustomWidget());
    setState(() {});
  }

  void getGpa() {
    double resultantgpa = 0.00;
    double totalGpa = 0.00;
    double totalCredithours = 0.00;
    double gpa = 0.0;
    double credit = 0.0;
    for (var value in dynamicWidget) {
      gpa = double.parse(value.gpa.text);
      credit = double.parse(value.creditHours.text);
      final result = gpa * credit;
      totalGpa += result;
      totalCredithours += credit;
    }
    resultantgpa = totalGpa / totalCredithours;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResultScreen(gpa: resultantgpa)));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return WillPopScope(
        child: Scaffold(
          backgroundColor: Color(0xff334562),
          appBar: AppBar(
            backgroundColor: Color(0xff47466F),
            title: Text(
              'GPA CALCULATOR',
              style: appBarTextStyle,
            ),
            centerTitle: true,
            elevation: 0.0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                //MyCustomWidget(),
                Expanded(
                  child: ListView.builder(
                      itemCount: dynamicWidget.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                    onTap: () {
                                      dynamicWidget.removeAt(index);
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.cancel_outlined,
                                      color: Colors.red,
                                      size: 30,
                                    ))),
                            dynamicWidget[index],
                            SizedBox(
                              height: height * 0.03,
                            ),
                          ],
                        );
                      }),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                GestureDetector(
                  onTap: () {
                    addWidget();
                  },
                  child: Container(
                    height: height * 0.08,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Color(0xffD9CFCF),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.add_comment_outlined,
                          size: 30,
                          color: Colors.black.withOpacity(0.7),
                        ),
                        Text(
                          'Add Subject',
                          style: appBarTextStyle.copyWith(
                              fontSize: 30,
                              color: Colors.black.withOpacity(0.7)),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                GestureDetector(
                  onTap: () {
                    if (dynamicWidget.length != 0) {
                      validation = false;
                      for (var value in dynamicWidget) {
                        if (value.gpa.text.isEmpty ||
                            value.creditHours.text.isEmpty) {
                          validation = true;
                        }
                      }
                      if (validation == true) {
                        Utils().toastMessage('Fill all the required fields');
                      } else {
                        getGpa();
                      }
                    } else {
                      Utils().toastMessage('Add atleast 1 subject');
                    }
                  },
                  child: Container(
                    height: height * 0.08,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Color(0xff2B8B1B),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.calculate_rounded,
                          size: 30,
                          color: Colors.white.withOpacity(0.7),
                        ),
                        Text(
                          'Calculate',
                          style: appBarTextStyle.copyWith(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        onWillPop: () async {
          SystemNavigator.pop();
          return true;
        });
  }
}
