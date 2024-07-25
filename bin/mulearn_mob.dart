import 'dart:io';

void main() {
  // Collect user information
  stdout.write("Enter your name: ");
  String name = stdin.readLineSync() ?? '';

  stdout.write("Enter your phone number: ");
  String phoneNumber = stdin.readLineSync() ?? '';

  stdout.write("Enter your age: ");
  int age = int.parse(stdin.readLineSync() ?? '0');

  stdout.write("Enter your height (in cm): ");
  double height = parseInputAsDoubleOrInt(stdin.readLineSync() ?? '0');

  stdout.write("Enter your weight (in kg): ");
  double weight = parseInputAsDoubleOrInt(stdin.readLineSync() ?? '0');

  stdout.write("Enter your address: ");
  String address = stdin.readLineSync() ?? '';

  stdout.write("Enter your hobbies (separate each hobby with a comma): ");
  List<String> hobbies = stdin.readLineSync()?.split(',').map((hobby) => hobby.trim()).toList() ?? [];

  // Generate biodata
  String biodata = generateBiodata(name, phoneNumber, age, height, weight, address, hobbies);

  // Print the formatted biodata
  print("\n=========== Your Biodata ===========\n");
  print(biodata);
  print("====================================");
}

double parseInputAsDoubleOrInt(String input) {
  // Try to parse input as double
  try {
    return double.parse(input);
  } catch (e) {
    // If it fails, try to parse as int and convert to double
    return double.parse(int.parse(input).toString());
  }
}

String generateBiodata(String name, String phoneNumber, int age, double height, double weight, String address, List<String> hobbies) {
  String hobbiesFormatted = hobbies.join(', ');

  return '''
╔════════════════════════════════════════╗
║ Name:        $name
║ Phone:       $phoneNumber
║ Age:         $age years
║ Height:      ${height.toStringAsFixed(2)} cm
║ Weight:      ${weight.toStringAsFixed(2)} kg
║ Address:     $address
║ Hobbies:     $hobbiesFormatted
╚════════════════════════════════════════╝
  ''';
}
