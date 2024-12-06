import 'package:flutter/material.dart';
import 'package:hiremi_t3/widgets/custombottombar.dart';

import '../widgets/gradient_text.dart';

class ProfileVerificationScreen extends StatefulWidget {
  final int currentIndex;
  const ProfileVerificationScreen({super.key, required this.currentIndex});

  @override
  State<ProfileVerificationScreen> createState() =>
      _ProfileVerificationScreenState();
}

class _ProfileVerificationScreenState extends State<ProfileVerificationScreen> {
  late int realIndex;
  @override
  void initState() {
    super.initState();
    realIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Profile Verification',
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
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(Icons.notifications),
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
            Image.asset('assets/images/profile_verification_icon.png'),
            SizedBox(
              height: size.height * 0.02,
            ),
            const GradientText('Verification in Progress',
                gradient: LinearGradient(colors: [
                  Color(0xFF163EC8),
                  Color(0xFF0870FF),
                  Color(0xFF378EFF),
                  Color(0xFF89C1FF),
                ]),
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            SizedBox(
              height: size.height * 0.02,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    text:
                        'Our team is currently verifying your profile, and this\n',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF163EC8)),
                    children: [
                      TextSpan(
                          text:
                              'process typically takes between 12 to 36 hours.')
                    ])),
            SizedBox(
              height: size.height * 0.02,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    text:
                        "Once the verification is complete, you'll have full\n",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF163EC8)),
                    children: [TextSpan(text: 'access to the application')])),
            SizedBox(
              height: size.height * 0.04,
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              width: size.width * 0.7,
              child: Divider(
                thickness: 22,
                color: Colors.grey[300],
              ),
            ),
            Image.asset('assets/images/profile_verification_icon2.png')
          ],
        ),
      ),
      bottomNavigationBar: Custombottombar(
          currentIndex: realIndex,
          onTabSelected: (index) => setState(() {
                realIndex = index;
              })),
    );
  }
}
