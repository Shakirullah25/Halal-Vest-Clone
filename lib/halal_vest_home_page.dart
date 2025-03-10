import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'build_login_option.dart';
import 'elevated_button.dart';

class HalalVestHomePage extends StatefulWidget {
  const HalalVestHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HalalVestHomePageState createState() => _HalalVestHomePageState();
}

class _HalalVestHomePageState extends State<HalalVestHomePage> {
  final List<String> images = [
    "lib/assets/images/muslim-beauty.jpg",
    "lib/assets/images/sedekah-subuh.jpg",
    "lib/assets/images/Hijjab sis press phone.png",
    "lib/assets/images/growing money cool.webp",
    "lib/assets/images/Halal img.jpg",
  ];
  int currentIndex = 0;
  late Timer timer;
  late PageController pageController;
  String? selectedLogin;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentIndex);
    timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % images.length;
        pageController.animateToPage(
          currentIndex,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  void updateSelectedLogin(String login) {
    setState(() {
      selectedLogin = login;
    });
  }

  @override
  void dispose() {
    timer.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.asset(
                images[index],
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              );
            },
          ),

          // Logo section
          Positioned(
            top: 20,
            left: 16,
            child: Builder(
              builder: (context) {
                double logoSize = MediaQuery.of(context).size.width *
                    0.15; // 15% of the screen width
                return Image.asset(
                  "lib/assets/images/HalalVest logo.png",
                  width: logoSize,
                  height: logoSize,
                );
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Welcome",
                  style: GoogleFonts.inter(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Choose a way to login",
                  style: GoogleFonts.inter(
                    fontSize: 11.5,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => updateSelectedLogin("Individual"),
                      child: buildLoginOption(
                        Icons.person_4_sharp,
                        "Individual Login",
                        selectedLogin == "Individual",
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => updateSelectedLogin("Agent"),
                      child: buildLoginOption(
                        Icons.support_agent_rounded,
                        "Agent Login",
                        selectedLogin == "Agent",
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => updateSelectedLogin("Merchant"),
                child: buildLoginOption(
                  Icons.store_mall_directory,
                  "Merchant Login",
                  selectedLogin == "Merchant",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => updateSelectedLogin("Staff"),
                      child: buildLoginOption(
                        Icons.people,
                        "Staff Login",
                        selectedLogin == "Staff",
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => updateSelectedLogin("Aggregator"),
                      child: buildLoginOption(
                        Icons.group_work,
                        "Aggregator Login",
                        selectedLogin == "Aggregator",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: LayoutBuilder(builder: (context, constraints) {
                double buttonWidth = constraints.maxWidth;
                // Elevated button
                return elevatedButton(buttonWidth, selectedLogin);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
