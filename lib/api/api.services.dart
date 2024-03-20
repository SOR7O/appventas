// import 'dart:convert';
import 'package:http/http.dart';

class ApiService {
  final url = "https://backend-sales-8ax7.onrender.com/";
  // final url= "http://localhost:3000/";
  // Future<dynamic> getProductos() async {
  //   final data=[];
  //   var uri= Uri.parse(url+'productos/getProductos');
  //   final response= await http.get(uri);
  // }

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
    final _url = this.url + "user/createUser";
    Response response = await post(Uri.parse(_url), body: body);
    print(response.body);
  }

  login(String username, String password) async {
    final _url = this.url + "user/login";
    final body = {"username": username, "password": password};
    Response response = await post(Uri.parse(_url), body: body);
    print(response.body);
  }
}
