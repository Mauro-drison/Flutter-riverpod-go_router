import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proy_productos_v1/provider_dependency.dart';
import '../../../../routes/routes.dart';
import 'package:go_router/go_router.dart';
class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
      final data_product = ref.watch(getProductData);
       //print(data_product);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Productos'),
          backgroundColor: Theme.of(context).colorScheme.primary,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  tooltip: "sirve para regresar a la pagina angterior",
                  onPressed: () {
                    context.goNamed(AppRoutes.HOME);
                  }),),],

            ),
        
        body: data_product.when(
          data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => ListTile(
                    title: Text(data[index].name),
                  )),
          error: (e, s) => const Center(
            child: Text('Ups, sucedio un error!'),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
