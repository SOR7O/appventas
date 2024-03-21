import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ventasor/bloc/producto_bloc/productos_bloc.dart';
import 'package:ventasor/pages/productos_page/home_productos.dart';
import 'package:ventasor/pages/users/home_user.dart';
import 'package:ventasor/services/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductosBloc()..add(InitialProductsEvent()),
          ),
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            initialRoute: '/productos',
            onGenerateRoute: RouterGenerator.onGenerateRoute,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
              useMaterial3: true,
            ),
            home: HomeUser()));
  }
}
