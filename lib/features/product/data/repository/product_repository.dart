
import 'package:proy_productos_v1/features/product/data/datasource/iproduct_remote.dart';
import 'package:proy_productos_v1/features/product/domain/entities/product.dart';
import 'package:proy_productos_v1/features/product/domain/repository/iproduct_repository.dart';

class ProductRepository implements IProductRepository {
  final IProductRemoteDatasource remoteDatasource;

  ProductRepository(this.remoteDatasource);
  
  @override
  Future<List<Product>> getProduct() {
     final productList = remoteDatasource.requestProducts();
    return productList;
  } 
}