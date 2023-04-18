const dependentCost = 11000000;

class Salary {
  String name;
  double gross;

  Salary(this.name, this.gross);

  double get get_Salary {
    final gross_salary = gross;
    double temp = gross_salary * (1 - 0.105);
    if (temp <= dependentCost) return temp;
    return dependentCost + (temp - dependentCost) * (1 - 0.05);
  }
}
