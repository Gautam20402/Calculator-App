import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:the_calculator/splashscreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return homestate();
  }
}

class homestate extends State<Home>{

  var input = "";
  var output = "";
  var opration = "";
  var hideinput = false;
  var outsize = 34.0;

  onbuttonclick(value){

    setState(() {
      if(value=="AC"){
        input="";
        output="";
      }
      else if(value=='C'){
        input=input.substring(0,input.length-1);
      }
      else if (value=="="){
        if (input.isNotEmpty){
          var userinput = input;
          userinput = input.replaceAll("X","*");
          Parser p = Parser();
          Expression expression = p.parse(userinput);
          ContextModel cm = ContextModel();
          var finalvalue = expression.evaluate(EvaluationType.REAL,cm);
          output = finalvalue.toString();
          if (output.endsWith(".0")){
            output = output.substring(0,output.length-2);
          }
          input = output;
          hideinput = true;
          outsize = 52;
        }
      } else{
        input = input+value;
        hideinput = false;
        outsize = 34;
      }
    });
  }




  Widget button({text, tcolor = Colors.white, buttonbgcolor=Colors.white12}){
    return Expanded(
        child: Container(
          margin: EdgeInsets.all(8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(38),
              ),
              padding: EdgeInsets.all(26),
              backgroundColor: buttonbgcolor,
            ),
              onPressed:()=> onbuttonclick(text),
              child: Text(
                  text,
                style: TextStyle(
                  fontSize: 22,
                  color: tcolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ),
        ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text( hideinput ? '' : input,
                    style: TextStyle(
                      fontSize: 48,
                      color: Colors.white
                    ),
                    ),
                    Container(height: 10,),
                    Text(output,
                      style: TextStyle(
                          fontSize: outsize,
                          color: Colors.white.withOpacity(0.6)
                      ),
                    ),
                    Container(height: 20,),
                  ],
                ),
              ),
          ),
          Row(
            children: [
              button(text: "AC",buttonbgcolor: Colors.red),
              button(text: "C",tcolor: Colors.red, buttonbgcolor: Colors.grey),
              button(text: "%",tcolor: Colors.black,buttonbgcolor: Colors.grey),
              button(text: "/",buttonbgcolor: Colors.green,tcolor: Colors.black),
            ],
          ),
          Row(
            children: [
              button(text: "7"),
              button(text: "8"),
              button(text: "9"),
              button(text: "X",buttonbgcolor: Colors.green,tcolor: Colors.black),
            ],
          ),
          Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(text: "6"),
              button(text: "-",buttonbgcolor: Colors.green,tcolor: Colors.black),
            ],
          ),
          Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(text: "3"),
              button(text: "+",buttonbgcolor: Colors.green,tcolor: Colors.black),
            ],
          ),
          Row(
            children: [
              button(text: "0"),
              button(text: "."),
              button(text: "",buttonbgcolor: Colors.transparent),
              button(text: "=",buttonbgcolor: Colors.green),
            ],
          ),
        ],
      ),
    );
  }
}
