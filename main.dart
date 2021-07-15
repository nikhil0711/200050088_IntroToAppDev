import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=> runApp(MaterialApp(
  home: cal(),
));


class cal extends StatefulWidget {

  @override
  State<cal> createState() => _calState();
}

class _calState extends State<cal> {
  String calculation='0';
  String ans='0';
  String answer='0';
  String number1='0';
  String number2='0';
  bool add=false;
  bool subtract=false;
  bool multiply=false;
  bool divide=false;
  bool mod=false;
  bool check_n1=false;
  bool check_n2=false;

  int check(){
    if (add){
      return 1;
    }
    else if (subtract){
      return 2;
    }
    else if (multiply){
      return 3;
    }
    else if (divide){
      return 4;
    }
    else if (mod){
      return 5;
    }
    else return -1;
  }

  void evaluate(){

    if (check()==1){
      double n1=double.parse(number1);
      double n2=double.parse(number2);
      double m=n1+n2;
      ans=m.toString();
      number1=ans;
      answer=ans;
    }
    else if (check()==2){
      double n1=double.parse(number1);
      double n2=double.parse(number2);
      double m=n1-n2;
      ans=m.toString();
      number1=ans;
      answer=ans;
    }
    else if (check()==3){
      double n1=double.parse(number1);
      double n2=double.parse(number2);
      double m=n1*n2;
      ans=m.toString();
      number1=ans;
      answer=ans;
    }
    else if (check()==4){
      double n1=double.parse(number1);
      double n2=double.parse(number2);
      double m=n1/n2;
      ans=m.toString();
      number1=ans;
      answer=ans;
    }
    else if (check()==5){
      double n1=double.parse(number1);
      double n2=double.parse(number2);
      int m=0;
      ans=m.toString();
      number1=ans;
      answer=ans;
    }
  }

  void change_operation_state(){
    subtract=false;
    add=false;
    divide=false;
    multiply=false;
    mod=false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('Calculator'),
      backgroundColor: Colors.grey[900],
      elevation: 0.0,
    ),
    backgroundColor: Colors.grey[900],
    body:Column(
      mainAxisAlignment: MainAxisAlignment.end,

    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width:395.0,
              height:35.0,
              child:Text(
                '$calculation',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.grey[800],
                ),
                textAlign: TextAlign.right,
              )
            ) ,
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: SizedBox(
                width:395.0,
                height:60.0,
                child: Text(
                  '$answer',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize:60.0,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),
        ],
      ),
    Divider(
      height: 50.0,
      color: Colors.white,
    ),
    Row(

      children: <Widget>[

        Expanded(
          child: FlatButton(
            height: 70.0,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey.shade800,width:0.8)
            ),
            onPressed:(){
              setState(() {
                answer='0';
                ans='0';
                calculation='0';
                change_operation_state();
                number1='0';
                number2='0';
                check_n1=false;
              });
            },

            child: Text(
              'C',
              style:TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            color: Colors.deepOrange,
          ),
        ),

        Expanded(

          child: FlatButton(
            onPressed:(){},
            height: 70.0,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey.shade900,width:0.8)
            ),
            child: Text(
                '( )',
              style: TextStyle(
                color: Colors.green[500],
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              )
            ),
            color: Colors.grey[800],
          ),
        ),

        Expanded(
          child: FlatButton(
            onPressed:(){
              setState(() {
                calculation+='%';
                evaluate();
                answer='0';
                change_operation_state();
                mod=true;
                number2='0';
              });
            },
            height: 70.0,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey.shade900,width:0.8)
            ),
            child: Text(
                '%',
                style: TextStyle(
                  color: Colors.green[500],
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
            ),
            color: Colors.grey[800],
          ),
        ),

        Expanded(
          child: FlatButton(
            onPressed:(){
              setState(() {
                calculation+='/';
                evaluate();
                answer='0';
                change_operation_state();
                divide=true;
                number2='0';
                check_n1=true;
              });
            },
            height: 70.0,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey.shade900,width:0.8)
            ),
            child: Text(
                '/',
                style: TextStyle(
                  color: Colors.green[500],
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
            ),
            color: Colors.grey[800],
          ),
        ),
      ],
    ),

      Row(
        children: <Widget>[

          Expanded(
            child: FlatButton(
              onPressed:(){
                setState(() {
                  if (answer=='0') answer='7';
                  else answer=answer+'7';

                  if (calculation=='0'){calculation='7';}
                  else calculation=calculation+'7';
                  if (!check_n1){
                    number1=number1+'7';
                  }
                  else {
                    number2=number2+'7';
                  }
                });

              },
              height: 70.0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade900,width:0.8)
              ),
              child: Text('7',style:TextStyle(color:Colors.white,fontSize: 25.0,),),
              color: Colors.grey[700],
            ),
          ),

          Expanded(
            child: FlatButton(
              onPressed:(){
                setState(() {
                  if (answer=='0') answer='8';
                  else answer=answer+'8';
                  if (calculation=='0'){calculation='8';}
                  else calculation=calculation+'8';
                  if (!check_n1){
                    number1=number1+'8';
                  }
                  else {
                    number2=number2+'8';
                  }
                });
              },
              height: 70.0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade800,width:0.8)
              ),
              child: Text('8',style:TextStyle(color:Colors.white,fontSize: 25.0,),),
              color: Colors.grey[700],
            ),
          ),

          Expanded(
            child: FlatButton(
              onPressed:(){
                setState(() {
                  if (answer=='0') answer='9';
                  else answer=answer+'9';
                  if (calculation=='0'){calculation='9';}
                  else calculation=calculation+'9';
                  if (!check_n1){
                    number1=number1+'9';
                  }
                  else {
                    number2=number2+'9';
                  }
                });
              },
              height: 70.0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade800,width:0.8)
              ),
              child: Text('9',style:TextStyle(color:Colors.white,fontSize: 25.0,)),
              color: Colors.grey[700],
            ),
          ),

          Expanded(
            child: FlatButton(
              onPressed:(){
                setState(() {
                  calculation+='x';
                  evaluate();
                  answer='0';
                  change_operation_state();
                  multiply=true;
                  number2='0';
                  check_n1=true;
                });
              },
              height: 70.0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade900,width:0.8)
              ),
              child: Text(
                  'X',
                  style: TextStyle(
                    color: Colors.green[500],
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
              ),
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
      Row(
        children: <Widget>[

          Expanded(
            child: FlatButton(
              onPressed:(){
                setState(() {
                  if (answer=='0') answer='4';
                  else answer=answer+'4';
                  if (calculation=='0'){calculation='4';}
                  else calculation=calculation+'4';
                  if (!check_n1){
                    number1=number1+'4';
                  }
                  else {
                    number2=number2+'4';
                  }
                });
              },
              height: 70.0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade800,width:0.8)
              ),
              child: Text('4',style:TextStyle(color:Colors.white,fontSize: 25.0,)),
              color: Colors.grey[700],
            ),
          ),

          Expanded(
            child: FlatButton(
              onPressed:(){
                setState(() {
                  if (answer=='0') answer='5';
                  else answer=answer+'5';
                  if (calculation=='0'){calculation='5';}
                  else calculation=calculation+'5';
                  if (!check_n1){
                    number1=number1+'5';
                  }
                  else {
                    number2=number2+'5';
                  }
                });
                },

              height: 70.0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade800,width:0.8)
              ),
              child: Text('5',style:TextStyle(color:Colors.white,fontSize: 25.0,)),
              color: Colors.grey[700],
            ),
          ),

          Expanded(
            child: FlatButton(
              onPressed:(){
                setState(() {
                  if (answer=='0') answer='6';
                  else answer=answer+'6';
                  if (calculation=='0'){calculation='6';}
                  else calculation=calculation+'6';
                  if (!check_n1){
                    number1=number1+'6';
                  }
                  else {
                    number2=number2+'6';
                  }
                });
              },
              height: 70.0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade800,width:0.8)
              ),
              child: Text('6',style:TextStyle(color:Colors.white,fontSize: 25.0,)),
              color: Colors.grey[700],
            ),
          ),

          Expanded(
            child: FlatButton(
              onPressed:(){
                setState(() {
                  calculation+='-';
                  evaluate();
                  answer='0';
                  change_operation_state();
                  subtract=true;
                  number2='0';
                  check_n1=true;
                });
              },
              height: 70.0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade900,width:0.8)
              ),
              child: Text(
                  '-',
                  style: TextStyle(
                    color: Colors.green[500],
                    // fontWeight: FontWeight.bold,
                    fontSize: 33.0,
                  ),
              ),
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
      Row(
        children: <Widget>[

          Expanded(
            child: FlatButton(
              onPressed:(){
                setState(() {
                  if (answer=='0') answer='1';
                  else answer=answer+'1';
                  if (calculation=='0'){calculation='1';}
                  else calculation=calculation+'1';
                  if (!check_n1){
                    number1=number1+'1';
                  }
                  else {
                    number2=number2+'1';
                  }
                });
              },
              height: 70.0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade800,width:0.8)
              ),
              child: Text('1',style:TextStyle(color:Colors.white,fontSize: 25.0,)),
              color: Colors.grey[700],
            ),
          ),

          Expanded(
            child: FlatButton(
              onPressed:(){
                setState(() {
                  if (answer=='0') answer='2';
                  else answer=answer+'2';
                  if (calculation=='0'){calculation='2';}
                  else calculation=calculation+'2';
                  if (!check_n1){
                    number1=number1+'2';
                  }
                  else {
                    number2=number2+'2';
                  }
                });
              },
              height: 70.0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade800,width:0.8)
              ),
              child: Text('2',style:TextStyle(color:Colors.white,fontSize: 25.0,)),
              color: Colors.grey[700],
            ),
          ),

          Expanded(
            child: FlatButton(
              onPressed:(){
                setState(() {
                  if (answer=='0') answer='3';
                  else answer=answer+'3';
                  if (calculation=='0'){calculation='3';}
                  else calculation=calculation+'3';
                  if (!check_n1){
                    number1=number1+'3';
                  }
                  else {
                    number2=number2+'3';
                  }
                });
              },
              height: 70.0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade800,width:0.8)
              ),
              child: Text('3',style:TextStyle(color:Colors.white,fontSize: 25.0,)),
              color: Colors.grey[700],
            ),
          ),

          Expanded(
            child: FlatButton(
              onPressed:(){
                setState(() {
                  calculation+='+';
                  evaluate();
                  answer='0';
                  change_operation_state();
                  add=true;
                  check_n1=true;
                  number2='0';
                });
              },
              height: 70.0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade900,width:0.8)
              ),
              child: Text(
                  '+',
                  style: TextStyle(
                    color: Colors.green[500],
                    fontWeight: FontWeight.bold,
                    fontSize: 27.0,
                  ),
              ),
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
      Row(
        children: <Widget>[

          Expanded(
            child: FlatButton(
              onPressed:(){
                },
              height: 70.0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade800,width:0.8)
              ),
              child: Text('.',style:TextStyle(color:Colors.white,fontSize: 25.0,)),
              color: Colors.grey[700],
            ),
          ),

          Expanded(
            child: FlatButton(
              onPressed:( ){
                setState(() {
                  if (answer=='0') answer='0';
                  else answer=answer+'0';
                  if (calculation=='0'){calculation='0';}
                  else calculation=calculation+'0';
                  if (!check_n1){
                    number1=number1+'0';
                  }
                  else {
                    number2=number2+'0';
                  }
                });
              },
              height: 70.0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade800,width:0.8)
              ),
              child: Text('0',style:TextStyle(color:Colors.white,fontSize: 25.0,)),
              color: Colors.grey[700],
            ),
          ),

          Expanded(
            child: FlatButton(
              onPressed:(){
                if (check_n1) {
                  number1=number1.substring(0,number1.length-1);
                }
                else {
                  number2=number2.substring(0,number2.length-1);
                }
                answer=answer.substring(0,answer.length-1);
              },
              height: 70.0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade800,width:0.8)
              ),
              child: Icon(
                Icons.backspace,
                color: Colors.white,
              ),
              color: Colors.grey[700],
            ),
          ),

          Expanded(
            child: FlatButton(
              onPressed:(){
                setState(() {

                  evaluate();
                  calculation='$answer';
                  change_operation_state();


                });


              },
              height: 70.0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade900,width:0.8)
              ),
              child: Text(
                  '=',
                  style:TextStyle(
                    color:Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 27.0,
                  ),
              ),
              color: Colors.lightGreen[600],
            ),
          ),
        ],
      ),

    ],
    ),
    );
  }
}
