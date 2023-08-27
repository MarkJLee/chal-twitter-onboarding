import 'package:chal_twitter_onboarding/features/authentication/sub_interests_screen.dart';
import 'package:chal_twitter_onboarding/features/authentication/widgets/twitter_navigation_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainInterestsScreen extends StatefulWidget {
  const MainInterestsScreen({super.key});

  @override
  State<MainInterestsScreen> createState() => _MainInterestsScreenState();
}

class _MainInterestsScreenState extends State<MainInterestsScreen> {
  static final List<String> interests = [
    "Fashion & Beauty",
    "Outdoors",
    "Arts & culture",
    "Animation & comics",
    "Business & finance",
    "Food",
    "Travel",
    "Entertainment",
    "Music",
    "Gaming",
    "Sports",
    "News",
    "Technology",
    "Health & wellness",
    "Books & literature",
    "Science"
  ];

  _MainInterestsScreenState()
      : _selectedInterests = List.filled(interests.length, false);
  List<bool> _selectedInterests;

  @override
  void initState() {
    super.initState();
    _selectedInterests = List.generate(interests.length, (index) => false);
  }

  _navigateToSubInterestsScreen() {
    List<String> chosenInterests = [];
    for (int i = 0; i < interests.length; i++) {
      if (_selectedInterests[i]) {
        chosenInterests.add(interests[i]);
      }
    }

    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) =>
            SubInterestsScreen(selectedInterests: chosenInterests),
      ),
    );
  }

  _getSelectedCount() {
    return _selectedInterests.where((bool isSelected) => isSelected).length;
  }

  _isCategorySelected() {
    return _getSelectedCount() >= 3;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: TwitterNavigationBarWidget().build(context),
      child: Stack(
        children: [
          CupertinoScrollbar(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "What do you want to see on Twitter?",
                          style: TextStyle(
                            fontFamily: 'helvetica neue',
                            fontSize: 33,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: 20),
                      ]),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1.0,
                  color: CupertinoColors.systemGrey5,
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2열로 표시
                        childAspectRatio:
                            (MediaQuery.of(context).size.width - 30) /
                                (MediaQuery.of(context).size.height * 0.1 * 2),
                        crossAxisSpacing: 10, // 수평 간격
                        mainAxisSpacing: 10, // 수직 간격
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedInterests[index] =
                                  !_selectedInterests[index];
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: _selectedInterests[index]
                                  ? CupertinoColors.activeBlue // 선택된 경우 파란색 배경
                                  : CupertinoColors.white,
                              border: Border.all(
                                  color: CupertinoColors.systemGrey3),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: _selectedInterests[index]
                                            ? const FaIcon(
                                                FontAwesomeIcons.circleCheck,
                                                color: CupertinoColors.white,
                                              )
                                            : null)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        interests[index],
                                        style: TextStyle(
                                          color: _selectedInterests[index]
                                              ? CupertinoColors.white
                                              : CupertinoColors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: interests.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 90,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: CupertinoColors.white,
                border: Border(
                  top: BorderSide(
                    color: CupertinoColors.systemGrey5,
                    width: 1.0,
                  ),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: _isCategorySelected()
                            ? const Text(
                                "Great work 🎉",
                                style: TextStyle(fontSize: 15),
                              )
                            : Text(
                                "${_getSelectedCount()} of 3 selected",
                                style: const TextStyle(fontSize: 15),
                              ),
                      ),
                      CupertinoButton(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        disabledColor: CupertinoColors.systemGrey,
                        borderRadius: BorderRadius.circular(30),
                        color: CupertinoColors.black,
                        onPressed: _isCategorySelected()
                            ? () {
                                Future.delayed(Duration.zero,
                                    _navigateToSubInterestsScreen);
                              }
                            : null,
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
                      )
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
