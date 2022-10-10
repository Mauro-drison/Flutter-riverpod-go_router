import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proy_productos_v1/provider_dependency.dart';

// ignore: must_be_immutable
class PageEliminarProductos extends ConsumerWidget {
  PageEliminarProductos({Key? key}) : super(key: key);
  bool value = false;
  // ignore: non_constant_identifier_names
  List lista_productos = [];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data_product = ref.watch(getProductData);
    //print(data_product);
    return Scaffold(
        appBar:
            AppBar(title: const Text('Lista de Productos'), actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: IconButton(
                icon: const Icon(Icons.shopping_bag),
                tooltip: "AGREGAR PRODUCTOS",
                onPressed: () {
                  eliminar(lista_productos, ref);
                  ref.watch(getProductData);
                }),
          ),
        ]),
        body: data_product.when(
          data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => ListTile(
                    title: Text(data[index].name),
                    trailing: Checkbox(
                      value: this.value,
                      onChanged: (value) {
                        this.lista_productos.add(data[index]);
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

  void eliminar(lista, WidgetRef ref) {
    for (var x in lista) {
      // ignore: avoid_print
      print(x.name);
      ref.watch(deleteProductData(x));
    }
  }
}
