bool checkEmailDomain(String email) {
  if (email.endsWith('@gmail.com') ||
      email.endsWith('@hotmail.com') ||
      email.endsWith('@yahoo.com')) {
    return true;
  } else {
    return true;
  }
}

//Password Validator
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  } else if(value.length < 8){
    return 'Password must be atleast 8 character';
  }

  return null; // Password is valid
}

// Function to validate email
String? validateEmail(String email) {
  final RegExp emailRegex =
      RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');

  if (!emailRegex.hasMatch(email)) {
    return 'Invalid email format';
  }

  return null;  // Email is valid
}
