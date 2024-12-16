import 'package:flutter/material.dart';

class CustomFormWidget1 extends StatefulWidget {
  final Function(bool, int)
      onComplete;

  const CustomFormWidget1({super.key, required this.onComplete});

  @override
  State<CustomFormWidget1> createState() => _CustomFormWidgetState();
}

class _CustomFormWidgetState extends State<CustomFormWidget1> {
  bool _isformCompleted = false;
  final _birthStateController = TextEditingController();
  final _birthCityController = TextEditingController();
  final _pincodeController = TextEditingController();
  bool isDifferentlyAbled = false;

  void _validateFields() {
    if (_birthStateController.text.isNotEmpty &&
        _birthCityController.text.isNotEmpty &&
        _pincodeController.text.isNotEmpty) {
      widget.onComplete(true, 1);
      _isformCompleted = true;
      setState(() {

      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Fields are complete! Proceeding...")),
      );
    } else {
      widget.onComplete(false, 0);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please complete all fields!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.01),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Personal Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xff0F3CC9),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _birthStateController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xff0056D6)),
                    ),
                    labelText: 'Birth State',
                    hintText: 'eg: West Bengal',
                    labelStyle: const TextStyle(
                      color: Color(0xff0F3CC9),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _birthCityController,
                  decoration: InputDecoration(
                    labelText: 'Birth City',
                    hintText: 'eg: Kolkata',
                    labelStyle: const TextStyle(
                      color: Color(0xff0F3CC9),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xff0056D6)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: InputDecorator(
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Are you differently abled?',
                        contentPadding: EdgeInsets.symmetric(vertical: size.height * 0.005),
                        labelStyle: const TextStyle(
                          color: Color(0xff0F3CC9),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.blue),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          value: false,
                          groupValue: isDifferentlyAbled,
                          onChanged: (value) {
                            setState(() {
                              isDifferentlyAbled = value as bool;
                            });
                          },
                        ),
                        const Text("No"),
                        Radio(
                          value: true,
                          groupValue: isDifferentlyAbled,
                          onChanged: (value) {
                            setState(() {
                              isDifferentlyAbled = value as bool;
                            });
                          },
                        ),
                        const Text("Yes"),
                      ],
                    )),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _pincodeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Current Pincode',
                    hintText: 'eg: 502032',
                    labelStyle: const TextStyle(
                      color: Color(0xff0F3CC9),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xff0056D6)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (!_isformCompleted)
            const Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text(
                ' Required fields are incomplete.\nFill them out to move forward. ',
                style: TextStyle(
                    color: Color(0xffC90F0F),
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          SizedBox(height: size.height * 0.08),
          ElevatedButton(
            onPressed: _validateFields,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff0F3CC9),
              minimumSize: Size(size.width * 0.7, size.height * 0.06),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Continue',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
