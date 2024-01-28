import 'dart:io';
import 'email_validator.dart';

// ! Qeydiyyatdan kecen istifadecilerin siyahisi
List<Map<String, dynamic>> registeredUsers = [];
void main() {
  Register();
}

dynamic Register() {
  print('register');
  print('----*******************----');
  print('----*******************----');
  print('----email----');
  String email;
  do {
    email = stdin.readLineSync() ?? '';
    print(email.isValidEmail());
    if (email.isValidEmail()) {
      print('----*******************----');
      print('----*******************----');
      print('Email is not valid');
    }
  } while (email.isValidEmail());
  print('----*******************----');
  print('----*******************----');
  print('----username----');
  String username = stdin.readLineSync() ?? '';

  print('----password----');
  String password = stdin.readLineSync() ?? '';
  print('----*******************----');
  print('----*******************----');
  print('----confirm password----');
  String confirmPassword;
  do {
    confirmPassword = stdin.readLineSync() ?? '';
    if (!isConfirmPassword(password, confirmPassword)) {
      print('----*******************----');
      print('----*******************----');
      print('Password is not valid');
    }
  } while (!isConfirmPassword(password, confirmPassword));

  Map<String, dynamic> user = {
    'email': email,
    'username': username,
    'password': password
  };
  registeredUsers.add(user);

  Login();
}

// bool emailValidator(String email) {
//   return email.contains('@');
// }

bool isConfirmPassword(String password, String confirmPassword) {
  return password == confirmPassword;
}

dynamic Login() {
  print('login');
  print('----*******************----');
  print('----*******************----');
  print('----email----');

  String email;
  do {
    email = stdin.readLineSync() ?? '';
    if (email.isValidEmail()) {
      print('----*******************----');
      print('----*******************----');
      print('Email is not valid');
    }
  } while (email.isValidEmail());
  print('----*******************----');
  print('----*******************----');
  print('----password----');
  String password = stdin.readLineSync() ?? '';

// ! obyektin icinde olan deyeri tapmaq ucun firstWhere() istifade edirik ve orElse() ile deyeri tapmasa bos obyekt qaytarir
  dynamic user = registeredUsers.firstWhere(
    (user) => user['email'] == email && user['password'] == password,
    orElse: () => <String, dynamic>{},
  );

  print(user);

//  ! isNotEmpty -> obyektin bos olmamasi demekdir
  if (user.isNotEmpty) {
    print('----*******************----');
    print('----*******************----');
    print('successful');
    print('----*******************----');
    print('Welcome ${user['username']}');
    return user;
  } else {
    print('----*******************----');
    print('----*******************----');
    print('Login failed: Invalid email or password.');
    return Login();
  }
}
