class Product {
  final String product, image, descrption;
  final int id;
  final double price;
  Product({
    required this.id,
    required this.product,
    required this.image,
    required this.descrption,
    required this.price,
  });
}

List<Product> products = [
  Product(
      id: 1,
      product: 'Colgate',
      image:
          'https://www.dealsmagnet.com/images/14ZImcWP/2020/August/06/large/colgate-active-salt-toothpaste-germ-fighting-tooth.jpg',
      descrption: 'Extra Fresh',
      price: 50),
  Product(
      id: 2,
      product: 'Colgate',
      image:
          'https://littlecaymangrocery.com/wp-content/uploads/2022/08/resize-29-14.webp',
      descrption: 'Active Fresh',
      price: 50),
  Product(
      id: 3,
      product: 'Colgate',
      image:
          'https://ipcdn.freshop.com/resize?url=https://images.freshop.com/1564405684702555414/9d31ede6def24dd29a6025d9cb2b934e_large.png&width=256&type=webp&quality=80',
      descrption: 'Charcoal Fresh',
      price: 50),
  Product(
      id: 4,
      product: 'Colgate',
      image:
          'https://littlecaymangrocery.com/wp-content/uploads/2022/08/resize-29-14.webp',
      descrption: 'Fresh Breath',
      price: 50),
  Product(
      id: 5,
      product: 'Colgate',
      image:
          'https://cdn.shopify.com/s/files/1/0257/1884/9583/products/60072.jpg?v=1659581680',
      descrption: 'Salt Fresh',
      price: 50),
  Product(
      id: 6,
      product: 'Clear',
      image:
          'https://api.watsons.com.ph/medias/Men-Shampoo-Cool-Sport-Menthol-350ml-10100268.jpg?context=bWFzdGVyfHd0Y3BoL2ltYWdlc3wxMjgzNjB8aW1hZ2UvanBlZ3xoMGUvaDIzLzkwOTY4NDUzOTM5NTAvTWVuIFNoYW1wb28gQ29vbCBTcG9ydCBNZW50aG9sIDM1MG1sLTEwMTAwMjY4LmpwZ3wxODBjNmU3ZTQ4YWUzYTZlM2MwNjFhNWU2NDk4NDFlODI1YzBlZWU5ZWRmNTUyMmM4OTZjMDQ0NGRhNmY3ZTUx',
      descrption: 'Clear Men',
      price: 50),
  Product(
      id: 7,
      product: 'Clear',
      image:
          'https://ath2.unileverservices.com/wp-content/uploads/sites/8/2017/08/CLEAR-Complete-Soft-Care-2.jpg',
      descrption: 'Soft Care',
      price: 50),
  Product(
      id: 8,
      product: 'Colgate',
      image:
          'https://cdn.shopify.com/s/files/1/0257/1884/9583/products/60072.jpg?v=1659581680',
      descrption: 'Salt Fresh',
      price: 50),
  Product(
      id: 9,
      product: 'Colgate',
      image:
          'https://cdn.shopify.com/s/files/1/0257/1884/9583/products/60072.jpg?v=1659581680',
      descrption: 'Salt Fresh',
      price: 50),
];
