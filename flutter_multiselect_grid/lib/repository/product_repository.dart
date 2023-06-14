import 'dart:convert';

import '../models/product.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(
        Uri.parse("https://fakestoreapi.com/products/category/electronics"));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body) as List<dynamic>;
      List<Product> products =
          jsonResponse.map((json) => Product.fromJson(json)).toList();
      return products;
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
