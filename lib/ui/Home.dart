import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return new HomeState();
  }}

  class HomeState extends State<Home>{
  double result=0.0;
  String _resultReading ="";
  String _finalResult ="";
  final TextEditingController _ageController= new TextEditingController();
  final TextEditingController _heightController= new TextEditingController();
  final TextEditingController _weightController= new TextEditingController();
  void _calculateBmi(){
    setState(() {
      int age = int.parse(_ageController.text);                                              //.text wali chiz puchni h??
      double height = double.parse(_heightController.text);
      double weight = double.parse(_weightController.text);

      if((_ageController.text.isNotEmpty || age>0 ) && ((_weightController.text.isNotEmpty || weight >0 )&&(_heightController.text.isNotEmpty || height>0))){
        result = (weight*10000)/(height *height);
        //our result
            if(double.parse(result.toStringAsFixed(1))< 18.5 ){
              _resultReading= " You are under Weight";
              print(_resultReading);
            } else if(double.parse(result.toStringAsFixed(1))>=18.5 && double.parse(result.toStringAsFixed(1))<24.9){
            _resultReading = " You are Normal";
            print(_resultReading);
            }else if(double.parse(result.toStringAsFixed(1))>=24.9 && double.parse(result.toStringAsFixed(1))<29.9){
            _resultReading= " You are OverWeight";
            print(_resultReading);
            }else{
            _resultReading= "Obesity";
            print(_resultReading);
            }
            } else{
                  result=0.0;}
       });

    _finalResult= "Your BMI : ${result.toStringAsFixed(1)}";
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("B M I"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),

      backgroundColor: Colors.purpleAccent,

      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(1.0),
          children: <Widget>[
            new Image.asset('images/bmi.png',
            height: 140,width: 280,),

            new Container(
                margin: const EdgeInsets.all(3.0),
                height: 260,width: 380,
                color: Colors.white,
                alignment: Alignment.center,
                child:new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        labelText: 'Enter your age',
                        hintText:'e.g 24',
                        icon: new Icon(Icons.person)),
                    ),
                    new TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: 'Height in cm',
                          hintText:'e.g 180+',
                          icon: new Icon(Icons.insert_chart)),
                    ),
                    new TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: 'Weight in Kg',
                          hintText:'e.g 68',
                          icon: new Icon(Icons.line_weight)),
                    ),
                    new Padding(padding: new EdgeInsets.all(2.0)),
                    new Container(
                        alignment: Alignment.center,
                        child: new RaisedButton(
                                      onPressed: _calculateBmi,        // ()=> use for debug print
                                      color: Colors.purple,
                                      child: new Text("Calculate",
                                      style: new TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600
                                      ),),
                    )
                    )
                  ],)
              ),
            //container closed

            new Column(
              children: <Widget>[

                new Text("$_finalResult",
                style: new TextStyle(color: Colors.black,
                  fontWeight: FontWeight.w900,fontSize: 40,fontStyle: FontStyle.italic
                )
                  ,),
                new Padding(padding: const EdgeInsets.all(3.0)),
                new Text("$_resultReading",
                  style: new TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w900,fontSize: 30,fontStyle: FontStyle.italic
                  )
                  ,),

                new Padding(padding: const EdgeInsets.all(32.0)),
                new Text("Made by Ankush",
                  style: new TextStyle(color: Colors.black,
                      fontWeight: FontWeight.w900,fontSize: 18,
                  )
                  ,)
              ],),   //column of comments ended

          ],
        ),
      ),
    );
  }}
