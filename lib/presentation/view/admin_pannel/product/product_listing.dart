import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_checker/presentation/view/admin_pannel/product/cubit/product_listing_cubit.dart';

class ProductListing extends StatefulWidget {
  const ProductListing({Key? key}) : super(key: key);

  @override
  State<ProductListing> createState() => _ProductListingState();
}

class _ProductListingState extends State<ProductListing> {
  @override
  Widget build(BuildContext context) {
    context.read<ProductListingCubit>().initState();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black.withOpacity(0.1),
              ),
              height: 45,
              child: Row(
                children: const [
                  Icon(Icons.search),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Search'),
                    ),
                  ),
                ],
              )),
        ),
        // BlocBuilder<ProductListingCubit, ProductListingState>(builder: (context, state) {
        //   if (state.isLoading) return LoadingAnimationWidget.staggeredDotsWave(color: Colors.blue, size: 50);
        //   return ListView.builder(
        //     itemCount: state.product.length,
        //     itemBuilder: (context, index) {
        //       return SizedBox(
        //         height: 40,
        //         width: double.infinity,
        //         child: Slidable(
        //           endActionPane: ActionPane(
        //             motion: const DrawerMotion(),
        //             children: [
        //               SlidableAction(onPressed: (value) {
        //                 Navigator.pushNamed(context, '/add_product', arguments: {'action': 'Update',
        //                   'id': document.id,
        //                   'productName': data['productName'],
        //                   'description': data['description'],
        //                   'price': data['price'],
        //                   'quantity': data['quantity'],
        //                   'imageBase64': data['imageBase64'],
        //                 });
        //               }, backgroundColor: Colors.green, icon: Icons.edit,),
        //               SlidableAction(onPressed: (value) {
        //                 ProductService().deleteProduct(id: document.id);
        //               }, backgroundColor: Colors.red, icon: Icons.delete,),
        //             ],
        //           ),
        //           child: ListTile(
        //             leading: Image.memory(base64Decode(data['imageBase64']), height: 50, width: 50),
        //             title: Text(data['productName']),
        //             subtitle: Text(data['description']),
        //             trailing: Text('₱ ${double.parse(data['price'].toString()).toStringAsFixed(2)}'),
        //           ),
        //         ),
        //       );
        //   },);
        // },)
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/add_product',
            arguments: {'action': 'Create'}),
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
