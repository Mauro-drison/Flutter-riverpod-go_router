import 'package:proy_productos_v1/features/product/data/model/product_model.dart';
import 'package:proy_productos_v1/features/product/domain/repository/iproduct_repository.dart';

class PutProductos {
  final IProductRepository productRepository;

  PutProductos(this.productRepository);
  Future<Map<String, dynamic>> putProductos(ProductModel product) {
    return productRepository.modificarProductos(product);
  }
}
