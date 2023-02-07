import 'package:calculatorproject/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


void  main() {
  
  runApp(const MaterialApp(
    
    home : Calculator(),
    debugShowCheckedModeBanner: false,
  ));
  
}
class Calculator extends StatefulWidget {
  
  const Calculator({Key?key}) :super( key :key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // ignore: prefer_typing_uninitialized_variables
  var buttonBgColor;

  //variables
  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = "";
  var output = "";
  var operation = "";
  var hideiput = false;
  var outputSize = 34.0;



  onButtonClick(value) {
    // if value  is AC
    if(value == "AC") {
       input = "";
      output = "";
    }
    else if(value == "<") {
      if(input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }


      
    }
    else if(value == "=") {
      if(input.isNotEmpty) {
         var userinput = input;
      
     
      userinput = input.replaceAll("x", "*");
      Parser p = Parser();
      Expression expression = p.parse(userinput);
      ContextModel cm = ContextModel();
      var finalValue = expression.evaluate(EvaluationType.REAL, cm);
      output = finalValue.toString();
     if(output.endsWith(".0") ) {
       output = output.substring(0, output.length - 2);
     }
     input = output ;
     hideiput = true;
     outputSize = 52;
      }

    }
    else {
      input = input + value;
       hideiput = false;
     outputSize = 34;
    }
    setState(() {});
  }

  

  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          //input output
          Expanded(child: Container(
            width:  double.infinity,
            padding: const EdgeInsets.all(12),
       
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children:  [
                Text(
                hideiput ? '' :  input,
                  style: TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                ),),
                SizedBox(
                  height: 20,
                ),
                Text(
                  output,
                  style: TextStyle(
                  fontSize: outputSize,
                  color: Colors.white.withOpacity(0.7),
                ),),
                SizedBox(
                  height: 20,
                ),

              ],
            ),
            ),),
          Row(
            children: [
             button(text: "AC", buttonBgColor : operaorColor,tColor: orangeColor),
             button(text: "<", buttonBgColor :  operaorColor,tColor: orangeColor),
             button(text: "",buttonBgColor : Colors.transparent),
             button(text: "/",buttonBgColor : operaorColor,tColor: orangeColor),
            ],
          ),
           Row(
            children: [
             button(text: "7", buttonBgColor : Colors.black87),
             button(text: "8", buttonBgColor : Colors.black87),
             button(text: "9",buttonBgColor : Colors.transparent),
             button(text: "x",buttonBgColor : operaorColor,tColor: orangeColor),
            ],
          ),
           Row(
            children: [
             button(text: "4", buttonBgColor : Colors.black87),
             button(text: "5", buttonBgColor : Colors.black87),
             button(text: "6",buttonBgColor : Colors.transparent),
             button(text: "-",buttonBgColor : operaorColor,tColor: orangeColor),
            ],
          ),
           Row(
            children: [
             button(text: "1", buttonBgColor : Colors.black87),
             button(text: "2", buttonBgColor : Colors.black87),
             button(text: "3",buttonBgColor : Colors.transparent),
             button(text: "+",buttonBgColor :  operaorColor,tColor: orangeColor),
            ],
          ),
          Row(
            children: [
             button(text: "%", buttonBgColor : operaorColor,tColor: orangeColor),
             button(text: "0", buttonBgColor : Colors.black87),
             button(text: ".",buttonBgColor :  operaorColor,tColor: orangeColor),
             button(text: "=",buttonBgColor : orangeColor,tColor: Colors.white),
            ],
          ),
        ],
      ),
      
    );
    
  }
Widget button({
  text,tColor = Colors.white, buttonColor = buttonColor, required Color buttonBgColor}) {
   return Expanded(child: Container(
      margin: const EdgeInsets.all(8),
      child :ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
          
          ),
          
          padding: const EdgeInsets.all(22),
          primary: buttonBgColor ,
        ),
        onPressed: () => onButtonClick(text),
        child:  Text(text,style: TextStyle(
          fontSize: 18,
          color: tColor ,
          fontWeight: FontWeight.bold,
        ),),
      ),
    ));
  }
 
}
