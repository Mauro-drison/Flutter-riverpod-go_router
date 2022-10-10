// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proy_productos_v1/features/product/data/model/product_model.dart';
import 'package:proy_productos_v1/features/product/presentation/pages/agregar_productos.dart';
import 'package:proy_productos_v1/features/product/presentation/pages/eliminar_productos.dart';
import 'package:proy_productos_v1/features/product/presentation/pages/home.dart';
import 'package:proy_productos_v1/features/product/presentation/pages/homepage.dart';
import 'package:proy_productos_v1/features/product/presentation/pages/modificar_productos.dart';

import 'routes.dart';

final GoRouter router = GoRouter(
  //initialLocation: "/homepage",
  routes: <GoRoute>[
    GoRoute(
      name: AppRoutes.HOME,
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const Home(),
    ),
    GoRoute(
      name: AppRoutes.HOMEPAGE,
      path: '/homepage',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    ),
    GoRoute(
      name: AppRoutes.AGREGARPRODUCTO,
      path: '/agregar_productos',
      builder: (BuildContext context, GoRouterState state) =>
          AgregarProductos(),
    ),
    GoRoute(
      name: AppRoutes.MODIFICARPRODUCTOS,
      path: '/modificar_productos',
      builder: (BuildContext context, GoRouterState state) {
        Object? product = state.extra;
        if (product != null && product is ProductModel) {
          return ModificarProductos(product);
        } else {
          return ModificarProductos(
              ProductModel(id: 0, name: 'no name', price: 0.1, quantity: 1));
        }
      },
    ),
    GoRoute(
      name: AppRoutes.ELIMINARPRODUCTOS,
      path: '/eliminar_productos',
      builder: (BuildContext context, GoRouterState state) =>
          PageEliminarProductos(),
    ),
  ],
);
