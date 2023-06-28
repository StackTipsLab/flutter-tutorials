import 'dart:convert';

import '../models/product.dart';

class ProductRepository {
  List<Product> getProductsList() {
    List<Product> products = [];

    products.add(Product(
      id: 1,
      title: "iPhone 12 Pro",
      price: 1099.99,
      category: "Electronics",
      description:
          "The iPhone 12 Pro features a powerful A14 Bionic chip, 5G capability, and a stunning Super Retina XDR display.",
      image: "https://images.unsplash.com/photo-1556656793-08538906a9f8",
    ));

    products.add(Product(
      id: 2,
      title: "Samsung Galaxy S21",
      price: 999.99,
      category: "Electronics",
      description:
          "The Samsung Galaxy S21 comes with a high-resolution display, a powerful Exynos processor, and a versatile triple camera system.",
      image: "https://images.unsplash.com/photo-1555774698-0b77e0d5fac6",
    ));

    products.add(Product(
      id: 3,
      title: "Canon EOS R5",
      price: 3499.99,
      category: "Cameras",
      description:
          "The Canon EOS R5 is a professional mirrorless camera that offers high-resolution imaging, advanced autofocus, and 8K video recording.",
      image: "https://images.unsplash.com/photo-1581591524425-c7e0978865fc",
    ));

    // Additional products
    products.add(Product(
      id: 4,
      title: "Sony PlayStation 5",
      price: 499.99,
      category: "Gaming",
      description:
          "The Sony PlayStation 5 is the next-generation gaming console with lightning-fast loading, adaptive triggers, and immersive 3D audio.",
      image: "https://images.unsplash.com/photo-1605835963874-a7c87f56259e",
    ));

    products.add(Product(
      id: 5,
      title: "Apple MacBook Pro",
      price: 1999.99,
      category: "Computers",
      description:
          "The Apple MacBook Pro offers powerful performance, a stunning Retina display, and an ergonomic Magic Keyboard for seamless productivity.",
      image: "https://images.unsplash.com/photo-1526925712774-2833a7ecd0d4",
    ));

    products.add(Product(
      id: 6,
      title: "Nike Air Max 270",
      price: 129.99,
      category: "Shoes",
      description:
          "The Nike Air Max 270 sneakers feature a stylish design, comfortable Air cushioning, and durable rubber outsole for all-day wear.",
      image: "https://images.unsplash.com/photo-1581343600527-acef96ef2e84",
    ));

    products.add(Product(
      id: 7,
      title: "Samsung QLED 4K Smart TV",
      price: 1499.99,
      category: "Electronics",
      description:
          "The Samsung QLED 4K Smart TV delivers stunning visuals, vibrant colors, and a smart interface for accessing your favorite streaming services.",
      image: "https://images.unsplash.com/flagged/photo-1572609239482-d3a83f976aa0",
    ));

    products.add(Product(
      id: 8,
      title: "Fitbit Versa 3",
      price: 229.99,
      category: "Wearable Technology",
      description:
          "The Fitbit Versa 3 is a versatile smartwatch that tracks your activity, monitors your heart rate, and provides on-wrist phone notifications.",
      image: "https://images.unsplash.com/photo-1510017803434-a899398421b3",
    ));

    return products;
  }
}
