import 'package:proy_productos_v1/features/product/data/model/product_model.dart';
import 'package:proy_productos_v1/features/product/domain/repository/iproduct_repository.dart';

class PostProductos {
  final IProductRepository productRepository;

  PostProductos(this.productRepository);
  Future<Map<String, dynamic>> postProductos(ProductModel product) {
    return productRepository.crearProducto(product);
  }
}
