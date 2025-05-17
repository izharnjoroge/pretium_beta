import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../utils/constants.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd() {
    Get.offNamed('/login');
  }

  List<PageViewModel> _buildPageList() {
    return [
      PageViewModel(
        title: "Direct Pay",
        body: "Pay with crypto across Africa effortlessly",
        image: Center(
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(Icons.credit_card,
                  size: 80, color: Constants.backgroundColor),
            ),
          ),
        ),
        decoration: const PageDecoration(
          pageColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyTextStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
          ),
          imagePadding: EdgeInsets.only(top: 100.0, bottom: 0.0),
          contentMargin: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
      PageViewModel(
        title: "Accept Payments",
        body: "Accept stablecoin payments hassle-free",
        image: Center(
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.account_balance_wallet,
                size: 80,
                color: Constants.backgroundColor,
              ),
            ),
          ),
        ),
        decoration: const PageDecoration(
          pageColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyTextStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
          ),
          imagePadding: EdgeInsets.only(top: 100.0, bottom: 0.0),
          contentMargin: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
      PageViewModel(
        title: "Pay Bills",
        body: "Pay for utility services and earn rewards",
        image: Center(
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(Icons.receipt_long,
                  size: 100, color: Constants.backgroundColor),
            ),
          ),
        ),
        decoration: const PageDecoration(
          pageColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyTextStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
          ),
          imagePadding: EdgeInsets.only(top: 100.0, bottom: 0.0),
          contentMargin: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    int currentPage = 0;
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: StatefulBuilder(
        builder: (context, setState) {
          return Stack(
            children: [
              IntroductionScreen(
                key: introKey,
                globalBackgroundColor: Colors.white,
                pages: _buildPageList(),
                onDone: _onIntroEnd,
                onSkip: _onIntroEnd,
                showSkipButton: false,
                showNextButton: false,
                showDoneButton: false, // Hide default done
                onChange: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                dotsDecorator: DotsDecorator(
                  size: const Size(6.0, 6.0),
                  color: Colors.grey.shade300,
                  activeSize: const Size(20.0, 6.0),
                  activeColor: Constants.backgroundColor,
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                dotsContainerDecorator:
                    const BoxDecoration(color: Colors.transparent),
                controlsMargin: const EdgeInsets.only(bottom: 100),
                controlsPadding: const EdgeInsets.symmetric(horizontal: 16),
                curve: Curves.fastLinearToSlowEaseIn,
              ),

              // Skip button in top-left
              Positioned(
                top: 40,
                right: 16,
                child: GestureDetector(
                  onTap: _onIntroEnd,
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
              ),

              // Bottom center Next or Done button
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      if (currentPage == _buildPageList().length - 1) {
                        _onIntroEnd(); // Done
                      } else {
                        introKey.currentState?.next(); // Next
                      }
                    },
                    child: Container(
                      width: _size.width * .9,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Constants.backgroundColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          currentPage == _buildPageList().length - 1
                              ? 'Get Started'
                              : 'Next',
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
