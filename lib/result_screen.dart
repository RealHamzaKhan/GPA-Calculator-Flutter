import 'package:flutter/material.dart';
import 'package:gpa_calculator/res/message_texts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
class ResultScreen extends StatefulWidget {
  double gpa;
   ResultScreen({required this.gpa,Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  MessageText _messageText=MessageText();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff334562),
      appBar: AppBar(
        backgroundColor: Color(0xff334562),
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: (){
              widget.gpa=0.0;
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Center(
          //   child: Text('YOUR GPA IS :',style: TextStyle(
          //     fontSize: 25,
          //     color: Colors.white70,
          //     fontFamily: 'Georgia',
          //     fontWeight: FontWeight.w600,
          //   ),),
          // ),
          // SizedBox(height: MediaQuery.of(context).size.height*0.04,),
          // Center(
          //   child: Text(widget.gpa.toStringAsFixed(2),style: TextStyle(
          //     fontSize: 35,
          //     fontFamily: 'Georgia',
          //     color: Colors.white70,
          //     fontWeight: FontWeight.bold,
          //   ),),
          // ),
      SfRadialGauge(
        animationDuration: 2000,
      axes: <RadialAxis>[
      RadialAxis(minimum: 0, maximum: 4,
          useRangeColorForAxis: true,
          axisLineStyle: AxisLineStyle(
            thickness: 30,
          ),
          ranges: <GaugeRange>[
            GaugeRange(startValue: 0, endValue: 2, color:Colors.red),
            GaugeRange(startValue: 2,endValue: 3,color: Colors.orange),
            GaugeRange(startValue: 3,endValue: 4,color: Colors.green)],
          pointers: <GaugePointer>[
            NeedlePointer(
                needleColor: Colors.purpleAccent,
                enableAnimation: true,
                value: widget.gpa)],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(widget: Container(child:
            Text(widget.gpa.toStringAsFixed(2),style: TextStyle(fontFamily: 'Georgia',fontSize: 30,fontWeight: FontWeight.bold,
                color: Colors.purpleAccent))),
                angle: 90, positionFactor: 0.5
            )]
      )
        ],
      ),
          Text(_messageText.message(widget.gpa),textAlign: TextAlign.center,style: TextStyle(
            color: Colors.white38,
            fontSize: 20,
          ),),
    ]
    )
    );
  }
}
