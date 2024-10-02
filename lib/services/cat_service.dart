import 'package:dio/dio.dart';
import 'package:reast/model/cat_model.dart';

Future<List<CatModel>> getDataOfCat() async {
  Dio req = Dio();
  Response res =
      await req.get('https://66f5970d436827ced9747ae1.mockapi.io/cat');
  List<CatModel> cats = [];
  for (var i = 0; i < res.data.lingth; i++) {
    CatModel cat = CatModel.fromMapToObject(
      res.data[i],
    );
    cats.add(cat);
  }
  return cats;
}
