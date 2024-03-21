import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ventasor/api/api.services.dart';
import 'package:ventasor/models/productos.model.dart';

part 'productos_event.dart';
part 'productos_state.dart';

class ProductosBloc extends Bloc<ProductosEvent, ProductosState> {
  // late StreamSubscription _prdSubs;
  // final ProductosBloc _prdBloc;
  ProductosBloc() : super(InitialProductsState()) {
    on<InitialProductsEvent>(onLoadProds);
    on<ProductosAddEvent>(productosAddEvent);
  }

  // void productosInitialFetchEvent(
  //     ProductosInitialFetchEvent event, Emitter<ProductosState> emit) async {
  //   print("Gooo to");
  //   emit(ProductosLoadingState());
  //   await Future.delayed(Duration(seconds: 7));
  //   print("Gooo to");
  //   emit(ProductosFetchingSuccessState(productos: products));
  // }

  // FutureOr<void> productosAddEvent(
  //     ProductosAddEvent event, Emitter<ProductosState> emit) {}

  void onLoadProds(
      InitialProductsEvent event, Emitter<ProductosState> emit) async {
    emit(LoadingProductsState());
    List<ProductosModel> products = await ApiService().getProductos();
    emit(LoadedSuccessProductsState(products));
  }

  FutureOr<void> productosAddEvent(
      ProductosAddEvent event, Emitter<ProductosState> emit) {
    print("Gooo to");
  }
}
