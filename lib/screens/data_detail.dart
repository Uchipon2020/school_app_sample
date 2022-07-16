import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_app_sample/models/data_school.dart';
import 'package:school_app_sample/screens/data_list.dart';

class DataDetail extends StatefulWidget {
  final String appBarTitle;
  final School school;

  DataDetail(this.school, this.appBarTitle);

  @override
  State<StatefulWidget> createState() =>
      DataDetailState(this.school, this.appBarTitle);
}

class DataDetailState extends State<DataDetail> {
  //static final _priorities = ['定期健康診断','病院・診療所'];

  String appBarTitle;
  School school;
  DataDetailState(this.school, this.appBarTitle);

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.subtitle1;
    heightController.text = (school.height).toString();
    weightController.text = (school.weight).toString();

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => DataList(),
                ),
              );
            }),
      ),
      //-----------------
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: heightController,
                style: textStyle,
                textAlign: TextAlign.right,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  updateHeight();
                },
                decoration: InputDecoration(
                  labelText: '身長',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: weightController,
                style: textStyle,
                textAlign: TextAlign.right,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  updateWeight();
                },
                decoration: InputDecoration(
                  labelText: '体重',
                  labelStyle: textStyle,
                  suffix: const Text(' cm'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateHeight() {
    school.height = int.parse(heightController.text);
  }

  void updateWeight() {
    school.weight = int.parse(weightController.text);
  }
}
