import 'package:dars_4_uy_ishi/models/company.dart';
import 'package:dars_4_uy_ishi/models/employee.dart';
import 'package:dars_4_uy_ishi/models/product.dart';

Map<String, dynamic> companyApi = {
  "company": "Tech Solutions",
  "location": "San Francisco",
  "employees": [
    {
      "name": "Alice",
      "age": 30,
      "position": "Developer",
      "skills": ["Dart", "Flutter", "Firebase"]
    },
    {
      "name": "Bob",
      "age": 25,
      "position": "Designer",
      "skills": ["Photoshop", "Illustrator"]
    }
  ],
  "products": [
    {"name": "Product A", "price": 29.99, "inStock": true},
    {"name": "Product B", "price": 49.99, "inStock": false},
  ],
};

class CompanyController {
  Company company = Company();

  List<Employee> get employees {
    return company.employees;
  }

  List<Product> get products {
    return company.products;
  }

  void getEmployeesandProducts() {
    for (var employee in companyApi["employees"]) {
      company.employees.add(Employee.fromJson(employee));
    }
    for (var product in companyApi["products"]) {
      company.products.add(Product.fromJson(product));
    }
  }

  void addEmployee(Employee employee) {
    companyApi["employees"].add(employee.toJson());
    company.employees.add(employee);
  }

  void addProduct(Product product) {
    companyApi["products"].add(product.toJson());
    company.products.add(product);
  }

  void editEmployee(Employee employee, Employee newEmployee) {
    for (var i = 0; i < companyApi["employees"].length; i++) {
      if (companyApi["employees"][i]["name"] == employee.name) {
        companyApi["employees"][i] = newEmployee.toJson();
      }
    }
  }

  void editProduct(Product product, Product newProduct){
    for(var i=0; i<companyApi["products"].length; i++){
      if(companyApi["products"][i]["name"]==product.name){
        companyApi["products"][i]=newProduct.toJson();
      }
    }
  }

  void removeProduct(Product product) {
    company.products.removeWhere((element) => element == product);
    companyApi["products"]
        .removeWhere((element) => element["name"] == product.name);
  }

  void removeEmployee(Employee employee){
    company.employees.removeWhere((element) => element==employee);
    companyApi["employees"].removeWhere((element)=>element["name"]==employee.name);
  }
}
