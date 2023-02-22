import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:price_checker/model/product.dart';

class ProductService{
  // String uuid;
  // ProductService({required this.uuid});

  final CollectionReference productCollection = FirebaseFirestore.instance.collection('products');

  Future updateProduct({required String id, required String productName, required String description, required double price, required int quantity, required String imageBase64}) async {
    return await productCollection.doc(id).update({
      'productName': productName,
      'description': description,
      'price': price,
      'quantity': quantity,
      'imageBase64': imageBase64,
    });
  }

  Future deleteProduct({required String id}) async {
    return await productCollection.doc(id).delete().then((value) => Fluttertoast.showToast(msg: 'Product successfully deleted!')).catchError((error) => Fluttertoast.showToast(msg: 'Failed to delete product: $error'));
  }

  Future addProduct({required String productName, required String description, required double price, required int quantity, required String imageBase64}) async {
    return await productCollection.add({
      'productName': productName,
      'description': description,
      'price': price,
      'quantity': quantity,
      'imageBase64': imageBase64,
    }).then((value) => Fluttertoast.showToast(msg: 'Product successfully added!')).catchError((error) => Fluttertoast.showToast(msg: 'Failed to add product: $error'));
  }

  Future getData() async {
    final product = productCollection.withConverter<Product>(
        fromFirestore: (snapshot, _) {
          print('${snapshot.data()!} <-------------');
          return Product.fromJson(snapshot.data()!);
        }, toFirestore: (value, _) {
          return {};
        },);
  }
}