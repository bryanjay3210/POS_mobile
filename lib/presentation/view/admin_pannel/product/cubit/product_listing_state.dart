part of 'product_listing_cubit.dart';

class ProductListingState extends Equatable{
  const ProductListingState({
    required this.product,
    required this.isLoading,
});
  final List<Product> product;
  final bool isLoading;
  ProductListingState copyWith({
    List<Product>? product,
    bool? isLoading,
}){
  return ProductListingState(
    product: product ?? this.product,
    isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    product,
    isLoading,
  ];
}

