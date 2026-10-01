// Question 5: Advanced Features & Mixins (Difficulty: 5/5) ⭐⭐⭐⭐⭐

mixin Payable {
  double calculateSalary(double baseSalary, double bonus) {
    return baseSalary + bonus;
  }

  void processPayment(double amount) {
    print("Payment processed: $amount");
  }
}

mixin Reportable {
  String generateReport(String employeeName, String department) {
    return "Report: Monthly report for $employeeName in $department department";
  }
}

abstract class Employee {
  String name;
  String id;
  String department;

  Employee(this.name, this.id, this.department);

  String getJobTitle();
  double getBaseSalary();

  void displayInfo() {
    print("Employee: $name (ID: $id, Department: $department)");
  }
}

class Manager extends Employee with Payable, Reportable {
  int teamSize;

  Manager(String name, String id, String department, this.teamSize)
      : super(name, id, department);

  @override
  String getJobTitle() {
    return "Manager";
  }

  @override
  double getBaseSalary() {
    return 8000.0;
  }

  @override
  void displayInfo() {
    print(
        "Manager: $name (ID: $id, Department: $department, Team Size: $teamSize)");
  }
}

class Developer extends Employee with Payable {
  String programmingLanguage;

  Developer(
      String name, String id, String department, this.programmingLanguage)
      : super(name, id, department);

  @override
  String getJobTitle() {
    return "Senior Developer";
  }

  @override
  double getBaseSalary() {
    return 6000.0;
  }

  @override
  void displayInfo() {
    print(
        "Developer: $name (ID: $id, Department: $department, Language: $programmingLanguage)");
  }
}

void main() {
  // Create employees
  Manager manager = Manager(
    "John Smith",
    "M001",
    "IT",
    5,
  );

  Developer developer = Developer(
    "Alice Johnson",
    "D001",
    "IT",
    "Dart",
  );

  // Manager information
  manager.displayInfo();
  print("Job Title: ${manager.getJobTitle()}");
  print("Base Salary: ${manager.getBaseSalary()}");

  double managerSalary =
      manager.calculateSalary(manager.getBaseSalary(), 1000.0);

  print("Calculated Salary: $managerSalary");

  manager.processPayment(managerSalary);

  print(manager.generateReport(manager.name, manager.department));

  print("");

  // Developer information
  developer.displayInfo();
  print("Job Title: ${developer.getJobTitle()}");
  print("Base Salary: ${developer.getBaseSalary()}");

  double developerSalary =
      developer.calculateSalary(developer.getBaseSalary(), 500.0);

  print("Calculated Salary: $developerSalary");

  developer.processPayment(developerSalary);
}