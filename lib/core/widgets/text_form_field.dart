import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

class CustomTextFormField extends StatefulWidget {
  final Function? validator;
  final TextInputType? keyboardType;
  final Function? onChange;
  final TextEditingController controller;
  final String? hintText;
  final String title;
  final int? maxLines;

  const CustomTextFormField({
    super.key,
    this.maxLines,
    this.validator,
    this.keyboardType,
    this.onChange,
    this.hintText,
    required this.title,
    required this.controller,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        // keyboardType: widget.keyboardType,
        keyboardType: TextInputType.multiline,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        // textAlign: TextAlign.center,
        maxLines: widget.maxLines ?? 1,
        expands: false,
        style: const TextStyle(
          color: Color(0xff707070),
          fontSize: 14,
        ),
        controller: widget.controller,
        // onFieldSubmitted: (term) {},
        // textInputAction: TextInputAction.done,
        decoration: InputDecoration(

          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 10.0,
          ),
          // isCollapsed: true,
          label: Text(widget.hintText ?? ''),
          labelStyle: const TextStyle(
            fontSize: 14,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    );
  }
}
