import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:price_checker/model/product.dart';
import 'package:price_checker/services/product_service.dart';

part 'product_listing_state.dart';

class ProductListingCubit extends Cubit<ProductListingState> {
  ProductListingCubit() : super(const ProductListingState(product: [], isLoading: false));

  void initState() async {
    emit(state.copyWith(isLoading: true, product: []));
    await ProductService().getData();
    // List<Product> product = await productStream;
    // print(product.length);
    emit(state.copyWith(isLoading: false, product: []));
  }

}
