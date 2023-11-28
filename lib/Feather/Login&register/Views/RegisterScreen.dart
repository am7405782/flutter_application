import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Login&register/Views/LoginViews.dart';
import 'package:flutter_application_1/Feather/Login&register/Widget/customButton.dart';
import 'package:flutter_application_1/Feather/Login&register/Widget/textFaildLogin.dart';
import 'package:flutter_application_1/Feather/Login&register/mangment/LoginBloc.dart';
import 'package:flutter_application_1/core/Constant.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passWordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.2,
                  ),
                  Text(
                    "Register",
                    style: GoogleFonts.padauk(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "CreatNewAccount..",
                    style: GoogleFonts.padauk(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: size.height * 0.030,
                  ),
                  textFaildLogin(
                    onPressedicon: () {},
                    name: "Name",
                    prefixIcon: Icons.email_outlined,
                    controller: emailController,
                    hintText: "Ahmed Mohmed",
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {},
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Pleas enter name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.030,
                  ),
                  textFaildLogin(
                    onPressedicon: () {},
                    name: "Email",
                    prefixIcon: Icons.email_outlined,
                    controller: emailController,
                    hintText: "...@_.com",
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {},
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Pleas enter email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  textFaildLogin(
                    onPressedicon: () {},
                    name: "Phone",
                    prefixIcon: Icons.email_outlined,
                    controller: emailController,
                    hintText: "01010657674",
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {},
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Pleas enter email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  textFaildLogin(
                    onPressedicon: () {},
                    obscureText: true,
                    name: "Password",
                    prefixIcon: Icons.lock_outline,
                    controller: passWordController,
                    hintText: "***",
                    suffixIcon: Icons.visibility_off_outlined,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      LoginBloc.get(context).obscureText = false;
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Pleas enter password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  customButton(
                      text: "Register",
                      height: 50,
                      onTap: () {
                        formKey.currentState?.validate();
                      }),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Row(
                    children: [
                      Text(
                        "CreatNewAccount ?",
                        style: GoogleFonts.padauk(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          navigatTo(navig: LoginScrren(), context: context);
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.padauk(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
