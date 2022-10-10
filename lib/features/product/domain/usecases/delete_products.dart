import 'package:proy_productos_v1/features/product/data/model/product_model.dart';
import 'package:proy_productos_v1/features/product/domain/repository/iproduct_repository.dart';

class DeleteProductos {
  final IProductRepository productRepository;

  DeleteProductos(this.productRepository);
  Future<Map<String, dynamic>> deleteProductos(ProductModel product) {
    return productRepository.eliminarProducto(product);
  }
}
