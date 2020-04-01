import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final options = [ 'One', 'Two' ,'Three', 'Four', 'Five', 'Six',  'One', 'Two' ,'Three', 'Four', 'Five', 'Six'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Components Temp'),
        centerTitle: true,
      ),
      body:ListView(
        children: _createItem()
      )
    );
  }
  List<Widget> _createItem(){

// ++++MÉTODO MAP EN LISTAS (CORTO)++++
return options.map( (item) {

  return Column(
    children: <Widget>[
      ListTile(
        title: Text(item +'(map)'),
        subtitle: Text('subtitle example'),
        leading: Icon(Icons.fastfood, color: Colors.indigo),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.purple),
        onTap: (){},
      ),
      Divider()
    ],
  );

}).toList();

  // ++++MÉTODO FOR-IN EN LISTAS (CLASICO)++++

  //   List<Widget> list = new List<Widget>();

  //   for (var opt in options) {

  //     final tempWidget = ListTile(
  //       title: Text(opt + '(for in)'),
  //     );

  //     list..add(tempWidget)
  //         ..add(Divider());
  //   }
  //   return list;

  }
}