import 'dart:convert';

class ProductosModel {
  final String nombre;
  final String descripcion;
  final bool disponible;
  final String imagen;
  final Map<String, dynamic> imp;
  final Map<String, dynamic> precio;
  final String nombreCompany;

  ProductosModel(
      {required this.nombre,
      required this.descripcion,
      required this.precio,
      required this.imp,
      required this.nombreCompany,
      required this.disponible,
      required this.imagen});
  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'descripcion': descripcion,
      'disponible': disponible,
      'imagen': imagen,
      'precio': precio,
      'imp': imp,
      'nombreCompany': nombreCompany,
    };
  }

  factory ProductosModel.fromMap(Map<String, dynamic> map) {
    // print(map);
    return ProductosModel(
        nombre: map['nombre'] ?? '',
        descripcion: map['descripcion'] ?? '',
        nombreCompany: map['nombreCompany'] ?? '',
        precio: map['precio'] ?? {},
        imp: map['imp'] ?? {},
        disponible: map['disponible'] ?? false,
        imagen: map['imagen'] ?? '');
  }
  String toJson() => json.encode(toMap());

  factory ProductosModel.fromJson(String source) =>
      ProductosModel.fromMap(json.decode(source));
}
