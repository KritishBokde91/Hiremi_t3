import 'package:flutter/material.dart';
import 'package:hiremi_t3/widgets/custom_text_field.dart';

class CustomFormWidget5 extends StatefulWidget {
  final Function(bool, int) onProceed;

  const CustomFormWidget5({super.key, required this.onProceed});

  @override
  State createState() => _ContactDetailsFormState();
}

class _ContactDetailsFormState extends State<CustomFormWidget5> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();

  bool _showWarning = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.01),
        Padding(
          padding: EdgeInsets.only(left: width * 0.05),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Contact details',
              style: TextStyle(
                fontSize: width * 0.05,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF0F3CC9),
              ),
            ),
          ),
        ),
        SizedBox(height: height * 0.02),
        CustomTextField(
          title: "Email",
          controller: _emailController,
          hText: 'example@gmail.com',
        ),
        SizedBox(height: height * 0.02),
        CustomTextField(
          title: "Contact number",
          controller: _contactController,
          hText: '00000 00000',
        ),
        SizedBox(height: height * 0.02),
        Padding(
          padding: EdgeInsets.only(left: width * 0.05),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'WhatsApp Number',
              style: TextStyle(
                fontSize: width * 0.05,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF0F3CC9),
              ),
            ),
          ),
        ),
        SizedBox(height: height * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.01),
          child: TextField(
            controller: _whatsappController,
            autofocus: false,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                borderSide: BorderSide(color: Colors.blue, width: 0.2)
              ),
              errorBorder: _whatsappController.text.isEmpty ? const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  borderSide: BorderSide(color: Color(0xFFC1272D))
              ) : null,
              hintText: '00000 00000',
              label: const Text('WhatsApp number'),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
          ),
        ),
        SizedBox(height: height * 0.03),
        if (_showWarning)
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: const Text(
                'Required fields are incomplete.\nFill them out to move forward.',
                style: TextStyle(
                  color: Color(0xFFC90F0F),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        SizedBox(height: height * 0.04),
        Center(
          child: ElevatedButton(
            onPressed: _handleReviewAndNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F3CC9),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: Size(width * 0.8, height * 0.06),
            ),
            child: const Text('Review and Next', style: TextStyle(fontSize: 16)),
          ),
        ),
        SizedBox(height: height * 0.01),
      ],
    );
  }

  void _handleReviewAndNext() {
    if (_emailController.text.isEmpty &&
        _contactController.text.isEmpty &&
        _whatsappController.text.isEmpty) {
      setState(() {
        _showWarning = true;
      });
      widget.onProceed(false, 3);
    } else {
      setState(() {
        _showWarning = false;
      });

      if (_emailController.text.isEmpty) {
        _showSnackbar('Email is required!');
      } else if (_contactController.text.isEmpty) {
        _showSnackbar('Contact number is required!');
      } else if (_whatsappController.text.isEmpty) {
        _showSnackbar('WhatsApp number is required!');
      } else {
        widget.onProceed(true, 5);
      }
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _contactController.dispose();
    _whatsappController.dispose();
    super.dispose();
  }
}