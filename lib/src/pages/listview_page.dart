import 'package:flutter/material.dart';
import 'dart:async';


class ListViewPage extends StatefulWidget {
  ListViewPage({Key key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

ScrollController _scrollController = new ScrollController();

// List<int> _listNumbers = [1,2,3,4,5,6,7];
List<int> _listNumbers = new List();
int _lastElement = 0; 
bool _isLoading = true;

@override
  void initState() {
    super.initState();
    this._addTenMore();

    this._scrollController.addListener( () {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        // _addTenMore();
        this.fetchData();
      }
    });
  }

@override
  void dispose() {
    // Se eliminan los listeners al salir de la página
    super.dispose();
    this._scrollController.dispose();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('ListView Page'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          _createLits(),
          _createGenericLoading()
        ],
      )
      
    );
  }

  Widget _createLits(){
    return RefreshIndicator(

      onRefresh: refreshPage,
        child: ListView.builder(
        controller: _scrollController,
        itemCount: _listNumbers.length,
        itemBuilder: (BuildContext context, int index){

          final image = _listNumbers[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$image'),
            placeholder: AssetImage('assets/glow.gif'),
            height: 250.0,
            fit: BoxFit.contain
          );
        },
      ),
    );
  }

  Future refreshPage() async{

    final duration = new Duration( seconds:2 );
    new Timer(duration, (){
      _listNumbers.clear();
      _lastElement++;
      _addTenMore();
    });

    return Future.delayed(duration);
  }

  _addTenMore(){
    for (var i = 1; i < 10; i++) {
      _lastElement++;
      _listNumbers.add(_lastElement);
    }
    setState(() {});
  }

  Future fetchData()async{

    _isLoading = true;
    setState(() {});

    final delay = new Duration(seconds: 2);

    new Timer(
      delay, 
      requestHttp
    );

  }
  void requestHttp(){
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels +100,
      curve: Curves.fastOutSlowIn,
      duration: Duration( milliseconds: 200)
    );
    
    _addTenMore();
  }

  Widget _createGenericLoading() {

    if(_isLoading){

      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0)
        ],
      );
      
    }
    else{
      return Container();
    }

  }
}