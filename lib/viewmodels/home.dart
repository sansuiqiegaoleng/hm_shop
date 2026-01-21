class BannerItem {
  String? id;
  String? imgUrl;
  BannerItem({required this.id, required this.imgUrl});
  //扩展一个工厂函数 一般用factory来声明 一般用来创建实例对象
  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(id: json['id'] ?? '', imgUrl: json['imgUrl'] ?? '');
  }
}

// // "result": [
//         {
//             "id": "1181622001",
//             "name": "气质女装",
//             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/qznz.png",
//             "children": [
//                 {
//                     "id": "1191110001",
//                     "name": "半裙",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_bq.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110002",
//                     "name": "衬衫",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_cs.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110022",
//                     "name": "T恤",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_tx.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110023",
//                     "name": "针织衫",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_zzs.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110024",
//                     "name": "夹克",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_jk.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110025",
//                     "name": "卫衣",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_wy.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110028",
//                     "name": "背心",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_bx.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 }
//             ],
//             "goods": null
//         },
//         {
//             "id": "1181622002",
//             "name": "女士内衣",
//             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/nsny.png",
//             "children": [
//                 {
//                     "id": "1191110003",
//                     "name": "文胸",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/nsny_wx.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110004",
//                     "name": "短袜",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/nsny_dw.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110005",
//                     "name": "起居服",
//                     "picture": "https://yanxuan.nosdn.127.net/f5797ca77cfe413e7753ec69f9bd4bb1.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110029",
//                     "name": "内裤",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/nsny_nk.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110030",
//                     "name": "连裤袜",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/nsny_lkw.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110033",
//                     "name": "塑身衣/塑身裤",
//                     "picture": "https://yanxuan.nosdn.127.net/f5797ca77cfe413e7753ec69f9bd4bb1.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110034",
//                     "name": "内衣套装",
//                     "picture": "https://yanxuan.nosdn.127.net/f5797ca77cfe413e7753ec69f9bd4bb1.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 }
//             ],
//根据json编写class对象和工厂转化函数
class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;
  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id']??"",
      name: json['name']??"",
      picture: json['picture']??"",
      children: json['children'] != null
          ? (json['children'] as List)
                .map((e) => CategoryItem.fromJson(e))
                .toList()
          : null,

    );
  }
}
