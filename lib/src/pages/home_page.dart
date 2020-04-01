import 'package:flutter/material.dart';
import 'package:components_flutt/src/utils/icon_string.util.dart';
import 'package:components_flutt/src/Providers/menu_provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('ComponentsApp LVR'),
        centerTitle: true,
      ),
      body: _list(),
    );
  }

  Widget _list() {

    return FutureBuilder(
      future: menuProvier.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
        
        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );

    // print(menuProvier.options);
    // menuProvier.loadData().then( (options) {
    //   print(_list);
    //   print(options);
    // });

    // return ListView(
    //   children: _listItems(),
    // );
  }

  List<Widget> _listItems( List<dynamic> data, BuildContext context) {

    final List<Widget> listed = [];

    data.forEach( (opt){

      final widgeTemp = ListTile(
        title: Text(opt ['texto']),
        leading: getIcon(opt ['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.purple),
        onTap: () {

          Navigator.pushNamed(context, opt['ruta']);
          
          //++NAVEGACION SENCILLA (PUSH)
          // final route = MaterialPageRoute(
          //   builder:  (context ) => AlertPage()
          // );

          // Navigator.push(context, route);
        },
      );

      listed..add(widgeTemp)
            ..add(Divider());
    });
    
    return listed;
  }

}