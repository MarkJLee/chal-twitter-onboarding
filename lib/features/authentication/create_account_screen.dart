import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  String _name = '';
  String _email = '';
  DateTime? _birth;

  // 모든 필드 조건이 맞을 때만 버튼 활성화
  bool _isValid() {
    return _isValidName(_name) &&
        _isValidEmail(_email) &&
        _isValidBirth(_birth);
  }

  bool _showAgeDescription = false;

  bool _isValidName(String name) {
    return name.length >= 4;
  }

  bool _isValidEmail(String email) {
    final RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }

  bool _isValidBirth(DateTime? birth) {
    return birth != null &&
        birth.isBefore(DateTime.now()) &&
        birth.isBefore(DateTime.now().subtract(const Duration(days: 365)));
  }

  void _updateDateController() {
    if (_birth != null) {
      List<String> monthNames = [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December'
      ];

      String formattedDate =
          '${monthNames[_birth!.month - 1]} ${_birth!.day}, ${_birth!.year}';
      _dateController.text = formattedDate;
    } else {
      _dateController.clear();
    }
  }

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
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 20,
                ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Create your account",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            CupertinoTextField(
                controller: _controller,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: CupertinoColors.systemGrey,
                      width: 0.5,
                    ),
                    top: BorderSide.none,
                    left: BorderSide.none,
                    right: BorderSide.none,
                  ),
                ),
                placeholderStyle: const TextStyle(color: CupertinoColors.black),
                placeholder: "Name",
                style: const TextStyle(
                  color: CupertinoColors.systemCyan,
                ),
                suffix: _isValidName(_name)
                    ? Container(
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
                      )
                    : null,
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                }),
            const SizedBox(
              height: 40,
            ),
            CupertinoTextField(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: CupertinoColors.systemGrey,
                      width: 0.5,
                    ),
                    top: BorderSide.none,
                    left: BorderSide.none,
                    right: BorderSide.none,
                  ),
                ),
                placeholderStyle: const TextStyle(color: CupertinoColors.black),
                placeholder: "Phone number or email address",
                style: const TextStyle(
                  color: CupertinoColors.systemCyan,
                ),
                suffix: _isValidEmail(_email)
                    ? Container(
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
                      )
                    : null,
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                }),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () async {
                DateTime? selectedDate = await showCupertinoModalPopup(
                  context: context,
                  barrierColor: CupertinoColors.white.withOpacity(0.01),
                  builder: (BuildContext context) => Column(
                    children: [
                      const Spacer(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                        child: Container(
                          color: CupertinoColors.white,
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            onDateTimeChanged: (DateTime dateTime) {
                              setState(() {
                                _birth = dateTime;
                                _updateDateController();
                                _showAgeDescription = true;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
                if (selectedDate != null) {
                  setState(() {
                    _birth = selectedDate;
                  });
                }
              },
              child: AbsorbPointer(
                child: CupertinoTextField(
                  controller: _dateController,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: CupertinoColors.systemGrey,
                        width: 0.5,
                      ),
                      top: BorderSide.none,
                      left: BorderSide.none,
                      right: BorderSide.none,
                    ),
                  ),
                  placeholderStyle:
                      const TextStyle(color: CupertinoColors.black),
                  placeholder: "Date of birth",
                  style: const TextStyle(
                    color: CupertinoColors.systemCyan,
                  ),
                  suffix: _isValidBirth(_birth)
                      ? Container(
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
                        )
                      : null,
                ),
              ),
            ),
            if (_showAgeDescription)
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else',
                  style: TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            // const Spacer(),
            const SizedBox(
                height:
                    20), // spacer 대신 사용, DatePicker에 따라서 같이 올라오는 버튼을 만들고자하면?
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CupertinoButton(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    disabledColor: CupertinoColors.systemGrey,
                    borderRadius: BorderRadius.circular(30),
                    color: CupertinoColors.black,
                    onPressed: _isValid() ? () {} : null,
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
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
