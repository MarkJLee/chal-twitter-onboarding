import 'package:chal_twitter_onboarding/features/authentication/widgets/sub_interest_button_widget.dart';
import 'package:chal_twitter_onboarding/features/authentication/widgets/twitter_navigation_bar_widget.dart';
import 'package:flutter/cupertino.dart';

class SubInterestsScreen extends StatefulWidget {
  final List<String> selectedInterests;

  const SubInterestsScreen({required this.selectedInterests, Key? key})
      : super(key: key);

  @override
  State<SubInterestsScreen> createState() => _SubInterestsScreenState();
}

class _SubInterestsScreenState extends State<SubInterestsScreen> {
  Map<String, List<String>> interestsToSubInterests = {
    "Fashion & Beauty": [
      'Clothing Trends',
      'Makeup Techniques',
      'Beauty Skincare',
      'Fashion Shows',
      'Fashion Accessories',
      'Beauty Tutorials',
      'Street Style',
      'Fashion Designers',
      'Beauty Products',
      'Hairstyles',
      'Footwear',
      'Fashion Weeks',
      'Cosmetics',
      'Fashion History',
      "Men's Fashion",
      "Women's Fashion",
      'DIY Fashion',
      'Beauty Tips',
      'Sustainable Fashion',
      'Fashion Photography'
    ],
    "Outdoors": [
      'Hiking Trails',
      'Camping Tips',
      'Fishing Techniques',
      'Outdoor Photography',
      'Wildlife',
      'Rock Climbing',
      'Outdoor Equipment',
      'National Parks',
      'Outdoor Adventures',
      'Backpacking',
      'Bird Watching',
      'Survival Skills',
      'Outdoor Cooking',
      'Mountain Biking',
      'Outdoor Festivals',
      'Nature Conservation',
      'Outdoor Fitness',
      'Canoeing',
      'Beach Activities',
      'Snow Sports'
    ],
    "Arts & culture": [
      'Classical Art',
      'Modern Art',
      'Art Exhibitions',
      'Cultural Festivals',
      'Literature',
      'Theater',
      'Cinema',
      'Music Genres',
      'Cultural Traditions',
      'Photography',
      'Sculpture',
      'Dance Forms',
      'Archaeology',
      'Art Techniques',
      'Cultural History',
      'Museums',
      'Folk Arts',
      'Painting',
      'Architecture',
      'Crafts'
    ],
    "Animation & comics": [
      'Anime',
      'Cartoon Series',
      'Comic Books',
      'Animation Studios',
      'Comic Con',
      'Manga',
      'Animated Movies',
      'Voice Acting',
      'Animation Techniques',
      'Storyboarding',
      'Graphic Novels',
      'Digital Animation',
      'Character Design',
      'Anime Conventions',
      'Comic Artists',
      'Webcomics',
      'Stop Motion',
      'Cosplay',
      'Comic Strips',
      'Animation History'
    ],
    "Business & finance": [
      'Economics',
      'Stock Market',
      'Startups',
      'Entrepreneurship',
      'Banking',
      'Investments',
      'Marketing',
      'E-commerce',
      'Financial Planning',
      'Accounting',
      'Taxes',
      'Real Estate',
      'Insurance',
      'Financial News',
      'Trading',
      'Cryptocurrency',
      'Mergers & Acquisitions',
      'Venture Capital',
      'Budgeting',
      'Business Strategy'
    ],
    "Food": [
      'Cuisines',
      'Cooking Techniques',
      'Desserts',
      'Healthy Recipes',
      'Street Food',
      'Dining Out',
      'Food Festivals',
      'Baking',
      'Vegetarian',
      'Vegan',
      'Wines & Spirits',
      'Food Photography',
      'Food Reviews',
      'Chefs & Cooks',
      'Beverages',
      'Cooking Shows',
      'Diet & Nutrition',
      'Superfoods',
      'Barbecue & Grilling',
      'Cookbooks'
    ],
    "Travel": [
      'Destinations',
      'Travel Tips',
      'Adventure Travel',
      'Beaches',
      'Mountains',
      'Travel Photography',
      'Solo Travel',
      'Budget Travel',
      'Luxury Travel',
      'Travel Vlogs',
      'Cultural Travel',
      'Air Travel',
      'Hotels & Resorts',
      'Backpacking',
      'Road Trips',
      'Travel Gear',
      'Travel Writing',
      'Travel Health & Safety',
      'Cruises',
      'Ecotourism'
    ],
    "Entertainment": [
      'Movies',
      'TV Shows',
      'Celebrities',
      'Music',
      'Theater',
      'Reality Shows',
      'Streaming Services',
      'Award Shows',
      'Pop Culture',
      'Concerts & Festivals',
      'Movie Reviews',
      'Gossip',
      'TV Series',
      'Documentaries',
      'Music Albums',
      'New Releases',
      'Entertainment News',
      'Comedy',
      'Drama',
      'Action & Adventure'
    ],
    "Music": [
      'Genres',
      'Artists',
      'Concerts',
      'Albums',
      'Instruments',
      'Music History',
      'Music Theory',
      'Music Festivals',
      'Music News',
      'Music Reviews',
      'Soundtracks',
      'Live Performances',
      'Music Videos',
      'Songwriting',
      'Production',
      'Singing',
      'Dancing',
      'Music Awards',
      'Radio',
      'Music Streaming'
    ],
    "Gaming": [
      'Video Games',
      'PC Gaming',
      'Console Gaming',
      'Mobile Gaming',
      'Game Developers',
      'Game Reviews',
      'E-sports',
      'Live Streaming',
      'Virtual Reality',
      'Gaming Conventions',
      'RPGs',
      'Strategy Games',
      'First-Person Shooters',
      'Adventure Games',
      'Gaming News',
      'Game Mods',
      'Gaming Hardware',
      'Gaming Tournaments',
      'Gaming Tips & Tricks',
      'Online Multiplayer'
    ],
    "Sports": [
      'Soccer',
      'Basketball',
      'Baseball',
      'Tennis',
      'Golf',
      'Cricket',
      'Rugby',
      'Martial Arts',
      'Motorsports',
      'Athletics',
      'Olympics',
      'World Cup',
      'Leagues',
      'Sports News',
      'Athletes',
      'Sporting Events',
      'Training & Fitness',
      'Stadiums',
      'Sport Science',
      'Fan Culture'
    ],
    "News": [
      'World News',
      'Local News',
      'Politics',
      'Weather',
      'Business News',
      'Technology News',
      'Entertainment News',
      'Health News',
      'Science News',
      'Sports News',
      'Breaking News',
      'Journalism',
      'Opinion & Editorial',
      'Analysis',
      'Investigative Reporting',
      'Current Events',
      'Documentaries',
      'Interviews',
      'Photojournalism',
      'Podcasts'
    ],
    "Technology": [
      'Gadgets',
      'Software',
      'Hardware',
      'Internet',
      'Artificial Intelligence',
      'Virtual Reality',
      'Drones',
      'Robotics',
      'Mobile Apps',
      'Web Development',
      'Coding & Programming',
      'Tech Startups',
      'Tech Reviews',
      'Cybersecurity',
      'Big Data',
      'Cloud Computing',
      'E-commerce',
      'Tech Events & Conferences',
      'Innovations'
    ],
    "Health & wellness": [
      'Fitness',
      'Mental Health',
      'Nutrition',
      'Yoga',
      'Meditation',
      'Diseases & Conditions',
      'Medications & Treatments',
      'Medical Research',
      'Exercise',
      'Diet & Weight Loss',
      'Wellness Trends',
      'Alternative Medicine',
      'Self-Care',
      'Therapies',
      'Health News',
      'Hospitals & Clinics',
      'Surgeries',
      'Health Gadgets',
      'Beauty & Skincare',
      'Relaxation'
    ],
    "Books & literature": [
      'Genres',
      'Authors',
      'Book Reviews',
      'Classic Literature',
      'Poetry',
      'Literary Analysis',
      'Book Clubs',
      'E-books',
      'Audiobooks',
      'Bestsellers',
      'Fiction',
      'Non-Fiction',
      'Biographies & Memoirs',
      'Historical Fiction',
      'Science Fiction & Fantasy',
      'Romance',
      'Mystery & Thrillers',
      'Young Adult',
      "Children's Books",
      "Literary Journals",
      "Short Stories",
      "Book Fairs & Festivals",
      'Literary Prizes',
      'Writing & Publishing',
      'Graphic Novels'
    ],
    "Science": [
      'Biology',
      'Physics',
      'Chemistry',
      'Astronomy',
      'Geology',
      'Meteorology',
      'Botany',
      'Zoology',
      'Medicine & Health',
      'Environmental Science',
      'Genetics',
      'Neuroscience',
      'Scientific Research',
      'Discoveries & Innovations',
      'Science Journals',
      'Experiments',
      'Science News',
      'Science History',
      'Theoretical Science',
      'Science Conferences',
      'Space Exploration',
      'Nanotechnology',
      'Earth Sciences',
      'Particle Physics',
      'Ecology'
    ]
  };

  Map<String, Set<String>> selectedSubInterests = {};

  _isSubCategorySelected() {
    int totalSelectedSubInterests = 0;

    for (var subInterests in selectedSubInterests.values) {
      totalSelectedSubInterests += subInterests.length;
    }

    return totalSelectedSubInterests >= 3;
  }

  _navigateToNextScreen() {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => Container(),
      ),
    );
  }

  void toggleSelection(String interest, String subInterest) {
    if (selectedSubInterests[interest] == null) {
      selectedSubInterests[interest] = {};
    }

    if (selectedSubInterests[interest]!.contains(subInterest)) {
      selectedSubInterests[interest]!.remove(subInterest);
    } else {
      selectedSubInterests[interest]!.add(subInterest);
    }

    setState(() {});
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
                          "Interests are used to personalize your experience and will be visible on your profile.",
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
                  child: CupertinoScrollbar(
                    child: ListView.builder(
                      itemCount: widget.selectedInterests.length,
                      itemBuilder: (context, index) {
                        String interest = widget.selectedInterests[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                interest,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: SizedBox(
                                height: 200.0, // Adjust height for single row
                                child: Wrap(
                                  direction: Axis.vertical, // 버튼들을 수직 방향으로 배치
                                  spacing: 1.0, // 수평 간격
                                  runSpacing: 1.0, // 수직 간격
                                  children: List.generate(
                                    interestsToSubInterests[interest]?.length ??
                                        0,
                                    (i) {
                                      String subInterest =
                                          interestsToSubInterests[interest]![i];
                                      bool isSelected =
                                          selectedSubInterests[interest]
                                                  ?.contains(subInterest) ??
                                              false;

                                      return SubInterestButtonWidget(
                                        interest: interest,
                                        subInterest: subInterest,
                                        isSelected: isSelected,
                                        toggleSelection: toggleSelection,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0), // Add some spacing
                          ],
                        );
                      },
                    ),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                              onPressed: _isSubCategorySelected()
                                  ? () {
                                      Future.delayed(
                                          Duration.zero, _navigateToNextScreen);
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
          ),
        ],
      ),
    );
  }
}
