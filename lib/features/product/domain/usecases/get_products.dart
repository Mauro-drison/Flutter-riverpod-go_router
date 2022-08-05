

import 'package:proy_productos_v1/features/product/domain/entities/product.dart';
import 'package:proy_productos_v1/features/product/domain/repository/iproduct_repository.dart';

class GetProducts {
  final IProductRepository productRepository;

  GetProducts(this.productRepository);

  Future<List<Product>> getProducts() {
    return productRepository.getProduct();
  }
}
