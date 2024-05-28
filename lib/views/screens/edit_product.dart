import 'package:dars_4_uy_ishi/controllers/company_controller.dart';
import 'package:dars_4_uy_ishi/models/product.dart';
import 'package:dars_4_uy_ishi/views/screens/home_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditProduct extends StatelessWidget {
  Product product;
  EditProduct({super.key, required this.product});

  TextEditingController nameController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController stockController = TextEditingController();

  final CompanyController companyController = CompanyController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Enter new product name",
                  suffixIcon: Icon(
                    Icons.production_quantity_limits_outlined,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 250,
              child: TextField(
                controller: priceController,
                decoration: const InputDecoration(
                  hintText: "Enter new price",
                  suffixIcon: Icon(
                    Icons.numbers,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 250,
              child: TextField(
                controller: stockController,
                decoration: const InputDecoration(
                  hintText: "in stock? yes/no",
                  suffixIcon: Icon(
                    Icons.stacked_bar_chart_rounded,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                companyController.editProduct(
                    product,
                    Product(
                        name: nameController.text.isEmpty
                            ? product.name
                            : nameController.text,
                        price: double.parse(priceController.text),
                        inStock: stockController.text == "yes"));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
              child: const Text(
                "Edit Product",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
