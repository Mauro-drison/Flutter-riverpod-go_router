import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proy_productos_v1/provider_dependency.dart';
import '../../../../routes/routes.dart';
import 'package:go_router/go_router.dart';

import 'agregar_productos.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data_product = ref.watch(getProductData);
    //print(data_product);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Productos'),
        ),
        body: data_product.when(
          data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => ListTile(
                    title: Text(data[index].name),
                    trailing: IconButton(
                      tooltip: "editar",
                      color: Colors.green,
                      icon: const Icon(Icons.edit),
                      onPressed: () async {
                        context.push(AppRoutes.MODIFICARPRODUCTOS,
                            extra: data[index]);
                        print(data[index]);
                      },
                    ),
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
