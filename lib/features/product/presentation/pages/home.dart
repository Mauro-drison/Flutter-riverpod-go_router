import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../../routes/routes.dart';
import '../../../../routes/pages.dart';
import 'package:go_router/go_router.dart';
class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);
 @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    var medida = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestión de Productos"),
      ),
      drawer: Drawer(),
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                width: medida.size.width * 0.40,
                child: ElevatedButton(
                  child: Text(
                    "Formulario",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  //onPressed: () => context.go('/homepage'),
                  onPressed: () {
                    context.goNamed(AppRoutes.HOMEPAGE);
                   
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: medida.size.width * 0.40,
                child: ElevatedButton(
                  child: Text(
                    "Lista de Items",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    //Get.offAllNamed(AppRoutes.LISTA_TRABAJO);
                  },
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
