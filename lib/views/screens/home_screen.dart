import 'package:dars_4_uy_ishi/controllers/company_controller.dart';
import 'package:dars_4_uy_ishi/views/screens/add_employee_screen.dart';
import 'package:dars_4_uy_ishi/views/screens/add_product_screen.dart';
import 'package:dars_4_uy_ishi/views/widgets/employee_widget.dart';
import 'package:dars_4_uy_ishi/views/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CompanyController companyController = CompanyController();

  @override
  void initState() {
    super.initState();
    companyController.getEmployeesandProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Company",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Products",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              companyController.products.isNotEmpty
                  ? Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      children: [
                        for (var product in companyController.products)
                          ProductWidget(
                            product: product,
                            delete: () {
                              setState(() {
                                companyController.removeProduct(product);
                              });
                            },
                          ),
                      ],
                    )
                  : const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("No products"),
                      ],
                    ),
              const SizedBox(height: 20),
              const Text(
                "Employees",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              companyController.employees.isEmpty
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("No employee"),
                      ],
                    )
                  : Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      children: [
                        for (var employee in companyController.employees)
                          EmployeeWidget(
                            employee: employee,
                            delete: () {
                              setState(() {
                                companyController.removeEmployee(employee);
                              });
                            },
                          ),
                      ],
                    ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddProductScreen()));
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      size: 35,
                      color: Colors.green,
                    ),
                    Text(
                      "product",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddEmployeeScreen()));
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      size: 35,
                      color: Colors.green,
                    ),
                    Text(
                      "employee",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.green),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
