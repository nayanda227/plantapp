import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/login_signup_btn.dart';
import 'components/sso_buttons.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 600) {
                    return const MobileWelcomeScreen();
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "Smart Gardening",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "Lets start to watering and monitoring plant",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 450,
                                    child: TextButton(
                                      onPressed: () async {
                                        final prefs =
                                        await SharedPreferences.getInstance();
                                        prefs.setBool("onboarding", false);
                                        Navigator.pushReplacementNamed(
                                            context, '/welcome');
                                      },
                                      child: const Column(
                                        children: [
                                          LoginAndSignupBtn(),
                                          SizedBox(height: 20),
                                          Text(
                                            "Or Continue With",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          SsoButtons(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        )
    );
  }
}

class MobileWelcomeScreen extends StatelessWidget {
  const MobileWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Text(
            "Welcome",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Text(
            "Your go-to fitness and wellness buddy",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: TextButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool("onboarding", false);
                  Navigator.pushReplacementNamed(context, '/welcome');
                },
                child: const Column(
                  children: [
                    LoginAndSignupBtn(),
                    SizedBox(height: 20),
                    SsoButtons(),
                  ],
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
