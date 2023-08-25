import 'package:flutter/cupertino.dart';

class GreenCheckMarkWidget extends StatelessWidget {
  const GreenCheckMarkWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 38, 154, 67),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(5),
      child: const Icon(
        CupertinoIcons.check_mark,
        color: CupertinoColors.white,
        size: 18,
      ),
    );
  }
}
