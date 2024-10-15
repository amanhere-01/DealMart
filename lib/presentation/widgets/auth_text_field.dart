import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isObscure;
  final IconData icon;
  const AuthTextField({super.key, required this.hint, required this.controller, required this.isObscure, required this.icon});

  @override
  Widget build(BuildContext context) {
     borderDesign() => OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hint,
          style: const TextStyle(
              fontSize: 18,
              color: Colors.black54
          ),
        ),
        const SizedBox(height: 8,),
        TextField(
          controller: controller,
          cursorColor: Colors.black54,
          obscureText: isObscure,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            prefixIconColor: const Color.fromRGBO(39, 95, 96, 1),
            enabledBorder: borderDesign(),
            focusedBorder: borderDesign(),
          ),
        )
      ],
    );
  }
}
