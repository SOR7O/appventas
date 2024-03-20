import 'package:flutter/material.dart';
import 'package:ventasor/bloc/productos_bloc.dart';

class HomeProductos extends StatelessWidget {
  final productosBloc = new ProductosBloc();
  final List<Widget> rows = [];
  final List<Widget> columns = [];
  int numeroRow = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Home Productos"), leading: const Text("leading")),
      // body: test(context),
      body: productos(context),
    );
  }

  test(context) {
    return Column(
      children: [
        Row(
          children: [
            card(context, 1),
            card(context, 1),
          ],
        ),
        Row(
          children: [
            card(context, 1),
            card(context, 1),
          ],
        ),
      ],
    );
  }

  body(context, i) {
    print("HowMany");
    rows.add(card(context, i));
    print("=>ROws=>${rows}");
    print("=>ROws=>${rows.length}");

    return card(context, i);
  }

  // card(context, i) {
  //   var numer= (i%2)==0;
  //   print("numer");
  //   print(numer);
  //   return Row(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       mainAxisSize: MainAxisSize.max,
  //     children: [

  //     ],
  //   );
  // }

  productos(context) {
    return StreamBuilder(
      stream: productosBloc.getProductos,
      builder: (_, AsyncSnapshot<dynamic> snapshot) {
        final productos = snapshot.data ?? [];

        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 90 / 80,
              crossAxisCount: 2,
            ),
            itemCount: productos.length,
            itemBuilder: (_, i) {
              return card(context, i);
            });
      },
    );
  }

  card(context, i) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(10),
      elevation: 5.0,
      shadowColor: Colors.grey,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Text("una card despues del reload ${i}")),
    );
  }
}
