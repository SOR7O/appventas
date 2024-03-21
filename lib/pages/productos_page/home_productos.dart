import 'dart:convert';

import 'dart:async';
// import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:ventasor/api/api.services.dart';
import 'package:ventasor/bloc/producto_bloc/productos_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProductos extends StatefulWidget {
  @override
  State<HomeProductos> createState() => _HomeProductosState();
}

class _HomeProductosState extends State<HomeProductos> {
  final api = ApiService();
  late ProductosBloc productosBloc;

  @override
  void initState() {
    // TODO: implement initState
    // productosBloc.add(ProductosInitialFetchEvent());
    productosBloc = ProductosBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Home Productos")),
        // body: test(context),
        body: BlocBuilder<ProductosBloc, ProductosState>(
          builder: (context, state) {
            if (state is LoadingProductsState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is LoadedSuccessProductsState) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height * 0.95),
                  crossAxisCount: 2, // number of items in each row
                  mainAxisSpacing: 8.0, // spacing between rows
                  crossAxisSpacing: 8.0, // spacing between columns
                ),
                padding: EdgeInsets.all(8.0), // padding around the grid
                itemCount: state.prods.length, // total number of items
                itemBuilder: (context, index) {
                  var img = state.prods[index].imagen.split(",");
                  // print(img);
                  Uint8List _bytesImage = Base64Decoder().convert(img[1]);
                  return bodyBuilder(_bytesImage, state, index);
                },
              );
            }
            return Center(child: Text("Error"));
          },
        ));
  }

  Container bodyBuilder(_bytesImage, state, index) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              10), //this is causing the error, when I remove it, I get the card like on picture 2 with the red line
          border: Border(
            left: BorderSide(
                color: Colors.grey, width: 3.0, style: BorderStyle.solid),
          ),
        ), // color of grid items
        child: body(_bytesImage, state, index));
  }

  Column body(
      Uint8List _bytesImage, LoadedSuccessProductsState state, int index) {
    print("Tuuppee");
    print(state.prods[index].precio.values);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bytesImage == null
            ? SizedBox()
            : Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.memory(
                    _bytesImage,
                    fit: BoxFit.contain,
                    height: 130,
                    width: 130,
                  ),
                ),
              ),
        // state.prods[index].imagen==null?SizedBox():
        Text("Nombre: ${state.prods[index].nombre}"),
        Text("Descripcion: ${state.prods[index].descripcion}",
            style: TextStyle(fontSize: 10.0)),
        Text(
            "Precio: L.${state.prods[index].precio.values.toString().replaceAll('(', "").replaceAll(')', "")}"),
        Center(
          child: IconButton(
              onPressed: () {
                productosBloc.add(ProductosAddEvent());
              },
              icon: Icon(Icons.shopping_cart_checkout_rounded)),
        )
      ],
    );
  }
}
