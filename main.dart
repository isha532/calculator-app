import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: calculator(),
    );
  }
}
class calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<calculator> {
  dynamic displaytxt = 60;
  //Button Widget
  Widget Calcbutton(String btntxt,Color btncolor,Color txtcolor){
    return Container(
      child: MaterialButton(
        onPressed: (){
        },
        child: Text('$btntxt',
          style: TextStyle(
           fontSize: 35,
           color: txtcolor,
          ),
        ),
      shape: CircleBorder(),
      color:btncolor,
      padding:const EdgeInsets.all(20),
    ),
  );
}
@override
Widget build(BuildContext context) {
  //calculator
  return Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
      title: Text('calculator'),
      backgroundColor: Colors.black,
    ),
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
         //calculator display
         SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:Text('$Text',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color:Colors.white,
                  fontSize: 50,
                ),
                ),
              )
            ],
          ),
         ),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Calcbutton('AC', Colors.grey, Colors.black),
            Calcbutton('+/-', Colors.grey, Colors.black),
            Calcbutton('%', Colors.grey, Colors.black),
            Calcbutton('/', Colors.amber, Colors.white,)
          ],
         ),
         SizedBox(height: 10,),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Calcbutton('7', Colors.grey, Colors.white),
            Calcbutton('8', Colors.grey, Colors.white),
            Calcbutton('9', Colors.grey, Colors.white),
            Calcbutton('x', Colors.amber, Colors.white),
          ],
         ),
         SizedBox(height: 10,),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Calcbutton('4', Colors.grey, Colors.white),
            Calcbutton('5', Colors.grey, Colors.white),
            Calcbutton('6', Colors.grey, Colors.white),
            Calcbutton('-', Colors.amber, Colors.white),
          ],
         ),
         SizedBox(height: 10,),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Calcbutton('1', Colors.grey, Colors.white),
            Calcbutton('2', Colors.grey, Colors.white),
            Calcbutton('3', Colors.grey, Colors.white),
            Calcbutton('+', Colors.amber, Colors.white),
          ],
         ),
         SizedBox(height: 10,),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //this is zero button
            MaterialButton(
            padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
            onPressed: (){
            calculation('0');
            },
            shape: StadiumBorder(),
            child: Text('0',
            style: TextStyle(
              fontSize: 35,
              color:Colors.white),
            ),
            color:Colors.grey[850],
            ),
            Calcbutton('.', Colors.grey, Colors.white),
            Calcbutton('=', Colors.amber, Colors.white),
          ],
        ),
        SizedBox(height: 10,),
      ],
    ),
    ),
  );
}

//calculator logic
dynamic text ='0';
double numOne = 0;
double numTwo = 0;

dynamic result ='';
dynamic finalResult = '';
dynamic opr = '';
dynamic preOpr = '';
 void calculation(btnText){


  if(btnText == 'AC') {
    text ='0';
    numOne = 0;
    numTwo = 0;
    result = '';
    finalResult = '';
    opr = '';
    preOpr = '';

  } else if( opr == '=' && btnText == '=') {

    if(preOpr == '+') {
      finalResult = add();
    } else if(preOpr == '-') {
      finalResult = sub();
    } else if(preOpr == 'x') {
      finalResult = mul();
    }else if(preOpr == '/') {
      finalResult = div();
    }

  } else if(btnText == '+' || btnText == '-' || btnText == 'x'|| btnText == '/' || btnText == '=') {

    if(numOne == 0) {
      numOne = double.parse(result);
    } else {
      numTwo = double.parse(result);
    }

    if(opr == '+') {
      finalResult == add();
    } else if(opr == '-') {
      finalResult = sub();
    } else if(opr == 'x') {
      finalResult = mul();
    }else if(opr == '/') {
      finalResult = div();
    }
    preOpr = opr;
    opr = btnText;
    result = '';
  }
  else if(btnText == '%') {
    result = numOne / 100;
    finalResult = doescontaindecimal(result);
  } else if(btnText == '.') {
    if(!result.toString().contains('.')) {
      result = result.toString()+'.';
    }
    finalResult = result;
  }

  else if(btnText == '+/-') {
    result.toString().startsWith('-')? result = result.toString().substring(1): result = '-' + result.toString();
    finalResult;

  }

  else {
    result = result + btnText;
    finalResult = result;
  }


  setState(() {
    text = finalResult;
  });

}


String add() {
       result = (numOne + numTwo).toString();
       numOne = double.parse(result);
       return doescontaindecimal(result);
}

String sub() {
       result = (numOne - numTwo).toString();
       numOne = double.parse(result);
       return doescontaindecimal(result);
}
String mul() {
       result = (numOne * numTwo).toString();
       numOne = double.parse(result);
       return doescontaindecimal(result);
}
String div() {
       result = (numOne / numTwo).toString();
       numOne = double.parse(result);
       return doescontaindecimal(result);
}


String doescontaindecimal(dynamic result) {

  if(result.toString().contains('.')) {
    List<String> splitdecimal = result.toString().split('.');
    if(!(int.parse(splitdecimal[1]) > 0))
    return result = splitdecimal[0].toString();
  }
  return result;
}

}