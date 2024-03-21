import 'dart:convert';

class ProductosModel {
  final String nombre;
  final String descripcion;
  final bool disponible;
  final String imagen;

  ProductosModel(
      {required this.nombre,
      required this.descripcion,
      required this.disponible,
      required this.imagen});
  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'descripcion': descripcion,
      'disponible': disponible,
      'imagen': imagen,
    };
  }

  factory ProductosModel.fromMap(Map<String, dynamic> map) {
    // print(map);
    return ProductosModel(
        nombre: map['nombre'] ?? '',
        descripcion: map['descripcion'] ?? '',
        disponible: map['disponible'] ?? false,
        imagen: map['imagen'] ?? '');
  }
  String toJson() => json.encode(toMap());

  factory ProductosModel.fromJson(String source) =>
      ProductosModel.fromMap(json.decode(source));
}
