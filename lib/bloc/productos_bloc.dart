const PRODUCTOS = [
  'prd1',
  "prd2",
  "prd3",
  "otro",
  "otro mas",
  " haber como se mira",
  "prd2",
  "prd3",
  "otro",
  "otro mas",
  " haber como se mira"
];

class ProductosBloc {
  Stream<List<String>> get getProductos async* {
    final List<String> productos = [];

    for (String prd in PRODUCTOS) {
      // print(prd);
      // await Future.delayed(const Duration(seconds: 3));
      productos.add(prd);
      yield productos;
    }
  }
}
