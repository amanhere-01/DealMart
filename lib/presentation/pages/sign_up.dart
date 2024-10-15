import 'package:deal_mart/presentation/pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/auth_text_field.dart';
import 'home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String validate(){
    if(nameController.text.isEmpty) return 'Name';
    if(emailController.text.isEmpty) return 'Email';
    if(passwordController.text.isEmpty) return 'Password';
    return 'null';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/6),
                    child: const Text('Welcome To !DealMart',
                      style: TextStyle(
                          fontSize: 30,
                          color: Color.fromRGBO(39, 95, 96, 1),
                          fontWeight: FontWeight.bold
                      ),)
                ),
                const SizedBox(height: 10,),
                LayoutBuilder(
                  builder: (context, constraints) {
                    bool isPhone = constraints.maxWidth < 600 ? true : false;
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      width: !isPhone ? MediaQuery.of(context).size.width * 2/3 : null,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.3),
                                Colors.white.withOpacity(0.1)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Create new account',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            const SizedBox(height: 40,),
                            AuthTextField(hint: 'Name', controller:nameController,isObscure: false, icon: Icons.person_2_outlined,),
                            const SizedBox(height: 20,),
                            AuthTextField(hint: 'Email', controller:emailController,isObscure: false, icon: Icons.email_outlined,),
                            const SizedBox(height: 20,),
                            AuthTextField(hint: 'Password', controller:passwordController,isObscure: true, icon: Icons.lock_outline,),
                            const SizedBox(height: 40,),
                            ElevatedButton(
                                onPressed: (){
                                  String emptyField = validate();
                                  if(emptyField=='null'){
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);
                                    Fluttertoast.showToast(
                                      msg: 'Signed In',
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('$emptyField is empty!'))
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(MediaQuery.of(context).size.width,60),
                                    backgroundColor: const Color.fromRGBO(39, 95, 96, 1),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                                ),
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500
                                  ),
                                )
                            ),
                            const SizedBox(height: 5,),

                          ],
                        ),
                      )
                    );
                  }

                ),
                const SizedBox(height: 5,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignIn()));
                  },
                  child: RichText(
                    text: TextSpan(
                        text: 'Already have an account? ',
                        style:Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.black54
                        ),
                        children: const [
                          TextSpan(
                              text: 'Log In',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(39, 95, 96, 1),
                                  decoration: TextDecoration.underline
                              )
                          )
                        ]
                    ),
                  ),
                ),
                const SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}