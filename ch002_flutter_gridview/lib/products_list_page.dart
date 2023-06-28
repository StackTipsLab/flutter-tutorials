import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_multiselect_grid/grid_item_widget.dart';
import 'package:flutter_multiselect_grid/repository/product_repository.dart';
import 'models/product.dart';

class ProductsListPage extends StatefulWidget {
  const ProductsListPage({super.key});

  @override
  State<ProductsListPage> createState() {
    return ProductsListPageState();
  }
}

class ProductsListPageState extends State<ProductsListPage> {
  final ProductRepository productRepository = ProductRepository();
  late List<Product> productsList;

  @override
  void initState() {
    super.initState();
    productsList = productRepository.getProductsList();
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
      body: GridView.builder(
          itemCount: productsList.length,
          shrinkWrap: false,
          padding: const EdgeInsets.all(12),
          physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (150.0 / 175),
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: GridItemWidget(product: productsList[index], index: index),
            );
          }),
    );
  }
}
