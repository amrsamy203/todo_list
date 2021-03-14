
import 'package:flutter/material.dart';

class AddTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New TODO',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: ListView(
        children: [
          TypeSection,
          ContentSection,
          ButtonSection,
        ],
      )
    );
  }

  Widget TypeSection = Container(
    padding: EdgeInsets.all(32),
    child: Column(
      children: [
        Text('Type'),
        SizedBox(height: 10,),
        Row(
          children: [
            _buildButtonColumn(Icons.card_travel, "TRAVEL"),
            _buildButtonColumn(Icons.alarm, 'TRAVEL'),
            _buildButtonColumn(Icons.music_note_rounded, 'MUSIC')
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            _buildButtonColumn(Icons.work_rounded, 'WORK'),
            _buildButtonColumn(Icons.home_rounded, 'HOME'),
            _buildButtonColumn(Icons.settings_rounded, 'OTHER')
          ],
        ),
      ],
    ),
  );

  Column _buildButtonColumn(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Icon(icon, color: color),
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