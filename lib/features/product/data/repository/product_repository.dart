import 'package:proy_productos_v1/features/product/data/datasource/iproduct_remote.dart';
import 'package:proy_productos_v1/features/product/data/model/product_model.dart';
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

  @override
  Future<Map<String, dynamic>> crearProducto(ProductModel product) {
    return remoteDatasource.crearProducto(product);
  }

  @override
  Future<Map<String, dynamic>> modificarProductos(ProductModel product) {
    return remoteDatasource.modificarProducto(product);
  }

  @override
  Future<Map<String, dynamic>> eliminarProducto(ProductModel product) {
    return remoteDatasource.eliminarProducto(product);
  }
}
