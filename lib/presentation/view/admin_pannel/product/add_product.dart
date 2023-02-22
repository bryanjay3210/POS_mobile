import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_checker/services/product_service.dart';
import 'package:price_checker/utils/custom_button.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final formKey = GlobalKey<FormState>();
  final ctrlProductName = TextEditingController();
  final ctrlDescription = TextEditingController();
  final ctrlQuantity = TextEditingController();
  final ctrlPrice = TextEditingController();
  File? _image;
  String? _imageBase64;

  Future pickImage(ImageSource source) async {
    try{
      final image = await ImagePicker().pickImage(source: source, imageQuality: 50);
      if(image == null) return;
      File? img = File(image.path);
      img = await cropImage(imageFIle: img);
      setState(() {
        _image = img;
      });
    } on PlatformException catch (e){
      print(e);
      Navigator.pop(context);
    }
  }

  Future<File?> cropImage({required File imageFIle}) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(sourcePath: imageFIle.path);
    if(croppedImage == null) return null;
    return File(croppedImage.path);
  }

  @override
  void dispose() {
    ctrlQuantity.dispose();
    ctrlPrice.dispose();
    ctrlDescription.dispose();
    ctrlProductName.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)!.settings.arguments! as Map);
    if(args['action'] == 'Update'){
      ctrlProductName.text = args['productName'];
      ctrlDescription.text = args['description'];
      ctrlPrice.text =  double.parse(args['price'].toString()).toStringAsFixed(2);
      ctrlQuantity.text = args['quantity'].toString();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(args['action'] == 'Create' ? 'Add Product' : 'Update Product'),
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Center(child: GestureDetector(
                  onTap: () => showModal(context: context),
                  child: _image == null ? args['action'] == 'Update' ? Image.memory(base64Decode(args['imageBase64']), height: 200, width: 200,) : Container(height: 200, width: 200, color: Colors.grey[200],
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.add_photo_alternate_outlined, size: 50),
                        const SizedBox(height: 10,),
                        Center(child: Text('Upload product photo', style: GoogleFonts.lato(fontSize: 15),)),
                      ],
                  ),) : Image(image: FileImage(_image!), height: 200, width: 200,),
                )) ,
                const SizedBox(height: 30,),
                TextFormField(
                  controller: ctrlProductName,
                  validator: (value) => value!.isEmpty ? 'Product Name is empty' : null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    label: Text('Product Name'),
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: ctrlDescription,
                  validator: (value) => value!.isEmpty ? 'Description is empty' : null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    label: Text('Description'),
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: ctrlQuantity,
                  validator: (value) => value!.isEmpty ? 'Quantity is empty' : null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    label: Text('Quantity'),
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: ctrlPrice,
                  validator: (value) => value!.isEmpty ? 'Price is empty' : null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    label: Text('Price'),
                  ),
                ),
                const SizedBox(height: 20,),
                Center(
                  child: CustomButton(function: () async {
                   if(formKey.currentState!.validate()){
                     if(_imageBase64 == null) {
                       Fluttertoast.showToast(msg: 'Image is empty!');
                     } else {
                       if(args['action'] == 'Create'){
                         ProductService().addProduct(productName: ctrlProductName.text, description: ctrlDescription.text, price: double.parse(ctrlPrice.text), quantity: int.parse(ctrlQuantity.text), imageBase64: _imageBase64!).then((value) {
                           Navigator.pop(context);
                         });
                       } else {
                         ProductService().updateProduct(id: args['id'],productName: ctrlProductName.text, description: ctrlDescription.text, price: double.parse(ctrlPrice.text), quantity: int.parse(ctrlQuantity.text), imageBase64: _imageBase64!).then((value) {
                           Navigator.pop(context);
                         });
                       }
                     }
                   }
                  } , text: args['action'], height: 50, width: double.infinity),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Future<dynamic> showModal({required BuildContext context}){
    return showModalBottomSheet(context: context, builder: (context) {
      return SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  modalButton(icon: Icons.camera, text: 'Browse in gallery', function: () => pickImage(ImageSource.gallery).then((value) async {
                    _imageBase64 = base64Encode(await _image!.readAsBytes());
                  }).then((value) => Navigator.pop(context))),
                  modalButton(icon: Icons.camera_alt, text: 'Browse in camera', function: () => pickImage(ImageSource.camera).then((value) async {
                    _imageBase64 = base64Encode(await _image!.readAsBytes());
                  }).then((value) => Navigator.pop(context))),
                ],
              ),
              const SizedBox(height: 30,),
              CustomButton(function: () => Navigator.pop(context), text: 'Close', height: 40, width: double.infinity)
            ],
          ),
        ),
      );
    },);
  }
  Widget modalButton({required IconData icon, required String text, required VoidCallback function }){
    return GestureDetector(
      onTap: function,
      child: Column(
        children: [
          Icon(icon, size: 30),
          Text(text),
        ],
      ),
    );
  }
}




