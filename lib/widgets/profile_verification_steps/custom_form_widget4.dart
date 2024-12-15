import 'package:flutter/material.dart';

import '../custom_text_field.dart';

class CustomFormWidget4 extends StatefulWidget {
  final Function(bool, int) onContinue;

  const CustomFormWidget4({super.key, required this.onContinue});

  @override
  State<CustomFormWidget4> createState() => _ReviewDetailsFormState();
}

class _ReviewDetailsFormState extends State<CustomFormWidget4> {
  final TextEditingController _collegeNameController = TextEditingController();
  final TextEditingController _collegeStateController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _degreeController = TextEditingController();
  final TextEditingController _passoutYearController = TextEditingController();
  bool _isValid = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.01),
        Padding(
          padding: EdgeInsets.only(left: width * 0.05),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Review and Verify your details',
              style: TextStyle(
                fontSize: width * 0.05,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF0F3CC9),
              ),
            ),
          ),
        ),
        SizedBox(height: height * 0.02),
        CustomTextField(title: 'College Name', hText: "St John's University", controller: _collegeNameController,),
        SizedBox(height: height * 0.02),
        CustomTextField(title: "College's State", hText: 'Kolkata', controller: _collegeStateController,),
        SizedBox(height: height * 0.02),
        CustomTextField(title: "Branch", hText: 'Computer Science', controller: _branchController,),
        SizedBox(height: height * 0.02),
        CustomTextField(title: "Degree", hText: 'Bachelor Degree', controller: _degreeController,),
        SizedBox(height: height * 0.02),
        CustomTextField(title: "Passout Year", hText: '2022', controller: _passoutYearController,),
        SizedBox(height: height * 0.05),
        Center(
          child: ElevatedButton(
            onPressed: _handleContinue,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F3CC9),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: Size(width * 0.8, height * 0.06),
            ),
            child: const Text('Review and next', style: TextStyle(fontSize: 16)),
          ),
        ),
        SizedBox(height: height * 0.02),
      ],
    );
  }

  void _handleContinue() {
    if (_collegeNameController.text.isEmpty ||
        _collegeStateController.text.isEmpty ||
        _branchController.text.isEmpty ||
        _degreeController.text.isEmpty ||
        _passoutYearController.text.isEmpty) {
      setState(() {
        _isValid = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('All fields must be filled!'),
          backgroundColor: Colors.red,
        ),
      );
      widget.onContinue(false, 3);
    } else {
      setState(() {
        _isValid = true;
      });
      widget.onContinue(true, 4);
    }
  }

  @override
  void dispose() {
    _collegeStateController.dispose();
    _collegeNameController.dispose();
    _branchController.dispose();
    _degreeController.dispose();
    _passoutYearController.dispose();
    super.dispose();
  }
}