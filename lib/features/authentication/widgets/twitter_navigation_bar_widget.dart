import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterNavigationBarWidget {
  final Widget? leadingWidget;

  TwitterNavigationBarWidget({this.leadingWidget});

  CupertinoNavigationBar build(BuildContext context) {
    return CupertinoNavigationBar(
      border: const Border(bottom: BorderSide.none),
      backgroundColor: CupertinoColors.white,
      middle: const FaIcon(
        FontAwesomeIcons.twitter,
        size: 30,
      ),
      leading: leadingWidget ?? const SizedBox.shrink(),
    );
  }
}
