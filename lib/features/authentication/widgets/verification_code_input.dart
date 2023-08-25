import 'package:flutter/cupertino.dart';

class VerificationCodeInput extends StatefulWidget {
  // const VerificationCodeInput({super.key});
  final ValueChanged<String> onCompleted;
  final VoidCallback onIncomplete;
  const VerificationCodeInput(
      {Key? key, required this.onCompleted, required this.onIncomplete})
      : super(key: key);

  @override
  _VerificationCodeInputState createState() => _VerificationCodeInputState();
}

class _VerificationCodeInputState extends State<VerificationCodeInput> {
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());

  final List<String> _previousValues = List.generate(6, (index) => '');

  bool allFieldsFilled() {
    return _controllers.every((controller) => controller.text.length == 1);
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(6, (index) {
        return Flexible(
          child: Container(
            margin: EdgeInsets.only(
                right: index != 5 ? 10 : 0), // 마지막 인풋 필드는 우측 마진 없음
            child: CupertinoTextField(
              controller: _controllers[index],
              keyboardType: TextInputType.number,
              maxLength: 1,
              textAlign: TextAlign.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: _focusNodes[index].hasFocus
                        ? CupertinoColors.black
                        : CupertinoColors.systemGrey,
                    width: 2,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
              focusNode: _focusNodes[index],
              onChanged: (value) {
                if (value.isNotEmpty && index < 5) {
                  _focusNodes[index].unfocus();
                  FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                } else if (value.isEmpty &&
                    _previousValues[index].length > value.length &&
                    index > 0) {
                  _focusNodes[index].unfocus();
                  FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                }
                _previousValues[index] = value;
                if (allFieldsFilled()) {
                  final code =
                      _controllers.map((controller) => controller.text).join();
                  widget.onCompleted(code);
                } else {
                  widget.onIncomplete();
                }
              },
            ),
          ),
        );
      }),
    );
  }
}
