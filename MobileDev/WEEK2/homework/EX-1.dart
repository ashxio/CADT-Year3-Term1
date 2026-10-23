enum Skill { FLUTTER, DART, OTHER }
class Address {
  final String street;
  final String city;
  final String zipCode;
  Address(this.street, this.city, this.zipCode);
}
class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skill;
  final Address _address;
  final int _yearOfExperience;

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skill => _skill;
  Address get Adress => _address;
  int get yearOfExperience => _yearOfExperience;
  Employee(
    this._name,
    this._baseSalary,
    this._skill,
    this._address,
    this._yearOfExperience,
  );
  Employee.mobileDeveloper({
    required String name,
    required double baseSalary,
    required Address address,
    required int yearOfExperience,
  }) : _name = name,
       _baseSalary = baseSalary,
       _skill = [Skill.FLUTTER, Skill.DART],
       _address = address,
       _yearOfExperience = yearOfExperience;
  double computeSalary() {
    double totalSalary = _baseSalary;
    totalSalary += _yearOfExperience * 500;
    for (var skill in _skill) {
      if (skill == Skill.FLUTTER) {
        totalSalary += 5000;
      } else if (skill == Skill.DART) {
        totalSalary += 4000;
      } else if (skill == Skill.OTHER) {
        totalSalary += 1000;
      }
    }
    return totalSalary;
  }
  void printDetails() {
    print('Name: $_name');
    print('Base Salary: $_baseSalary');
    print('Skills: $_skill');
    print('Address: ${_address.street}, ${_address.city}, ${_address.zipCode}');
    print('Experience: $_yearOfExperience years');
  }
}
void main() {
  var empAddress = Address("6A", "Phnom penh", "82");
  // var emp1 = Employee("omra", 1000, [Skill.DART], empAddress, 10);
  // emp1.printDetails();

  var emp3 = Employee.mobileDeveloper(
    name: "ronan",
    baseSalary: 1000,
    address: empAddress,
    yearOfExperience: 10,
  );
  emp3.printDetails();
  // var emp2 = Employee('Ronan', 45000);
  // emp2.printDetails();
  print("${emp3.computeSalary()}");
}
