import 'package:fintech/authentication/pages/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fintech/authentication/config/authController.dart';
import 'package:flutter/gestures.dart';
import '../../core/common_widgets/all_widgets.dart';
import '../utils/socials.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

    bool _obscurePassword = true;
  bool _obscurePassword1 = true;

   String? passwordValidationError;
bool switchValue = false;
   final TextEditingController nameController = TextEditingController();
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();

    void password() {
    setState(() {
      _obscurePassword1 = _obscurePassword1;
    });
  }


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
                'Login',
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
                        text: "Don't have an account already? ",
                      ),
                      TextSpan(
                        text: "Sign Up",
                        style: const TextStyle(
                          color: Color(0xFF17288E),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => const RegistrationPage()),
                            );
                        },
                      ),
                    ],
                  ),
                ),
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
               Row(
                 children: [
                   Transform.scale(
                     scale: 0.7,
                     child: Switch(
                       value: switchValue,
                       activeColor: Colors.green,
                       inactiveTrackColor: const Color.fromARGB(255, 14, 13, 13),
                       inactiveThumbColor: Colors.white,
                       materialTapTargetSize: MaterialTapTargetSize.padded,
                       trackOutlineColor: MaterialStateProperty
                           .resolveWith(
                               (states) => Colors.transparent),
                       overlayColor: MaterialStateProperty.resolveWith(
                               (states) => Colors.transparent),
                       onChanged: (value) {
                         setState(() {
                           switchValue = value;
                         });
                         print(value);
                       },
                     ),
                   ),
                   const Text(
                     "Remember me",
                     style:
                     TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                   ),
                   const Spacer(),
                   const Text(
                     "Forgot Password?",
                     style: TextStyle(
                       fontSize: 14,
                       decoration: TextDecoration.none,
                       fontWeight: FontWeight.bold,
                       color: Colors.black,
                     ),
                   ),
                   const SizedBox(
                     height: 20,
                   )
                 ],
               ),
                  
                  
              const WhiteSpace(height: 40),
              GestureDetector(
                onTap: () {
                   final email = emailController.text.trim();
                  final password = passwordController.text.trim();
                  if(email.isNotEmpty && password.isNotEmpty){
                    login(
                        context, email, password);
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
                    'Login',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16.sp),
                  )),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 40.h),
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