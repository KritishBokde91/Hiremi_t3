import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String hText;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.title,
    required this.hText, required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    widget.controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.05),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: width * 0.04,
              ),
            ),
          ),
        ),
        SizedBox(height: height * 0.01),
        SizedBox(
          width: width * 0.9,
          child: TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            decoration: InputDecoration(
              hintText: widget.hText,
              hintStyle: TextStyle(
                fontSize: width * 0.03,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
              suffixIcon: const Icon(
                Icons.edit_outlined,
                color: Color(0xFF0F3CC9),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
