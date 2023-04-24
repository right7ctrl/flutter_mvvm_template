import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  final bool isDate;
  final void Function(DateTime date)? onDateSelect;
  final String? Function(String? val)? validator;
  final TextEditingController? controller;
  final bool isPassword;
  final String? label;
  const AuthTextFormField({
    super.key,
    this.label,
    this.controller,
    this.isPassword = false,
    this.isDate = false,
    this.validator,
    this.onDateSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: TextFormField(
        validator: validator,
        onTap: () async {
          if (isDate) {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );

            onDateSelect!(date!);
            controller!.text = date.toString();
          }
        },
        controller: controller,
        obscureText: isPassword,
        readOnly: isDate,
        style: const TextStyle(color: Colors.white),
        cursorColor: Color(0xffF98A44),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xff2E3239),
          labelText: label,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: Color(0xffF98A44),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}