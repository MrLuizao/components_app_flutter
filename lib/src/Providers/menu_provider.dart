import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;


class _MenuProvider{

  List<dynamic> options = [];

  _MenuProvider(){
    // loadData();
  }

  Future<List<dynamic>> loadData() async {
 
    final response = await rootBundle.loadString('data/menu_opts.json');

    Map dataMap = json.decode(response);
        print(dataMap['routes']);
        options = dataMap['routes'];

      // .then( (data) {
      //   Map dataMap = json.decode(data);
      //   print(dataMap['routes']);
      //   options = dataMap['routes'];
      // });

    return options;
  }
}

final menuProvier = new _MenuProvider();