import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget buildButton(Color color, String text,double buttonHeight) {
    return  Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical:3,horizontal: 1),
      child: FlatButton(
        padding: EdgeInsets.fromLTRB(11, 8, 11, 8),
          height: MediaQuery.of(context).size.height*0.1*buttonHeight,
                          onPressed: () {},
                          color: color,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(54),
                              side: BorderSide(width: 1, color: Colors.black)),
                          child: Text(
                            text,
                            style: TextStyle(color: Colors.white, fontSize: 34,),
                            textAlign: TextAlign.center,
                          )),
    ) ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Simple Calculator')),
        ),
        body: Column(
          children: [
           Container(
             alignment: Alignment.centerRight,
             padding: EdgeInsets.fromLTRB(15, 13, 15, 13),
           child: Text('0',style: TextStyle(fontSize: 48),),
           ),
           Divider(),
          Container(
             alignment: Alignment.centerRight,
             padding: EdgeInsets.fromLTRB(15, 13, 15, 13),
           child: Text('0',style: TextStyle(fontSize: 48),),
           ),
           Expanded(child: 
                Divider(height: 3,color:Colors.black45,) ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Table(
                    children: [
                      TableRow(children: [
                       buildButton(Colors.red,'C',1),
                        buildButton(Colors.blue,' ⌫',1),
                         buildButton(Colors.blue,'÷',1),
                          
                      ]),
                        TableRow(children: [
                       buildButton(Colors.grey,'9',1),
                        buildButton(Colors.grey,'8',1),
                         buildButton(Colors.grey,'7',1),
                          
                      ]),
                        TableRow(children: [
                       buildButton(Colors.grey,'6',1),
                        buildButton(Colors.grey,'5',1),
                         buildButton(Colors.grey,'4',1),
                          
                      ]),
                        TableRow(children: [
                       buildButton(Colors.grey,'3',1),
                        buildButton(Colors.grey,'2',1),
                         buildButton(Colors.grey,'1',1),
                          
                      ]),
                        TableRow(children: [
                       buildButton(Colors.grey,'.',1),
                        buildButton(Colors.grey,'0',1),
                         buildButton(Colors.grey,'00',1),
                          
                      ])
                    ],
                  ),
                ),
                Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                  child:Table(
                 children: [
                   TableRow(
                     children: [
                         buildButton(Colors.blue,'x',1),
                     ]
                   ),
                     TableRow(
                     children: [
                         buildButton(Colors.blue,'-',1),
                     ]
                   ),
                    TableRow(
                     children: [
                         buildButton(Colors.blue,'+',1),
                     ]
                   ),
                    TableRow(
                     children: [
                         buildButton(Colors.redAccent,'=',2),
                     ]
                   ),
                 ],
                  )
                ),
              ],
            ),
          ],
        ));
  }
}
