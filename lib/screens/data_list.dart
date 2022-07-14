import 'package:flutter/material.dart';
import 'package:school_app_sample/screens/data_detail.dart';

class DataList extends StatefulWidget {
  const DataList({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => DataListState();
}

class DataListState extends State<DataList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MY HEALTHCARE DATA'),
      ),
      body: getDataListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

ListView getDataListView() {
  int count = 1;
  return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.arrow_circle_left_outlined),
            ),
            title: const Text('定期健康診断'),
            subtitle: const Text('受信日'),
            trailing: GestureDetector(
                child: const Icon(
                  Icons.auto_stories,
                  color: Colors.grey,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DataDetail()));
                }),
          ),
        );
      });
}
