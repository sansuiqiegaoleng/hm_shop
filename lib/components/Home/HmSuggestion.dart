import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmSuggestion extends StatefulWidget {
  // 特惠推荐
  final RecommendationResult recommendationResult;
  HmSuggestion({Key? key, required this.recommendationResult})
    : super(key: key);

  @override
  _HmSuggestionState createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {
  List<GoodsItem> _getDiscountItems() {
    if (widget.recommendationResult.subTypes.isEmpty) {
      return [];
    }
    return widget.recommendationResult.subTypes.first.goodsItems.items
        .take(3)
        .toList();
  }

  List<Widget> _getChildrenList() {
    List<GoodsItem> list = _getDiscountItems();
    return List.generate(list.length, (int index) {
      return Container(
        width: 100,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                list[index].picture,
                width: 100,
                height: 140,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stckTrace) {
                  return Image.asset(
                    '/Volumes/mac/Project/hm_shop/lib/assets/home_cmd_inner.png',
                    width: 100,
                    height: 140,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 224, 84, 42),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                '¥${list[index].price}',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildItem(GoodsItem item) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 100,
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(item.picture),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          "特惠推荐",
          style: TextStyle(
            color: const Color.fromARGB(255, 60, 10, 7),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 10),
        Text(
          "精选省攻略",
          style: TextStyle(
            color: const Color.fromARGB(255, 136, 30, 22),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildLeft() {
    return Container(
      padding: EdgeInsets.all(10),
      width: 100,
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            '/Volumes/mac/Project/hm_shop/lib/assets/home_cmd_inner.png',
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: (Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(
              '/Volumes/mac/Project/hm_shop/lib/assets/home_cmd_sm.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 10),
            Row(
              children: [
                _buildLeft(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _getChildrenList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
