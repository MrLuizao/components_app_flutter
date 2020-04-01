import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valueSlide = 100.0;
  bool isBlockedcheck = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Slider Page'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top:50.0),
        child: Column(
          children: <Widget>[
            _createSlide(),
            _createCheckBox(),
            _createSwitch(),
            _createImage()
          ]
        ),
      ),
    );
  }

  Widget _createSlide() {
    return Slider(
      onChanged: (isBlockedcheck) ? null : (result){
        setState(() {
          _valueSlide = result;          
        });
      },
      value: _valueSlide, 
      min: 10,
      max: 400,
      activeColor: Colors.blueGrey
    );
  }

  Widget _createCheckBox(){

    return CheckboxListTile(
      title: Text('Block Slider (checkbox method)'),
      value: isBlockedcheck, 
      onChanged: (value){
        setState(() {
          isBlockedcheck = value;          
        });
      }
    );

    // return Checkbox(
    //   value: isBlockedcheck, 
    //   onChanged: (value){
    //     setState(() {
    //       isBlockedcheck = value;          
    //     });
    //   }
    // );
  }

  Widget _createSwitch(){

     return SwitchListTile(
      title: Text('Block Slider (switch method)'),
      value: isBlockedcheck, 
      onChanged: (value){
        setState(() {
          isBlockedcheck = value;          
        });
      }
    );
  }
  
  Widget _createImage() {
    return Image(
      image: NetworkImage('https://images-na.ssl-images-amazon.com/images/I/710YI4LHJBL._AC_SL1500_.jpg'),
      width: _valueSlide,
      fit: BoxFit.contain,
    );
  }
}