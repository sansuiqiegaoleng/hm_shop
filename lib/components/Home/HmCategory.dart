import 'package:flutter/material.dart';

class HmCategory extends StatefulWidget {
  HmCategory({Key? key}) : super(key: key);

  @override
  _HmCategeoryState createState() => _HmCategeoryState();
}

class _HmCategeoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              width: 80,
              height: 50,
              color: Colors.blue,
              child: Text('分类$index', style: TextStyle(color: Colors.white)),
              margin: EdgeInsets.symmetric(horizontal: 10),
            );
          },
        ),
      ),
    );
  }
}
