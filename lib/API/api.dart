import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modals/models.dart';

Future<List<Product>> fetchProducts() async {
  final response =
      await http.get(Uri.parse('https://fakestoreapi.com/products'));
  if (response.statusCode == 200) {
    List jsonData = json.decode(response.body);
    return jsonData.map((e) => Product.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
