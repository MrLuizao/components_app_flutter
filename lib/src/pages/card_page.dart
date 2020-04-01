import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Cards Page'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTypeOne(),
          SizedBox(height: 25),
          _cardTypeTwo(),
          SizedBox(height: 25),
          _cardTypeOne(),
          SizedBox(height: 25),
          _cardTypeTwo(),
          SizedBox(height: 25),
          _cardTypeOne(),
          SizedBox(height: 25),
          _cardTypeTwo(),
           SizedBox(height: 25),
          _cardTypeOne(),
          SizedBox(height: 25),
        ]
      ),
    );
  }

  Widget _cardTypeOne() {    
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.green),
            title: Text('Example Title Card in Flutter by LVR'),
            subtitle: Text('subtitle or description to show in card'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: () {},
              )
            ]
          )
        ],
      ),
    );
  }

  Widget _cardTypeTwo() {

    final card = Container(
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://pngriver.com/wp-content/uploads/2018/03/Download-Manchester-United-Logo-PNG-Transparent-Picture-337.png'),
            placeholder: AssetImage('assets/glow.gif'),
            fadeInDuration: Duration( milliseconds: 200),
            height: 250.0,
            fit: BoxFit.contain,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Glory, Glory, Man United!')
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color:Colors.black26,
            blurRadius: 5.0,
            spreadRadius: -1.5,
            offset: Offset( 1.0,1.0)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card
      )
    );
  }
}