import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsListPage extends StatefulWidget {
  const ProductsListPage({super.key});

  @override
  State<ProductsListPage> createState() {
    return ProductsListPageState();
  }
}

class MultiSelectItem<T> {
  final T value;
  bool selected = false;

  MultiSelectItem(this.value);

  @override
  String toString() {
    return 'MultiSelectItem{value: $value, selected: $selected}';
  }
}

class Product {
  final int id;
  final String title;
  final num price;
  final String category;
  final String description;
  final String image;

  Product(
      {required this.id,
        required this.title,
        required this.price,
        required this.category,
        required this.description,
        required this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      category: json['category'],
      description: json['description'],
      image: json['image'],
    );
  }
}

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse("https://fakestoreapi.com/products/category/electronics"));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body) as List<dynamic>;
      List<Product> products = jsonResponse.map((json) => Product.fromJson(json)).toList();
      return products;
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}

class ProductsListPageState extends State<ProductsListPage> {
  List<MultiSelectItem<Product>> listItems = <MultiSelectItem<Product>>[];
  final ProductRepository productRepository = ProductRepository();
  late Future<List<Product>> _products;


  get selectedCount => listItems.where((c) => c.selected == true).length;

  @override
  void initState() {
    super.initState();
    _products = productRepository.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        title: const Text('Electronics',
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Outfit",
              fontWeight: FontWeight.normal,
            )),
      ),
      body: FutureBuilder<List<Product>>(
        future: _products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('An error occurred while fetching products list.'));
          } else {
            bool isListInitialized = listItems.isNotEmpty;
            if (!isListInitialized) {
              listItems = snapshot.data!.map((e) => MultiSelectItem(e)).toList();
            }

            return GridView.builder(
              itemCount: listItems.length,
              shrinkWrap: false,
              padding: const EdgeInsets.all(12),
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (150.0 / 150.0),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      listItems[index].selected = !listItems[index].selected;
                    });
                  },
                  child: Container(
                    child: getGridItem(listItems[index], index),
                  ),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: SizedBox(
          width: double.infinity,
          child: Container(
            alignment: Alignment.center,
            color: Colors.grey.shade300,
            height: 84,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Text("$selectedCount items in cart",
                style: const TextStyle(
                  color: Colors.black87,
                  fontFamily: "Outfit",
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                )),
          )),
    );
  }

  Widget getGridItem(MultiSelectItem item, int index) {
    Product product = item.value;
    Color textColor = item.selected ? Colors.white : Colors.black87;
    Color bgColor = item.selected ? Colors.green.shade500 : Colors.yellow.shade400;
    Color borderColor = item.selected ? Colors.green.shade800 : Colors.yellow.shade800;
    Icon icon = item.selected
        ? const Icon(Icons.remove_shopping_cart_outlined, color: Colors.white)
        : Icon(Icons.add_shopping_cart_outlined, color: Colors.yellow.shade900);

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor, width: 2),
      ),
      child: Container(
        padding: const EdgeInsets.all(6),
        color: bgColor,
        child: ListTile(
          trailing: icon,
          title: Text(
            product.title,
            maxLines: 6,
            style: TextStyle(
              color: textColor,
              fontFamily: "Outfit",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
