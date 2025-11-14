
import 'package:Tiger/screens/person_page.dart';
import 'package:flutter/material.dart';
import 'all_product_screen.dart';
import 'burger_detiles_page.dart';
import 'home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;
  int activeTab = 0; // 0=home, 1=profile, 2=favorite, 3=cart, 4=unfavorite

  late Map<int, bool> isFavorite;

  final List<Map<String, dynamic>> allBurgers = [
    {
      "id": 1,
      "name": "Cheeseburger",
      "brand": "Wendy's Burger",
      "rating": 4.9,
      "image": "assets/images/group_four.png",
      "description":
      "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
    },
    {
      "id": 2,
      "name": "HamBurger",
      "brand": "Veggie Burger",
      "rating": 4.8,
      "image": "assets/images/group_three.png",
      "description":
      "Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun.",
    },
    {
      "id": 3,
      "name": "HamBurger",
      "brand": "Chicken Burger",
      "rating": 4.6,
      "image": "assets/images/group_four.png",
      "description":
      "Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option. Try it today and experience the mouth-watering flavors of our Hamburger Chicken Burger!",
    },
    {
      "id": 4,
      "name": "HamBurger",
      "brand": "Fried Chicken Burger",
      "rating": 4.5,
      "image": "assets/images/group_four.png",
      "description":
      "Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce.",
    },
  ];

  final List<Map<String, dynamic>> comboBurgers = [
    {
      "id": 5,
      "name": "Combo Meal 1",
      "brand": "Burger + Fries + Coke",
      "rating": 4.7,
      "image": "assets/images/group_three.png",
      "description":
      "Enjoy our delicious Hamburger Veggie Burger combo, made with fresh vegetables, crispy fries, and an ice-cold Coke!",
    },
    {
      "id": 6,
      "name": "Mini Slider Combo",
      "brand": "Tiny Burger Combo",
      "rating": 4.6,
      "image": "assets/images/group_four.png",
      "description":
      "Mini sliders served with golden fries and refreshing drink — a perfect combo for a quick bite.",
    },
  ];

  final List<Map<String, dynamic>> sliderBurgers = [
    {
      "id": 7,
      "name": "Classic Slider",
      "brand": "Old School Style",
      "rating": 4.8,
      "image": "assets/images/group_three.png",
      "description":
      "Classic mini slider with juicy beef patty, topped with cheese, lettuce, and pickles.",
    },
    {
      "id": 8,
      "name": "Mini Slider",
      "brand": "Tiny Burger",
      "rating": 4.6,
      "image": "assets/images/group_four.png",
      "description":
      "Small yet full of flavor — mini sliders made with premium ingredients.",
    },
  ];

  final List<Map<String, dynamic>> classicBurgers = [
    {
      "id": 9,
      "name": "HamBurger",
      "brand": "Chicken Burger",
      "rating": 4.6,
      "image": "assets/images/group_four.png",
      "description":
      "A juicy chicken burger with a hint of spice and a perfect crispy layer.",
    },
    {
      "id": 10,
      "name": "HamBurger",
      "brand": "Fried Chicken Burger",
      "rating": 4.5,
      "image": "assets/images/group_four.png",
      "description":
      "Golden fried chicken burger that melts in your mouth — crispy outside, soft inside.",
    },
  ];

  @override
  void initState() {
    super.initState();
    final allIds = [
      ...allBurgers,
      ...comboBurgers,
      ...sliderBurgers,
      ...classicBurgers
    ].map((b) => b["id"] as int);
    isFavorite = {for (var id in allIds) id: false};
  }

  List<Map<String, dynamic>> get visibleBurgers {
    switch (selectedTab) {
      case 1:
        return comboBurgers;
      case 2:
        return sliderBurgers;
      case 3:
        return classicBurgers;
      default:
        return allBurgers;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> burgersToShow = visibleBurgers;

    if (activeTab == 2) {
      burgersToShow =
          burgersToShow.where((b) => isFavorite[b["id"]] ?? false).toList();
    } else if (activeTab == 4) {
      burgersToShow =
          burgersToShow.where((b) => !(isFavorite[b["id"]] ?? false)).toList();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(
            children: [
              _buildHeaderSection(),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.10),
                              blurRadius: 12,
                              offset: const Offset(6, 6),
                            ),
                          ],
                        ),
                        child: const TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search, size: 30),
                            hintText: 'Search',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllProductScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.tune, color: Colors.white, size: 28),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildTabText("All", 0),
                    buildTabText("Combos", 1),
                    buildTabText("Slider", 2),
                    buildTabText("Classic", 3),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildTabSection(burgersToShow),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        elevation: 4,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildBottomIcon(Icons.home, 0),
            buildBottomIcon(Icons.person_outline, 1),
            const SizedBox(width: 40),
            buildBottomIcon(Icons.favorite, 2),
            buildBottomIcon(Icons.remove_circle_outline, 4),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AllProductScreen()),
          );
        },
        backgroundColor: Colors.red,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildTabSection(List<Map<String, dynamic>> burgersToShow) {
    return Expanded(
              child: GridView.builder(
                itemCount: burgersToShow.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 22,
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, gridIndex) {
                  final burger = burgersToShow[gridIndex];
                  final isFav = isFavorite[burger["id"]] ?? false;

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BurgerDetailsPage(burger: burger),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  burger["image"],
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              burger["name"],
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              burger["brand"],
                              style: const TextStyle(color: Colors.grey),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "⭐ ${burger["rating"]}",
                                  style: const TextStyle(color: Colors.orange),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isFavorite[burger["id"]] =
                                      !(isFavorite[burger["id"]] ?? false);
                                    });
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: isFav ? Colors.red : Colors.grey.shade800,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
  }

  Widget _buildHeaderSection() {
    return Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Foodgo',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Lobster",
                          fontSize: 40,
                        ),
                      ),
                      Text(
                        'Order your favourite food!',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/Mask_group.png',
                      fit: BoxFit.cover,
                      width: 60,
                      height: 60,
                    ),
                  ),
                ),
              ],
            );
  }

  Widget buildTabText(String title, int index) {
    final bool active = selectedTab == index;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: Container(
          alignment: Alignment.center,
          width: 100,
          height: 40,
          decoration: BoxDecoration(
            color: active ? Colors.red : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: active ? Colors.white : Colors.grey.shade800,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBottomIcon(IconData icon, int index) {
    return IconButton(
      onPressed: () {
        setState(() => activeTab = index);
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PersonPage()),
          );
        }
      },
      icon: Icon(
        icon,
        color: activeTab == index ? Colors.green : Colors.white70,
      ),
    );
  }
}

