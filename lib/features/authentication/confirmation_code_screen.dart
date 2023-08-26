import 'package:chal_twitter_onboarding/features/authentication/widgets/green_check_mark_widget.dart';
import 'package:chal_twitter_onboarding/features/authentication/widgets/twitter_navigation_bar_widget.dart';
import 'package:chal_twitter_onboarding/features/authentication/widgets/verification_code_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  final String email;

  const ConfirmationCodeScreen({super.key, required this.email});

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  final Uri _url = Uri.parse("https://emailsent.devinforall.repl.co");
  late bool _isConfimed = false;
  final _tapRecognizer = TapGestureRecognizer();
  final _verificationCode = "056022";
  bool _isLoading = false;

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 1));

    await Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => Container(),
      ),
    );

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _tapRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: TwitterNavigationBarWidget(
        leadingWidget: Column(
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
      ).build(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "We sent you a code",
              style: TextStyle(
                fontFamily: 'helvetica neue',
                fontSize: 33,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Enter it below to verify\n${widget.email}.",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            VerificationCodeInput(
              onCompleted: (String code) {
                if (code == _verificationCode) {
                  setState(() {
                    _isConfimed = true;
                  });
                }
              },
              onIncomplete: () {
                setState(() {
                  _isConfimed = false;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            _isConfimed
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GreenCheckMarkWidget(),
                    ],
                  )
                : const SizedBox(),
            const Spacer(),
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: "Dindn't receive email?",
                    style: const TextStyle(color: CupertinoColors.activeBlue),
                    recognizer: _tapRecognizer
                      ..onTap = () async {
                        if (await canLaunchUrl(_url)) {
                          await launchUrl(_url);
                        } else {
                          throw 'Could not launch $_url';
                        }
                      },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CupertinoButton(
              borderRadius: BorderRadius.circular(30),
              color: CupertinoColors.black,
              disabledColor: CupertinoColors.systemGrey,
              onPressed: _isConfimed && !_isLoading
                  ? () async {
                      setState(() {
                        _isLoading = true;
                      });
                      _navigateToNextScreen();
                    }
                  : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Opacity(
                        opacity: _isLoading ? 0.0 : 1.0,
                        child: const Text(
                          "Next",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.white,
                          ),
                        ),
                      ),
                      if (_isLoading) const CupertinoActivityIndicator(),
                    ],
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
