import 'package:flutter_bloc/flutter_bloc.dart';

import '../product.dart';
import 'fetch_product.dart';

class ProductBloc extends Bloc<ProductEvent> {
  static final Product initialProduct = Product(barcode: '');
  Product product = initialProduct;

  ProductBloc(String barcode) {
    fetchProduct(barcode);
  }

  void fetchProduct(String barcode) {
    add(FetchProductEvent(barcode));
  }
}
