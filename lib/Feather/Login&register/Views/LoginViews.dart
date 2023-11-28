import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Login&register/Views/RegisterScreen.dart';
import 'package:flutter_application_1/Feather/Login&register/Widget/customButton.dart';
import 'package:flutter_application_1/Feather/Login&register/Widget/textFaildLogin.dart';
import 'package:flutter_application_1/Feather/Login&register/mangment/LoginBloc.dart';
import 'package:flutter_application_1/Feather/Login&register/mangment/LoginState.dart';
import 'package:flutter_application_1/core/Constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScrren extends StatelessWidget {
  LoginScrren({super.key});

  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * 0.25,
                        ),
                        Text(
                          "LOGIN",
                          style: GoogleFonts.padauk(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "ConncationWitheFrinds",
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
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        textFaildLogin(
                          onPressedicon: () {
                            LoginBloc.get(context).changepassWord();
                          },
                          obscureText: LoginBloc.get(context).obscureText,
                          name: "Password",
                          prefixIcon: Icons.lock_outline,
                          controller: passWordController,
                          hintText: "***",
                          suffixIcon: LoginBloc.get(context).icon,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {},
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
                            text: "LOGIN",
                            height: 50,
                            onTap: () {
                              formKey.currentState?.validate();
                            }),
                        SizedBox(
                          height: size.height * 0.03,
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
                                navigatTo(
                                    navig: const RegisterScreen(),
                                    context: context);
                              },
                              child: Text(
                                "Registre",
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
        },
      ),
    );
  }
}
