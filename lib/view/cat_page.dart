import 'package:flutter/material.dart';
import 'package:reast/model/cat_model.dart';
import 'package:reast/services/cat_service.dart';
import 'package:dio/dio.dart';

class CatPageWithModel extends StatefulWidget {
  const CatPageWithModel({super.key});

  @override
  State<CatPageWithModel> createState() => _CatPageWithModelState();
}

class _CatPageWithModelState extends State<CatPageWithModel> {
  @override
  TextEditingController nameFromTextField = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getDataOfCat(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      snapshot.data![index].image,
                    ),
                    title: Text(snapshot.data![index].name),
                  ),
                );
              });
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
      bottomNavigationBar: TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        controller: nameFromTextField,
      ),
      floatingActionButton: InkWell(
          onTap: () {
            // ! 1
            // ? createNewCat('kitty', 'syria', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4Inf60l0egQ8i49C_lylZJl90NVuPLWmG7Q&s');

            // ! 2 Just name is required, and with textField
            createNewCat(
                name: nameFromTextField.text,
                origin: 'china',
                image:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4Inf60l0egQ8i49C_lylZJl90NVuPLWmG7Q&s');

            setState(() {});
          },
          child: const FlutterLogo()),
    );
  }
}

// ! 1 POST Method all parameters are required
// createNewCat(String name, String origin, String image) async {
//   Dio request = Dio();
//   CatModel cat = CatModel(name: name, origin: origin, image: image);

//   await request.post(
//       'https://66f5970d436827ced9747ae1.mockapi.io/cat',
//       data: cat.fromObjectToMap());
// }

// ! 2 POST Method Just name is required, and with textField

createNewCat(
    {required String name,
    String origin = 'Syria',
    String image =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4Inf60l0egQ8i49C_lylZJl90NVuPLWmG7Q&s'}) async {
  Dio request = Dio();
  CatModel cat = CatModel(name: name, origin: origin, image: image);

  await request.post('https://66f5970d436827ced9747ae1.mockapi.io/cat',
      data: cat.fromObjectToMap());
}
