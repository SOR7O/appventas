import 'package:flutter/material.dart';
import 'package:ventasor/pages/productos_page/home_productos.dart';
import 'package:ventasor/pages/users/home_user.dart';

class RouterGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeUser());
      case '/productos':
        return MaterialPageRoute(builder: (_) => HomeProductos());
      default:
        return errorPage();
    }
  }
}

Route<dynamic> errorPage() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error"),
      ),
      body: Center(
        child: Text("Error"),
      ),
    );
  });
}
