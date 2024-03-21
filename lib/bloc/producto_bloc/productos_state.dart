part of 'productos_bloc.dart';

@immutable
abstract class ProductosState extends Equatable {
  const ProductosState();
  @override // override hara que el
  List<Object> get props => [];
}

class InitialProductsState extends ProductosState {}

class LoadingProductsState extends ProductosState {}

class LoadedSuccessProductsState extends ProductosState {
  List<ProductosModel> prods;
  LoadedSuccessProductsState(this.prods);
  @override
  List<ProductosModel> get props => prods;
}

class LoadedErrorProductsState extends ProductosState {
  final String message;

  LoadedErrorProductsState(this.message);
  @override
  List<Object> get props => [message];
}


// class LoadedProductsState extends ProductosState {}
