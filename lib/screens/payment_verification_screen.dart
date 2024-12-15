import 'package:flutter/material.dart';
import 'package:hiremi_t3/screens/profile_verification_screen.dart';
import 'package:hiremi_t3/widgets/custombottombar.dart';

class PaymentVerificationScreen extends StatefulWidget {
  const PaymentVerificationScreen({super.key});

  @override
  State<PaymentVerificationScreen> createState() =>
      _PaymentVerificationScreenState();
}

class _PaymentVerificationScreenState extends State<PaymentVerificationScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Payment & Verification',
          style: TextStyle(fontSize: 18),
        ),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Image.asset('assets/images/menu_icon.png'),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Stack(
              children: [
                const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                Positioned(
                  top: size.height * 0.001,
                  right: size.width * 0.008,
                  child: Container(
                    height: size.height * 0.015,
                    width: size.width * 0.033,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.5),
                        color: const Color(0xFFDBE4FF)),
                    child: Center(
                        child: Text(
                          '3',
                          style:
                          TextStyle(fontSize: size.width * 0.023, fontWeight: FontWeight.bold, color: const Color(0xFF0F3CC9)),
                        )),
                  ),
                )
              ],
            ),
          )
        ],
        centerTitle: true,
      ),
      drawer: const Drawer(
        backgroundColor: Colors.white,
        child: Center(
          child: Text('Drawer'),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/payment_icon.png'),
          SizedBox(
            height: size.height * 0.06,
          ),
          Image.asset('assets/images/verified.png'),
          SizedBox(
            height: size.height * 0.025,
          ),
          RichText(
              text: TextSpan(
                  text: 'Payment Successful\n',
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF163EC8)),
                  children: [
                TextSpan(
                    text: 'your profile is under verification.',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: size.height * 0.003,
                        color: const Color(0xFF163EC8)))
              ])),
          SizedBox(
            height: size.height * 0.09,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProfileVerificationScreen(currentIndex: currentIndex),
                    ));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F3CC9),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.58))),
              child: const Text(
                'Continue',
                style: TextStyle(
                    fontSize: 13.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ))
        ],
      )),
      bottomNavigationBar: Custombottombar(
          currentIndex: currentIndex,
          onTabSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          }),
    );
  }
}
