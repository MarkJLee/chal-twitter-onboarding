import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomizeExperienceScreen extends StatefulWidget {
  const CustomizeExperienceScreen({super.key});

  @override
  State<CustomizeExperienceScreen> createState() =>
      _CustomizeExperienceScreenState();
}

class _CustomizeExperienceScreenState extends State<CustomizeExperienceScreen> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        border: const Border(bottom: BorderSide.none),
        backgroundColor: CupertinoColors.white,
        middle: const FaIcon(
          FontAwesomeIcons.twitter,
          size: 30,
        ),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context, false); // false (_result)
              },
              child: const FaIcon(
                FontAwesomeIcons.arrowLeft,
                color: CupertinoColors.black,
                size: 22,
              ),
            ),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          children: [
            const Text(
              "Customize your experience",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.2),
              child: const Text(
                "Track where you see Twitter content across the web.",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.05),
                    child: const Text(
                      "Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                CupertinoSwitch(
                  // This bool value toggles the switch.
                  value: _switchValue,
                  activeColor: const Color.fromARGB(255, 38, 154, 67),
                  onChanged: (bool? value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      _switchValue = value ?? false;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
              text: TextSpan(
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: CupertinoColors.black,
                  ),
                  children: [
                    const TextSpan(text: "By signing up, you agree to our "),
                    TextSpan(
                      text: "Terms",
                      style: const TextStyle(color: CupertinoColors.activeBlue),
                      recognizer: TapGestureRecognizer()..onTap = () => {},
                    ),
                    const TextSpan(text: ", "),
                    TextSpan(
                      text: "Policy, ",
                      style: const TextStyle(color: CupertinoColors.activeBlue),
                      recognizer: TapGestureRecognizer()..onTap = () => {},
                    ),
                    const TextSpan(text: "and "),
                    TextSpan(
                      text: "Cookie Use",
                      style: const TextStyle(color: CupertinoColors.activeBlue),
                      recognizer: TapGestureRecognizer()..onTap = () => {},
                    ),
                    const TextSpan(
                        text:
                            ". Twitter may use your contact information, including your email address and phone number for purposes outlined in out Privacy Policy. "),
                    TextSpan(
                      text: "Learn more",
                      style: const TextStyle(color: CupertinoColors.activeBlue),
                      recognizer: TapGestureRecognizer()..onTap = () => {},
                    ),
                  ]),
            ),
            const Spacer(),
            CupertinoButton(
              borderRadius: BorderRadius.circular(30),
              color: CupertinoColors.black,
              disabledColor: CupertinoColors.systemGrey,
              onPressed:
                  _switchValue ? () => Navigator.pop(context, true) : null,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Next",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
