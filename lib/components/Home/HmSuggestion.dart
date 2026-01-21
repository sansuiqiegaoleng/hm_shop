import 'package:flutter/material.dart';

class HmSuggestion extends StatefulWidget {
  HmSuggestion({Key? key}) : super(key: key);

  @override
  _HmSuggestionState createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: (Container(
        color: Colors.blue[200],
        alignment: Alignment.center,
        child: Text('搜索建议', style: TextStyle(color: Colors.white)),
      )),
    );
  }
}
