import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_app_sample/models/data_school.dart';

class DataDetail extends StatefulWidget{
  final String appBarTitle;
  final School school;

   DataDetail(this.school,this.appBarTitle);

  @override
  State<StatefulWidget> createState()  => DataDetailState(this.school, this.appBarTitle);
}

class DataDetailState extends State<DataDetail>{

  //static final _priorities = ['定期健康診断','病院・診療所'];

  String appBarTitle;
  School school;
  DataDetailState(this.school, this.appBarTitle);

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context){
    TextStyle? textStyle = Theme.of(context).textTheme.subtitle1;
    heightController.text = (school.height).toString();
    weightController.text = (school.weight).toString();


  return Scaffold(
    appBar: AppBar(
      title: Text(appBarTitle),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: (){},
      ),
    ),
    //-----------------
    body: Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
     child: Column(
       children: [
         TextField(
           controller: heightController,
           style: textStyle,
           textAlign: TextAlign.right,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (value){
             updateHeight();
              },
           decoration: InputDecoration(
             labelText: '身長',
             labelStyle: textStyle,
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(5.0)
             ),
           ),
         ),

         TextField(
           controller: weightController,
           style: textStyle,
           textAlign: TextAlign.right,
           keyboardType: TextInputType.number,
           inputFormatters: [FilteringTextInputFormatter.digitsOnly],
           onChanged: (value){
             updateWeight();
           },
           decoration: InputDecoration(
             labelText: '体重',
             labelStyle: textStyle,
             border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(5.0)
             ),
           ),
         ),
       ],
     ),
      /* child: ListView(
        children: <Widget>[
          //プルダウンで健診の種類を選ぶ場所
          ListTile(
            title: DropdownButton(
              items: _priorities.map((String dropDownStringItem){
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              style: textStyle,

              value: getPriorityAsString(dataSchool.priority),

              onChanged: (valueSelectedByUser){
                setState((){
                  updatePriorityAsInt(valueSelectedByUser);
                });
              },

            )
          )
        ],
      ),*/
    ),
  );
  }
  void updateHeight(){
    school.height = int.parse(heightController.text);
  }
  void updateWeight(){
    school.weight = int.parse(weightController.text);
  }
 /*void updatePriorityAsInt(String value) {
    switch (value){
      case '定期健康診断':
        dataSchool.priority = 1;
        break;
      case '診察・診療':
        dataSchool.priority = 2;
        break;
    }

    String getPriorityAsString(int value) {
      String priority;
      switch(value){
        case 1:
          priority = _priorities[0];
          break;
        case 2:
          priority = _priorities[1];
          break;
      }
      return priority;
    }
  }*/
}