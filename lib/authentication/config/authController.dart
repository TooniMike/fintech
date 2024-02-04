// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:fintech/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/common/widgets/all_widgets.dart';
import '../utils/functions.dart';

register(BuildContext context, String username, String email,
    String password) async {
  if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
    //Check for email domain
    bool emailAllowed = checkEmailDomain(email);

    if (!emailAllowed) {
      // Email domain check
      alert(context, 'error', 'Email domain is not allowed');
      return;
    }

    String? emailValidation = validateEmail(email);

    if (emailValidation != null) {
      // Email not valid
      alert(context, 'error', emailValidation);
      return;
    }

    if (emailAllowed) {
      String? passwordValidation = validatePassword(password);

      if (passwordValidation != null) {
        // Password is not valid, show error message and return
        alert(context, 'error', passwordValidation);
        return;
      }

      progressIndicator(context, message: 'Creating account');

      // Declaration of LocalStorage and saving of email
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('email', email);
      final url = Uri.parse(
          "https://crypto-wallet-server.mock.beeceptor.com/api/v1/register");

      try {
        // Create a Map with the parameters
        Map<String, String> body = {
          'email': email,
          'password': password,
          'username': username,
        };

        // Encode the parameters to JSON
        String jsonBody = json.encode(body);

        // Make the POST request
        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonBody,
        );

        // Check if the request was successful (status code 200)
        if (response.statusCode == 200) {
          alert(context, 'success', 'success');
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
        } else {
          alert(context, 'error', 'An error occured please try again later');
        }
      } catch (error) {
        alert(context, 'error', 'An error occured please try again later');
        Navigator.of(context).pop();
      }
    }
  }
}

login(
  BuildContext context,
  String email,
  String password,
) async {
  // try {
  if (email != '' && password != '') {
    bool emailAllowed = checkEmailDomain(email);
    if (!emailAllowed) {
      // Email domain check
      alert(context, 'error', 'Email domain is not allowed');
      return;
    }

    String? emailValidation = validateEmail(email);

    if (emailValidation != null) {
      // Email not valid
      alert(context, 'error', 'Weak internet connection');
      return;
    }

    progressIndicator(context, message: 'Authenticating');

    final url = Uri.parse(
        'https://crypto-wallet-server.mock.beeceptor.com/api/v1/login');
    try {
      Map<String, String> body = {
        'email': email,
        'password': password,
      };

      // Encode the parameters to JSON
      String jsonBody = json.encode(body);

      // Make the POST request
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonBody,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      } else {
        alert(context, 'error', 'An error occured please try again later');
      }
    } catch (error) {
      alert(context, 'error', 'Weak internet connection');
      Navigator.of(context).pop();
    }
  }
}














// login(BuildContext context, String email, String password,
//     bool rememberMe) async {
//   // try {
//   if (email != '' && password != '') {
//     bool emailAllowed = checkEmailDomain(email);
//     if (!emailAllowed) {
//       // Email domain check
//       alert(context, 'error', 'Email domain is not allowed');
//       return;
//     }

//     String? emailValidation = validateEmail(email);

//     if (emailValidation != null) {
//       // Email not valid
//       alert(context, 'error', emailValidation);
//       return;
//     }
//     if (emailAllowed) {
//       String? passwordValidation = validatePassword(password);

//       if (passwordValidation != null) {
//         // Password is not valid, show error message and return
//         alert(context, 'error', passwordValidation);
//         return;
//       }
//       // final prefs = await SharedPreferences.getInstance();

//       progressIndicator(context, message: 'Authenticating');

//       final response = await http.post(Uri.parse('$baseUrl/login'),
//           body: jsonEncode({
//             'email': email,
//             'rememberMe': rememberMe.toString(),
//             'password': password,
//           }),
//           headers: {
//             'Accept': 'application/json',
//             'Content-Type': 'application/json',
//           });

//       try {
//         if (response.statusCode == 200) {
//           final prefs = await SharedPreferences.getInstance();
//           final Map<String, dynamic> responseBody = json.decode(response.body);

//           // Save token and user details to local storage
//           prefs.setString('token', responseBody['token']);
//           prefs.setString('userDetails', json.encode(responseBody['user']));
//           prefs.setBool('isLoggedIn', true);
//           // Set the user data in UserProvider
//           final UserProvider userProvider = Get.find<UserProvider>();
//           final User user = User.fromJson(responseBody['user']);
//           userProvider.setUser(user);

//           print('Token saved: ${prefs.getString('token')}');
//           print('User details saved: ${prefs.getString('userDetails')}');

//           // Save credentials if rememberMe is true
//           if (rememberMe) {
//             prefs.setString('email', email);
//             prefs.setString('password', password);
//           } else {
//             // Clear credentials if rememberMe is false
//             prefs.remove('email');
//             prefs.remove('password');
//           }

//           bool isVerified = responseBody['user']['isVerified'] ?? false ?? '';
//           Get.back(); // Close the progress indicator

//           if (!isVerified) {
//             // If user is not verified or isVerified is not present, navigate to the verification page
//             Get.to(const VerificationPage());
//           } else {
//             // Navigate to the Navbar screen
//             alert(context, 'success', responseBody['message']);
//             Get.off(const Navbar());
//           }
//         } else {
//           final Map<String, dynamic> responseBody = json.decode(response.body);
//           Get.back(); // Close the progress indicator
//           alert(context, 'error', responseBody['message']);
//         }
//       } catch (e) {
//         // Get.back();
//         if (response.statusCode == 400) {
//           final Map<String, dynamic> responseBody = json.decode(response.body);
//           final List<dynamic> errorDetails = responseBody['errorDetails'];

//           if (errorDetails != null && errorDetails.isNotEmpty) {
//             // Extract the first error detail message
//             final errorMessage = errorDetails[0]['message'];
//             alert(context, 'error', errorMessage);
//             return;
//           }
//         } else if (response.statusCode == 401) {
//           final Map<String, dynamic> responseBody = json.decode(response.body);
//           if (responseBody.containsKey('error')) {
//             // Handle the case where the API returns a specific error message
//             final errorMessage = responseBody['error'];
//             alert(context, 'error', errorMessage);
//           } else {
//             // If the error is not related to a specific error message, show a generic error message
//             // alert(context, 'error', 'Invalid email or password');
//           }
//           return;
//         }

//         // If the error is not related to password length, show a generic error message
//         alert(context, 'error',
//             'Whoops! Something went wrong, please contact support');
//         throw Exception(e);
//       }
//     } else {
//       alert(context, 'error', 'Email domain is not allowed');
//     }
//   } else {
//     alert(context, 'error', 'All fields are required');
//   }
// }


//Logout Clears all what we stored in the local and routes to the loginScreen
// logout() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.clear();
//   Get.to(const LoginScreen());
// }