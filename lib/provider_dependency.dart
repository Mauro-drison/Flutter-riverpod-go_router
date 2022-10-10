import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proy_productos_v1/features/product/data/datasource/iproduct_remote.dart';
import 'package:proy_productos_v1/features/product/data/datasource/product_remote.dart';
import 'package:proy_productos_v1/features/product/data/model/product_model.dart';
import 'package:proy_productos_v1/features/product/data/repository/product_repository.dart';
import 'package:proy_productos_v1/features/product/domain/entities/product.dart';
import 'package:proy_productos_v1/features/product/domain/repository/iproduct_repository.dart';
import 'package:proy_productos_v1/features/product/domain/usecases/delete_products.dart';
import 'package:proy_productos_v1/features/product/domain/usecases/post_products.dart';
import 'package:proy_productos_v1/features/product/domain/usecases/put_products.dart';
//Data

final productDataSource = Provider<IProductRemoteDatasource>(
  (ref) => ProductRemoteDatasource(),
);
//Repository
final productRepositoryProvider = Provider<IProductRepository>(
    (ref) => ProductRepository(ref.read(productDataSource)));
//Presentation
final getProductData = FutureProvider.autoDispose<List<Product>>((ref) async {
  return ref.watch(productRepositoryProvider).getProduct();
});
//final modificarProducto = FutureProvider<List<Product>>((ref) async {
//  return ref.read(productRepositoryProvider).postProduct(producto);
//});

// final productDataSourcepost = Provider<IProductRemoteDatasource>(
//   (ref) => ProductRemoteDatasource(),
// );
// //Repository
// final productRepositoryProviderpost = Provider<IProductRepository>(
//     (ref) => ProductRepository(ref.read(productDataSourcepost)));
// final crearProducto = Future<Map<String, dynamic>,ProductModel>((ref, product) async {

//   return ref.watch(productRepositoryProviderpost).crearProducto(product);
// });

/* POST */

//Data
final productDataSourcePost = Provider.autoDispose<IProductRemoteDatasource>(
  (ref) => ProductRemoteDatasource(),
);
//Repository
final productRepositoryProviderPost = Provider.autoDispose<IProductRepository>(
    (ref) => ProductRepository(ref.watch(productDataSourcePost)));
//Domain
final productUseCasePost = Provider.autoDispose<PostProductos>(
    (ref) => PostProductos(ref.watch(productRepositoryProviderPost)));
//Presentation
final postProductData = FutureProvider.family
    .autoDispose<Map<String, dynamic>, ProductModel>((ref, product) async {
  return ref.watch(productUseCasePost).postProductos(product);
});

//PUT
//Domain
final productUseCaseput = Provider.autoDispose<PutProductos>(
    (ref) => PutProductos(ref.watch(productRepositoryProviderPost)));
//Presentation
final putProductData = FutureProvider.family
    .autoDispose<Map<String, dynamic>, ProductModel>((ref, product) async {
  return ref.watch(productUseCaseput).putProductos(product);
});

//DELETE
//Domain
final productUseCasedelete = Provider.autoDispose<DeleteProductos>(
    (ref) => DeleteProductos(ref.watch(productRepositoryProviderPost)));
//Presentation
final deleteProductData = FutureProvider.autoDispose
    .family<Map<String, dynamic>, ProductModel>((ref, product) async {
  return ref.watch(productUseCasedelete).deleteProductos(product);
});
