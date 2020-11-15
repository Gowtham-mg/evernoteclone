import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/app_bar_title_with_back_button.dart';
import 'package:flutter/material.dart';

class Sync extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return ScaffoldWithBackButton(
      title: MetaText.syncNotes,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _width*0.04),
        child: Column(
          children: [
            CheckboxListTile(
              title: Text(MetaText.notes),
              subtitle: Text(MetaText.notesSyncDescription),
              value: null,
              onChanged: (bool val){

              },
            ),
            MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: ()async{
                await showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return ChooseFrequency();
                  }
                );
              },
              child: Row(
                children: [
                  Text(MetaText.chooseSyncFrequency),
                  Transform(
                    transform: Matrix4.rotationX(40),
                    child: Icon(Icons.arrow_right),
                  )
                ],
              ),
            ),
            CheckboxListTile(
              title: Text(MetaText.wirelessNetworkSyncOnly),
              subtitle: Text(MetaText.wirelessNetworkSyncOnlyDescription),
              value: null,
              onChanged: (bool val){
                
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(MetaText.syncStatus),
                Text('${MetaText.lastSync}')
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ChooseFrequency extends StatefulWidget {
  @override
  _ChooseFrequencyState createState() => _ChooseFrequencyState();
}

class _ChooseFrequencyState extends State<ChooseFrequency> {
  String chooseFrequency = 'Every 15 mins';
  final List<String> frequencies = ['Every 15 mins', 'Every 30 mins', 'Every 60 mins', 'Every 1 day'];
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: _width*0.07),
      padding: EdgeInsets.symmetric(horizontal: _width*0.05, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(MetaText.chooseSyncFrequency),
          ...frequencies.map((frequency)=>
            Row(
              children: [
                Radio(
                  value: chooseFrequency == frequency, 
                  groupValue: chooseFrequency == frequency,
                  onChanged: (bool val){
                    setState(() {
                      chooseFrequency = frequency;
                    });
                  },
                ),
              ],
            )
          ).toList(),
          Row(
            children: [
              TextButton(child: Text(MetaText.cancel), onPressed: (){}),
              TextButton(child: Text(MetaText.ok), onPressed: (){})
            ]
          )
        ],
      ),
    );
  }
}