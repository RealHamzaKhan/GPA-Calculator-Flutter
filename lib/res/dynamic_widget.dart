import 'package:flutter/material.dart';
class MyCustomWidget extends StatelessWidget {
  final subject=TextEditingController();
  final creditHours=TextEditingController();
  final gpa=TextEditingController();
  MyCustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final height=MediaQuery.of(context).size.height*1;
    final width=MediaQuery.of(context).size.width*1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: height*0.08,
          width: width*0.30,
          decoration: BoxDecoration(
            color: Color(0xffD9D9D9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: TextFormField(
              controller: subject,
              maxLines: 1,
              style: TextStyle(
                fontFamily: 'Georgia',
                fontSize: 15,
              ),
              decoration: InputDecoration(
                  hintText: 'Subject Name',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10)
              ),
            ),
          ),
        ),
        Container(
          height: height*0.08,
          width: width*0.25,
          decoration: BoxDecoration(
            color: Color(0xffD9D9D9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: TextFormField(
              controller: gpa,
              keyboardType: TextInputType.number,
              maxLines: 1,
              style: TextStyle(
                fontFamily: 'Georgia',
                fontSize: 15,
              ),
              decoration: InputDecoration(
                  hintText: 'Points',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20)
              ),
            ),
          ),
        ),
        Container(
          height: height*0.08,
          width: width*0.25,
          decoration: BoxDecoration(
            color: Color(0xffD9D9D9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: TextFormField(
              controller: creditHours,
              keyboardType: TextInputType.number,
              maxLines: 1,
              style: TextStyle(
                fontFamily: 'Georgia',
                fontSize: 15,
              ),
              decoration: InputDecoration(
                  hintText: 'Credit Hours',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20)
              ),
            ),
          ),
        ),
      ],
    );
  }
}