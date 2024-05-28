import 'package:dars_4_uy_ishi/controllers/company_controller.dart';
import 'package:dars_4_uy_ishi/models/employee.dart';
import 'package:dars_4_uy_ishi/views/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddEmployeeScreen extends StatelessWidget {
  final CompanyController companyController = CompanyController();

  TextEditingController nameController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  TextEditingController positionController = TextEditingController();

  TextEditingController skillsController = TextEditingController();

  AddEmployeeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Employe",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name",
                  suffixIcon: Icon(
                    Icons.person,
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
                controller: ageController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Age",
                  suffixIcon: Icon(
                    CupertinoIcons.arrow_up_arrow_down,
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
                controller: positionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Position",
                  suffixIcon: Icon(
                    Icons.people,
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
                controller: skillsController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Skills",
                  suffixIcon: Icon(
                    Icons.category_outlined,
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
                companyController.addEmployee(Employee(
                    name: nameController.text,
                    age: int.parse(ageController.text),
                    position: positionController.text,
                    skills: skillsController.text.split(",").toList()));
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
              child: const Text(
                "Add Employee",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
