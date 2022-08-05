// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proy_productos_v1/features/product/presentation/pages/home.dart';
import 'package:proy_productos_v1/features/product/presentation/pages/homepage.dart';
import 'routes.dart';

final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: AppRoutes.HOME,
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const Home(),
      ),
      GoRoute(
        name: AppRoutes.HOMEPAGE,
        path: '/homepage',
        builder: (BuildContext context, GoRouterState state) =>
            const HomePage(),
      ),
    ],
  );
