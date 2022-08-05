import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proy_productos_v1/features/product/data/datasource/product_remote.dart';
import 'package:proy_productos_v1/features/product/data/repository/product_repository.dart';
import 'package:proy_productos_v1/features/product/domain/entities/product.dart';
import 'package:proy_productos_v1/features/product/domain/repository/iproduct_repository.dart';
//Data

final productDataSource = Provider<ProductRemoteDatasource>(
  (ref) => ProductRemoteDatasource(),
);
//Repository
final productRepositoryProvider = Provider<IProductRepository>(
    (ref) => ProductRepository(ref.read(productDataSource)));
//Presentation
final getProductData = FutureProvider<List<Product>>((ref) async {
  return ref.read(productRepositoryProvider).getProduct();
});
