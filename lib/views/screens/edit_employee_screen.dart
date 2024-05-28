import 'package:dars_4_uy_ishi/controllers/company_controller.dart';
import 'package:dars_4_uy_ishi/models/employee.dart';
import 'package:dars_4_uy_ishi/views/screens/home_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EmployeeEditScreen extends StatefulWidget {
  Employee employee;
  EmployeeEditScreen({super.key, required this.employee});

  @override
  State<EmployeeEditScreen> createState() => _EmployeeEditScreenState();
}

class _EmployeeEditScreenState extends State<EmployeeEditScreen> {
  final CompanyController companyController = CompanyController();

  TextEditingController nameController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  TextEditingController positionController = TextEditingController();

  TextEditingController skillsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("miss the field you don't want to change"),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 250,
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Enter new name",
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
                  hintText: "Enter new age",
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
                controller: positionController,
                decoration: const InputDecoration(
                  hintText: "Enter new position",
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
                  hintText: "Enter new skills",
                  suffixIcon: Icon(
                    Icons.person,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                companyController.editEmployee(
                    widget.employee,
                    Employee(
                        name: nameController.text.isEmpty
                            ? widget.employee.name
                            : nameController.text,
                        age: ageController.text.isEmpty
                            ? widget.employee.age
                            : int.parse(ageController.text),
                        position: positionController.text.isEmpty
                            ? widget.employee.position
                            : positionController.text,
                        skills: skillsController.text.isEmpty
                            ? widget.employee.skills
                            : skillsController.text.split(",").toList()));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
              child: const Text(
                "Save",
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
