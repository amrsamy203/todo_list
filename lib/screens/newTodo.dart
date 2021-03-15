import 'dart:html';

import 'package:flutter/material.dart';

class AddTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'New TODO',
          ),
        ),
        body: ListView(
          children: [
            /*Container(
            padding: EdgeInsets.only(left: 100.0, top: 16.0),
            child: Text('amr'),
          ),*/
            TypeSection(),
            ContentSection(),
          // ButtonSection,
          ],
        ));
  }
}

class TypeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Category', style: Theme.of(context).textTheme.headline6),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButtonColumn(Icons.card_travel, "TRAVEL"),
              _buildButtonColumn(Icons.alarm, 'ALARM'),
              _buildButtonColumn(Icons.music_note_rounded, 'MUSIC'),
              _buildButtonColumn(Icons.work_rounded, 'WORK'),
              _buildButtonColumn(Icons.home_rounded, 'HOME'),
              _buildButtonColumn(Icons.settings_rounded, 'OTHER')
            ],
          ),
        ],
      ),
    );
  }

  Column _buildButtonColumn(IconData icon, String label) {
    return Column(
      /*mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,*/
      children: [
        Icon(icon),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              //color: color
            ),
          ),
        )
      ],
    );
  }
}

class ContentSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(left: 32, right: 32),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Title',
            ),
          ),
          Padding(padding: EdgeInsets.all(32)),
          TextField(
            decoration: InputDecoration(
              hintText: 'Description',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(new Radius.circular(25.0)),
              ),
            ),
          )
        ],
      ),
    );
  }

}
