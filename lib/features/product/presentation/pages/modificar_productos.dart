import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proy_productos_v1/features/product/data/datasource/iproduct_remote.dart';
import 'package:proy_productos_v1/features/product/data/model/product_model.dart';

import 'package:proy_productos_v1/provider_dependency.dart';
import 'package:proy_productos_v1/utils/utils.dart' as utils;

class ModificarProductos extends ConsumerStatefulWidget {
  final ProductModel productos;
  const ModificarProductos(this.productos, {Key? key}) : super(key: key);
  //ModificarProductos({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _StatefulBottomSheetState createState() => _StatefulBottomSheetState();
}

class _StatefulBottomSheetState extends ConsumerState<ModificarProductos> {
  late ProductModel productos;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    productos = widget.productos;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modificar los productos"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'nombre',
                    ),
                    initialValue: productos.name,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      productos.name = value;
                    }),
                TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'precio',
                    ),
                    initialValue: productos.price.toString(),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (utils.isNumeric(value!)) {
                        return null;
                      } else {
                        return 'solo número';
                      }
                    },
                    onChanged: (value) {
                      productos.price = value as double;
                    }),
                TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'cantidad',
                    ),
                    initialValue: productos.quantity.toString(),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (utils.isNumeric(value!)) {
                        return null;
                      } else {
                        return 'solo número';
                      }
                    },
                    onChanged: (value) {
                      productos.quantity = value as int;
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ref.watch(putProductData(productos));
                        ref.watch(getProductData);
                      }
                    },
                    child: const Text('guardar'),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
