import 'package:dio/dio.dart';
import 'package:e_commerce_clothes/models/clothesmodel.dart';

class ClothesServices {
  final Dio dio;
  ClothesServices(this.dio);
  Future<List<Clothesmodel>> getClothes() async {
    try {
      Response response = await dio.get(
        "https://api.escuelajs.co/api/v1/products",
      );
      List data = response.data;

      List<Clothesmodel> clothesList = data
          .map((item) => Clothesmodel.fromjson(item))
          .toList();
      return clothesList;
    } on DioException catch (e) {
      final String errormassage =
          e.response?.data['error']['message'] ??
          "opps there was an error,try later";
      throw Exception(errormassage);
    } catch (e) {
      throw Exception("opps There was an error,try later");
    }
  }
}
