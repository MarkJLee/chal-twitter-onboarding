import 'package:flutter/cupertino.dart';

class SubInterestButtonWidget extends StatelessWidget {
  final String interest;
  final String subInterest;
  final bool isSelected;
  final Function toggleSelection;
  const SubInterestButtonWidget(
      {super.key,
      required this.interest,
      required this.subInterest,
      required this.isSelected,
      required this.toggleSelection});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: CupertinoColors.systemGrey3),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: CupertinoButton(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          onPressed: () => toggleSelection(interest, subInterest),
          color:
              isSelected ? CupertinoColors.activeBlue : CupertinoColors.white,
          borderRadius: BorderRadius.circular(20.0),
          child: Text(
            subInterest,
            style: TextStyle(
              color: isSelected ? CupertinoColors.white : CupertinoColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
