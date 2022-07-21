import 'dart:async';

import 'package:flutter/material.dart';
import 'package:school_app_sample/models/data_school.dart';
import 'package:school_app_sample/screens/data_detail.dart';
import 'package:school_app_sample/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';


class DataList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return DataListState();
  }
}

class DataListState extends State<DataList> {

  DatabaseHelper databaseHelper = DatabaseHelper();
   late List<School> dataList;
  int count = 0;

  @override
  Widget build(BuildContext context) {

    if (dataList == null) {
      dataList = <School>[];
      updateListView();
    }

    return Scaffold(

      appBar: AppBar(
        title: Text('MY HEALTHCARE DATA'),
      ),

      body: getNoteListView(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          navigateToDetail(School(1,''), '新規登録');
        },

        tooltip: '新規登録',

        child: Icon(Icons.add),

      ),
    );
  }

  ListView getNoteListView() {

    TextStyle? titleStyle = Theme.of(context).textTheme.subtitle1;
    String type;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 5.0,
          child: ListTile(

            leading: CircleAvatar(
              backgroundColor: getPriorityColor(dataList[position].priority),
              child: getPriorityIcon(dataList[position].priority),
            ),

            title: Text('受診日 : ' + this.dataList[position].on_the_day),

            subtitle: Text('更新日' + this.dataList[position].date),

            trailing: GestureDetector(
              child: Icon(Icons.auto_stories, color: Colors.grey,),
              onTap: () {
                //_delete(context, noteList[position]);
                debugPrint("ListTile Tapped");
                navigateToDetail(this.dataList[position],'参照・訂正');
              },
            ),




            /* onTap: () {
              debugPrint("ListTile Tapped");
              navigateToDetail(this.noteList[position],'参照・訂正');
            },*/

          ),
        );
      },
    );
  }

  // Returns the priority color
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
      //type = "定期";
        return Colors.red;
        break;
      case 2:
      //type = "その他";
        return Colors.yellow;
        break;

      default:
        return Colors.yellow;
    }
  }

  // Returns the priority icon
  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.play_arrow);
        break;
      case 2:
        return Icon(Icons.keyboard_arrow_right);
        break;

      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }

  void _delete(BuildContext context, School school) async {

    int result = await databaseHelper.deleteNote(school.id);
    if (result != 0) {
      _showSnackBar(context, '削除完了');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {

    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(School school, String height) async {
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DataDetail(school, height);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {

    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {

      Future<List<School>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.dataList = dataList;
          this.count = noteList.length;
        });
      });
    });
  }
}
