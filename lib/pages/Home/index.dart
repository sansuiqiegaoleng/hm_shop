import 'package:flutter/material.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/viewmodels/home.dart';
import 'package:hm_shop/api/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // 分类列表
  List<CategoryItem> _categoryList = [];

  List<BannerItem> _bannerList = [];

  List<Widget> _getScollerChildreb() {
    return [
      // 轮播图
      SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 分类
      SliverToBoxAdapter(child: HmCategory(categoryList: _categoryList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 热门
      SliverToBoxAdapter(
        child: HmSuggestion(recommendationResult: _recommendationResult),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 更多列表
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: HmHot(result: _inVogueResult, type: "hot"),
              ),
              SizedBox(width: 10),
              Expanded(
                child: HmHot(result: _oneStopResult, type: "step"),
              ),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 更多列表
      HmMoreList(recommendList: _recommendList), // 无限滚动列表
    ];
  }

  // 特惠推荐
  RecommendationResult _recommendationResult = RecommendationResult(
    id: "",
    title: "",
    subTypes: [],
  );
  // 热榜推荐
  RecommendationResult _inVogueResult = RecommendationResult(
    id: "",
    title: "",
    subTypes: [],
  );
  // 一站式推荐
  RecommendationResult _oneStopResult = RecommendationResult(
    id: "",
    title: "",
    subTypes: [],
  );

  @override
  void initState() {
    super.initState();
    _getBannerList();
    _getCategoryList();
    _getRecommendationList();
    _getInVogueList();
    _getOneStopList();
    _getRecommendList();
    _registerEvent();
  }

  // 获取热榜推荐列表
  void _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
    setState(() {});
  }

  // 获取一站式推荐列表
  void _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
    setState(() {});
  }

  // 推荐列表
  List<GoodDetailItem> _recommendList = [];

  int _page = 1;
  bool _isloading = false;
  bool _hasMore = true;

  // 获取推荐列表
  void _getRecommendList() async {
    if (_isloading || !_hasMore) {
      return;
    }
    ;
    _isloading = true;
    int requestLimit = _page * 8;
    _recommendList = await getRecommendListAPI({"limit": requestLimit});
    setState(() {});
    _isloading = false;

    if (_recommendList.length < 8) {
      _hasMore = false;
      return;
    }
    _page++;
  }

  // 注册事件
  void _registerEvent() {
    _Controller.addListener(() {
      if (_Controller.position.pixels >=
          (_Controller.position.maxScrollExtent - 50)) {
        // 加载更多
        _getRecommendList();
      }
    });
  }

  // 获取分类列表
  void _getCategoryList() async {
    _categoryList = await getCategoryListAPI();
    setState(() {});
  }

  // 获取轮播图表
  void _getBannerList() async {
    _bannerList = await getBannerListAPI();
    setState(() {});
  }

  // 获取特惠推荐列表
  void _getRecommendationList() async {
    _recommendationResult = await getRecommendationListAPI();
    setState(() {});
  }

  final ScrollController _Controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('首页')),
      body: CustomScrollView(
        slivers: _getScollerChildreb(),
        controller: _Controller,
      ),
    );
  }
}
