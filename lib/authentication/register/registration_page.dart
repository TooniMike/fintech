import 'package:fintech/authentication/config/authController.dart';
import 'package:fintech/authentication/login/login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/common/widgets/all_widgets.dart';
import '../../core/common/widgets/custom_text_form_field.dart';
import '../utils/functions.dart';
import '../utils/socials.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  bool _obscurePassword = true;
  bool _obscurePassword1 = true;

   String? passwordValidationError;

   final TextEditingController nameController = TextEditingController();
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();

    void password() {
    setState(() {
      _obscurePassword1 = _obscurePassword1;
    });
  }

  
  bool isPasswordValid(String password) {
    final RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\-]).*$',
    );
    return passwordRegex.hasMatch(password);
  }

  bool isPasswordBeingEdited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ListView(
        children: [
          const WhiteSpace(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Align(
                alignment: Alignment.topLeft, child: Icon(Icons.arrow_back)),
          ),
          const WhiteSpace(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Create your new account',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black45,
                    ),
                    children: [
                      const TextSpan(
                        text: "Have an account already? ",
                      ),
                      TextSpan(
                        text: "Log In",
                        style: const TextStyle(
                          color: Color(0xFF17288E),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => const LoginPage()),
                            );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const WhiteSpace(height: 20),
             
              CustomTextFormField(
                autofocus: true,
                labelText: 'Username',
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: nameController,
              ),
              const WhiteSpace(height: 20),
              CustomTextFormField(
               labelText: 'Email',
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
              ),

              const WhiteSpace(height: 20),
               CustomTextFormField(
                 labelText: 'Password',
                 controller: passwordController,
                 obscureText: _obscurePassword,
                 textInputAction: TextInputAction.done,
                 keyboardType: TextInputType.visiblePassword,
                 validator: (value) {
                   passwordValidationError = validatePassword(value);
               return null; 
                 },
                 suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                      ),
                    ),
               ), 
                  Text(
                      'Password must contain at least 8 characters long and contain one uppercase, lowercase, number, and symbol',
                      style: TextStyle(color: Colors.red, fontSize: 12.sp),
                    ),
                  
              const WhiteSpace(height: 40),
              GestureDetector(
                onTap: () {
                   final email = emailController.text.trim();
                  final password = passwordController.text.trim();
                  final userName = nameController.text.trim();
                  if(email.isNotEmpty && password.isNotEmpty && userName.isNotEmpty){
                    register(
                        context, userName, email, password);
                  } else {
                    alert(context, 'error', "All fields must be filled");
                  }
                },
                child: Container(
                  height: 60.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      color: const Color(0xFF1C265C)),
                  child: Center(
                      child: Text(
                    'Start banking',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16.sp),
                  )),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: const Socials(),
              ),
              const WhiteSpace(height: 10),
            ],
          ),
        ],
      ),
    ));
  }
}
