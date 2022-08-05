import 'package:dio/dio.dart';
import 'package:proy_productos_v1/features/product/data/datasource/iproduct_remote.dart';
import 'package:proy_productos_v1/features/product/data/model/product_model.dart';

class ProductRemoteDatasource implements IProductRemoteDatasource {

  final String _url = 'http://localhost:5000/product';
  //final String _url = 'https://www.mockachino.com/676b7631-1fb0-4f/product';
  @override
  Future<List<ProductModel>> requestProducts() async {
    Response response = await Dio().get(_url);
    print("este ese lll $response");
    if (response.statusCode == 200) {
      final List result = response.data['products'];
      print(result);
      return result.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception(response);
    }
  }
  @override
  Future<Map<String, dynamic>> crearProducto(ProductModel producto) async {
    try {
      final resp =  await Dio().post(_url, data: producto.toJson());

      return {'ok': true};
    } on DioError catch (e) {
      //return {'ok': false, 'mensaje': e.response.data['error']};
      return {'ok': false, 'mensaje': e.response};
    }
  }
  @override
  Future<Map<String, dynamic>> modificarProducto(ProductModel producto) async {

    try {
      final resp =  await Dio().put(_url, data: producto.toJson());

      return {'ok': true};
    } on DioError catch (e) {
      return {'ok': false, 'mensaje': e.response};
    }
  }
 
}
