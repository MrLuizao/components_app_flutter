import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name = '';
  String _mail = '';
  String _date = '';
  String _selectedOption = 'Choose one';
  List _family = ['Choose one', 'Luis', 'Faba', 'Barbi', 'Vico', 'Cess', 'Lalo'];

  TextEditingController _inputDateControl = new TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Inputs Page'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
           Divider(),
          _createDate(context),
           Divider(),
           _createDropDown(),
           Divider(),
          _createUser()
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        counter: Text('Characters: ${_name.length}'),
        // hintText: 'First name',
        labelText: 'Name',
        helperText: 'Type your name',
        suffixIcon: Icon(Icons.accessibility_new),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (value){
        setState(() {
          _name = value;
          print('Este es el valor del name: $_name');         
        });
      },
    );   
  }

  Widget _createUser() {

    return ListTile(
      title: Text('The name is... $_name'),
      subtitle: Text('The email is... $_mail'),
      trailing: Text(_selectedOption),
    );
  }

  Widget _createEmail() {

    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        // hintText: 'First name',
        labelText: 'Email',
        helperText: 'Type your email',
        suffixIcon: Icon(Icons.mail),
        icon: Icon(Icons.alternate_email)
      ),
      onChanged: (value) => setState(() {
        _mail = value;
        print('Este es el valor del mail: $_mail');         
      })
    );   
  }

  Widget _createPassword() {

    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        // hintText: 'First name',
        labelText: 'Password',
        helperText: 'Enter Password',
        suffixIcon: Icon(Icons.lock),
        icon: Icon(Icons.lock_outline)
      ),
      onChanged: (value) => setState(() {
        _mail = value;
        print('Este es el valor del mail: $_mail');         
      })
    );   
  }

List<DropdownMenuItem<String>> getOptionsDrop(){

  List<DropdownMenuItem<String>> list = new List();

  _family.forEach( (member){
    list.add(DropdownMenuItem(
      child: Text(member),
      value: member,
    ));
  });
  return list;
}
 _createDropDown() {

   return Row(
     children: <Widget>[
      Icon(Icons.select_all),
      SizedBox(width: 30.0),
      DropdownButton(
        value: _selectedOption,
        items: getOptionsDrop(),
        onChanged: (option){
          setState(() {
            _selectedOption = option;
          });
        },
      )
    ],
   );
 }

  Widget _createDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputDateControl,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        // hintText: 'First name',
        labelText: 'Birth Date',
        helperText: 'Pick a Date',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
      onTap:  (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );

  }

  _selectDate(BuildContext context) async{

    DateTime picked = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(2020), 
      lastDate: new DateTime(2022),
      locale: Locale('en')
    );
    if (picked != null){
      setState(() {
        _date = picked.toString();
        _inputDateControl.text = _date;
      });
    }
  }

}