import 'package:flutter/material.dart';
import 'var.dart';

const TextStyle tTextbutton = TextStyle(color: Colors.deepOrange, fontSize: 55);
const TextStyle bTextbutton = TextStyle(color: Colors.white, fontSize: 55);
class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}
num first = 0;
num second = 0;
String number ='';
num result = 0;
String opp = '';
class _CalculatorState extends State<Calculator> {

  void calc(btnText) {
    if (btnText == 'C') {
      result = 0;
      number = '';
      first = 0;
      second = 0;
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/') {
      first = int.parse(question);
      result = 0;
      opp = btnText;
    } else if (btnText == '=') {
      second = int.parse(question);
      if (opp == '+') {
        result = (first + second);
      }
      if (opp == '-') {
        result = (first - second);
      }
      if (opp == 'x') {
        result = (first * second);
      }
      if (opp == '/') {
        result = (first ~/ second);
      }
    } else {
      result = int.parse(question + btnText);
    }
    setState(() {
      question = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
         child: Column(
            children:[
          Container(height: MediaQuery.of(context).size.height * 0.2,
            alignment: Alignment.centerRight,color: Colors.black,child:
            Column(children: [
              const SizedBox(height: 60,),
              Text(question, textAlign: TextAlign.right, style: const TextStyle(fontSize: 40, color: Colors.white)),],),),
          Container(height: MediaQuery.of(context).size.height * 0.3,
              alignment: Alignment.centerRight,color: Colors.black,child:
            Column(children: [
              Text(result.toString(), style: const TextStyle(fontSize: 60, color: Colors.white)),
            ],)),
          Container(height: MediaQuery.of(context).size.height * 0.1,
            color: Colors.black, child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: () {
                calc('C');
              },child: const Text('C', style: tTextbutton,),),
              TextButton(onPressed: () {
                setState(() {
                  if (num.parse(number) > 0) {
                    question ='-$question';
                    number = '-$number';
                  }
                  else if (num.parse(number) < 0){
                    question = question.replaceAll("-","");
                    number = number.replaceAll("-", "");
                  }
                });
              },child: const Text('+/-', style: tTextbutton,),),
              TextButton(onPressed: () {
                setState(() {
                  question+="%"; //tutaj coś %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                });
              },child: const Text('%', style: tTextbutton,),),
              TextButton(onPressed: () {
                calc('/');
              },child: const Text('/', style: tTextbutton,),),
          ],),),
          Container(height: MediaQuery.of(context).size.height * 0.1,
            color: Colors.black, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: () {
                calc('7');
              }, child: const Text('7', style: bTextbutton,),),
              TextButton(onPressed: () {
                calc('8');
              }, child: const Text('8', style: bTextbutton,),),
              TextButton(onPressed: () {
                calc('9');
              }, child: const Text('9', style: bTextbutton,),),
              TextButton(onPressed: () {
                calc('x');
              }, child: const Text('x', style: tTextbutton,),),
          ],),),
          Container(height: MediaQuery.of(context).size.height * 0.1,
            color: Colors.black, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: () {
                calc('4');
              }, child: const Text('4', style: bTextbutton,),),
              TextButton(onPressed: () {
                calc('5');
              }, child: const Text('5', style: bTextbutton,),),
              TextButton(onPressed: () {
                calc('6');
              }, child: const Text('6', style: bTextbutton,),),
              TextButton(onPressed: () {
                calc('-');
              }, child: const Text('-', style: tTextbutton,),),
            ],),),
          Container(height: MediaQuery.of(context).size.height * 0.1,
            color: Colors.black, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: () {
                calc('1');
              }, child: const Text('1', style: bTextbutton,),),
              TextButton(onPressed: () {
                calc('2');
              }, child: const Text('2', style: bTextbutton,),),
              TextButton(onPressed: () {
                calc('3');
              }, child: const Text('3', style: bTextbutton,),),
              TextButton(onPressed: () {
                calc('+');
              }, child: const Text('+', style: tTextbutton,),),
            ],),),
          Container(height: MediaQuery.of(context).size.height * 0.1,
            color: Colors.black, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: () {
                calc('00');
              }, child: const Text('00', style: bTextbutton,),),
              TextButton(onPressed: () {
                calc('0');
              }, child: const Text('0', style: bTextbutton,),),
              TextButton(onPressed: () {
                calc('.');
              }, child: const Text(',', style: bTextbutton,),),
              TextButton(onPressed: () {
                calc('=');
                result;
                question = '$first $opp $second=';
              }, child: const Text('=', style: tTextbutton,),),
            ],),),
        ],
      )
    ),);
  }
}