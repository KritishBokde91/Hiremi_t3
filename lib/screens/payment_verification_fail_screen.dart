import 'package:flutter/material.dart';
import 'package:hiremi_t3/screens/payment_verification_screen.dart';
import 'package:hiremi_t3/widgets/custom_drawer.dart';
import 'package:hiremi_t3/widgets/custombottombar.dart';

class PaymentVerificationFailScreen extends StatefulWidget {
  const PaymentVerificationFailScreen({super.key});

  @override
  State<PaymentVerificationFailScreen> createState() =>
      _PaymentFailureScreenState();
}

class _PaymentFailureScreenState extends State<PaymentVerificationFailScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const CustomDrawer(),
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Profile Verification",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          centerTitle: true,
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
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/payment_failed.png',
              ),
            ),
            SizedBox(height: size.height * 0.04),
            const Text(
              "Your payment was not\nsuccessful. Please try again",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFEE3322),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            const Text(
              "We encountered an issue with your payment\nPlease try again",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0F3CC9),
                fontSize: 14,
              ),
            ),
            SizedBox(height: size.height * 0.06),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentVerificationScreen(),
                    ));
              },
              icon: const Icon(Icons.refresh, color: Colors.white),
              label: const Text(
                "Try again",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0F3CC9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Custombottombar(
            currentIndex: currentIndex,
            onTabSelected: (index) => setState(() {
                  currentIndex = index;
                })));
  }
}
