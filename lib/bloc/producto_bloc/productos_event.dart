part of 'productos_bloc.dart';

@immutable
abstract class ProductosEvent extends Equatable {
  const ProductosEvent();

  @override
  List<Object> get props => [];
}

class InitialProductsEvent extends ProductosEvent {}

class LoadingProductsEvent extends ProductosEvent {}

class LoadProductsEvent extends ProductosEvent {
  final List<ProductosModel> prods;
  const LoadProductsEvent({this.prods = const <ProductosModel>[]});

  @override
  List<Object> get props => [prods];
}

class ProductosAddEvent extends ProductosEvent {}
