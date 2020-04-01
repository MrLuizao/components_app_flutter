import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Alert Page'),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          child:Text('Show Aletrt'),
          textColor: Colors.purple,
          color: Colors.yellow,
          shape: StadiumBorder(),
          onPressed: () => _showAlert(context),
        )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: Icon(Icons.history),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showAlert(BuildContext context){

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
          ),
          title: Text('Title Example'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('This is content of text-box in alert'),
              SizedBox(height: 35),
              FlutterLogo(size: 100)
            ]
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: Text('Cancel')
            ),
            FlatButton(
              onPressed: (){
                Navigator.of(context).pop();            
              },
              child: Text('OK')
            )
          ],
        );
      }
    );
  }
}