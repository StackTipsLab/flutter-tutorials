import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_multiselect_grid/grid_item_widget.dart';
import 'package:flutter_multiselect_grid/repository/product_repository.dart';
import 'models/multi_select_item.dart';
import 'models/product.dart';

class ProductsListPage extends StatefulWidget {
  const ProductsListPage({super.key});

  @override
  State<ProductsListPage> createState() {
    return ProductsListPageState();
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
              fontWeight: FontWeight.normal,
            )),
      ),
      body: FutureBuilder<List<Product>>(
        future: _products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
                child: Text('An error occurred while fetching products list.'));
          } else {
            bool isListInitialized = listItems.isNotEmpty;
            if (!isListInitialized) {
              listItems =
                  snapshot.data!.map((e) => MultiSelectItem(e)).toList();
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
                  child: GridItemWidget(item: listItems[index], index: index),
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
}
