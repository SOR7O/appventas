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
              return ListView.builder(
                  // physics: never(),
                  // shrinkWrap: true,
                  itemCount: state.prods.length,
                  itemBuilder: (context, index) {
                    var img = state.prods[index].imagen.split(",");
                    // print(img);
                    Uint8List _bytesImage = Base64Decoder().convert(img[1]);
                    // Uint8List bytes = BASE64.decode(_base64);
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            10), //this is causing the error, when I remove it, I get the card like on picture 2 with the red line
                        border: Border(
                          left: BorderSide(
                              color: Colors.grey,
                              width: 3.0,
                              style: BorderStyle.solid),
                        ),
                      ),
                      // color: Colors.red,
                      width: MediaQuery.of(context).size.width * 0.70,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Image.memory(
                              _bytesImage,
                              width: 200,
                              fit: BoxFit.fitWidth,
                            ),
                            // state.prods[index].imagen==null?SizedBox():
                            ListTile(
                              title: Text(state.prods[index].nombre),
                              subtitle: Text(state.prods[index].descripcion),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }

            return Center(child: Text("Error"));
          },
        ));
  }
}
