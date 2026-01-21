import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmCategory extends StatefulWidget {
  // 分类列表
  final List<CategoryItem> categoryList;
  HmCategory({Key? key, required this.categoryList}) : super(key: key);

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
          itemCount: widget.categoryList.length,
          itemBuilder: (context, index) {
            final item = widget.categoryList[index];
            return Container(
              alignment: Alignment.center,
              width: 80,
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 237, 240, 243),
                borderRadius: BorderRadius.circular(40),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(item.picture, width: 30, height: 30),
                  Text(item.name, style: TextStyle(color: Colors.black)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
