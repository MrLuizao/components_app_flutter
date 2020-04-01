import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Avatar Page'),
        centerTitle: true,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://i.dailymail.co.uk/i/pix/2017/01/13/16/3C1AC26D00000578-4117830-image-m-10_1484325979464.jpg'),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('LV'),
              backgroundColor: Colors.teal,
            ),
          )
        ],
      ),
      body: Center(
        
        child: FadeInImage(
          image: NetworkImage('https://img.favpng.com/2/11/7/paul-pogba-cartoon-juventus-f-c-png-favpng-mmz78ip3Y3UUnL7vuFk2mh2u5.jpg'),
          placeholder: AssetImage('assets/glow.gif'),
          fit: BoxFit.contain,
          fadeInDuration: Duration(milliseconds: 200)
        ),
      ),
    );
  }
}