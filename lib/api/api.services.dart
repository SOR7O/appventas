// import 'dart:convert';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:ventasor/models/productos.model.dart';

class ApiService {
  final url = "https://backend-sales-8ax7.onrender.com/";
  // final url = "http://localhost:3000/";
  Future<List<ProductosModel>> getProductos() async {
    print("heree???");
    List<ProductosModel> prods = [];
    try {
      var uri = Uri.parse('${url}producto/getProductos');
      var response = await http.get(uri);
      // print("now ${response.body}");
      var responseDecode = jsonDecode(response.body);
      List data = responseDecode['data'] ?? [];
      if (data.length > 0) {
        for (var i = 0; i < data.length; i++) {
          print("${data[i]['nombre']}");
          ProductosModel prd =
              ProductosModel.fromMap(data[i] as Map<String, dynamic>);
          prods.add(prd);
        }
      }
      // print(responseDecode['data'][0]);
      // if (responseDecode['type'] == "ok") {
      //   responseDecode['data'].forEach((element) {
      //     prods.add(ProductosModel.fromJson(element));
      //   });
      // }
      // for (var i = 0; i < responseDecode['data'].length; i++) {

      // }
      print("Size=>?${prods.length}");
      return prods;
    } catch (e) {
      print("heree ?${e.toString()}");
      return [];
    }
  }

  registro(
      nombre, direccion, telefono, correo, username, password, typeUser) async {
    final body = {
      nombre: nombre,
      direccion: direccion,
      telefono: telefono,
      correo: correo,
      username: username,
      password: password,
      typeUser: typeUser,
    };
    final _url = Uri.parse(this.url + "user/createUser");
    Response response = await post(_url, body: body);
    print(response.body);
  }

  Future<dynamic> login(String username, String password) async {
    final url = Uri.parse("${this.url}user/login");
    final body = {"username": username, "password": password};
    Response response = await http.post(url, body: body);
    final _res = jsonDecode(response.body);
    print(_res);
    return _res;
  }
}
