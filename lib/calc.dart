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
String number = '';
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
      body: SafeArea(child: Column(
        children:[
          Container(height: 100, alignment: Alignment.centerRight,color: Colors.black,child:
            Column(children: [
              const SizedBox(height: 30,),
              Text(question, textAlign: TextAlign.right, style: const TextStyle(fontSize: 40, color: Colors.white)),],),),
          Container(height: 259, alignment: Alignment.centerRight,color: Colors.black,child:
            Column(children: [
              const SizedBox(height: 30,),
              Text(result.toString(), style: const TextStyle(fontSize: 60, color: Colors.white)),
            ],)),
          Container(color: Colors.black, child: Row(
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
          Container(color: Colors.black, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: () {
                setState(() {
                  question+='7';
                  number = (number + '7');
                });
              }, child: const Text('7', style: bTextbutton,),),
              TextButton(onPressed: () {
                setState(() {
                  question+='8';
                  number = (number + '8');
                });
              }, child: const Text('8', style: bTextbutton,),),
              TextButton(onPressed: () {
                setState(() {
                  question+='9';
                  number = (number + '9');
                });
              }, child: const Text('9', style: bTextbutton,),),
              TextButton(onPressed: () {
                calc('x');
              }, child: const Text('x', style: tTextbutton,),),
          ],),),
          Container(color: Colors.black, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: () {
                setState(() {
                  question+='4';
                  number = (number + '4');
                });
              }, child: const Text('4', style: bTextbutton,),),
              TextButton(onPressed: () {
                setState(() {
                  question+='5';
                  number = (number + '5');
                });
              }, child: const Text('5', style: bTextbutton,),),
              TextButton(onPressed: () {
                setState(() {
                  question+='6';
                  number = (number + '6');
                });
              }, child: const Text('6', style: bTextbutton,),),
              TextButton(onPressed: () {
                calc('-');
              }, child: const Text('-', style: tTextbutton,),),
            ],),),
          Container(color: Colors.black, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: () {
                setState(() {
                  question+='1';
                  number = (number + '1');
                });
              }, child: const Text('1', style: bTextbutton,),),
              TextButton(onPressed: () {
                setState(() {
                  question+='2';
                  number = (number + '2');
                });
              }, child: const Text('2', style: bTextbutton,),),
              TextButton(onPressed: () {
                setState(() {
                  question+='3';
                  number = (number + '3');
                });
              }, child: const Text('3', style: bTextbutton,),),
              TextButton(onPressed: () {
                calc('+');
              }, child: const Text('+', style: tTextbutton,),),
            ],),),
          Container(color: Colors.black, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: () {
                setState(() {
                  question+='00';
                  number = number + '00';
                });
              }, child: const Text('00', style: bTextbutton,),),
              TextButton(onPressed: () {
                setState(() {
                  question+='0';
                  number = number + '0';
                });
              }, child: const Text('0', style: bTextbutton,),),
              TextButton(onPressed: () {
                setState(() {
                  question+=',';
                  number = number + '.';
                });
              }, child: const Text(',', style: bTextbutton,),),
              TextButton(onPressed: () {
                calc('=');
                result;
              }, child: const Text('=', style: tTextbutton,),),
            ],),),
        ],
      )
    ),);
  }
}