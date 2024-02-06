// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:fintech/authentication/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/common_widgets/all_widgets.dart';
import '../../presentations/all_pages.dart';
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
            MaterialPageRoute(builder: (_) => const LoginPage()),
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
      alert(context, 'error', emailValidation);
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
      alert(context, 'error', 'Error: $error');
      Navigator.of(context).pop();
    }
  }
}
