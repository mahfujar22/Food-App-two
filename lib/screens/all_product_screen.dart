import 'package:flutter/material.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  double spicyLevel = 0.3;
  int count = 0;
  int portion = 2;

  List<String> selectedToppings = [];
  List<String> selectedSides = [];

  final List<Map<String, String>> toppings = [
    {"name": "tomato", "image": "assets/images/tamato.png"},
    {"name": "onions", "image": "assets/images/onions.png"},
    {"name": "pickles", "image": "assets/images/pickles.png"},
    {"name": "Bacons", "image": "assets/images/bacons.png"},
  ];

  final List<Map<String, String>> sides = [
    {"name": "Fries", "image": "assets/images/fries.png"},
    {"name": "Coleslaw", "image": "assets/images/coleslaw.png"},
    {"name": "Salad", "image": "assets/images/salad.png"},
    {"name": "Onion", "image": "assets/images/onion_rings.png"},
  ];

  double get totalPrice {
    // Base price + $1 per topping + $2 per side
    double price = 12.0;
    price += selectedToppings.length * 1;
    price += selectedSides.length * 2;
    price *= portion;
    return price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.black, size: 30),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      "assets/images/group_burger.png",
                      height: 200,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Customize Your Burger",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "to Your Tastes. Ultimate Experience",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(height: 16),
                        const Text("Spicy"),
                        Slider(
                          value: spicyLevel,
                          onChanged: (value) {
                            setState(() {
                              spicyLevel = value;
                            });
                          },
                          activeColor: Colors.red,
                          inactiveColor: Colors.red.withOpacity(0.3),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text("Mild", style: TextStyle(color: Colors.green)),
                            const SizedBox(width: 10),
                            Text("Hot", style: TextStyle(color: Colors.red)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Portion',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 8),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: IconButton(
                                alignment: Alignment.center,
                                onPressed: () {
                                  setState(() {
                                    if (count > 0) count--;
                                  });
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              "$count",
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(width: 20),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    count++;
                                  });
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Toppings',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              _buildToppingsSection(),

              const SizedBox(height: 20),
              Text(
                'Side Options',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              _buildSideBoxSection(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${totalPrice.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "ORDER NOW",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

 Widget _buildSideBoxSection() {
    return SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sides.length,
                itemBuilder: (context, index) {
                  final side = sides[index];
                  final isSelected = selectedSides.contains(side["name"]);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedSides.remove(side["name"]);
                        } else {
                          selectedSides.add(side["name"]!);
                        }
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 2,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(side["image"]!, height: 80,fit: BoxFit.cover,),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                side["name"]!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: isSelected
                                    ? Colors.red
                                    : Colors.black,
                                child: const Icon(
                                  Icons.add,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
  }

  Widget _buildToppingsSection() {
    return SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: toppings.length,
                itemBuilder: (context, index) {
                  final topping = toppings[index];
                  final isSelected = selectedToppings.contains(
                    topping["name"],
                  );
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedToppings.remove(topping["name"]);
                        } else {
                          selectedToppings.add(topping["name"]!);
                        }
                      });
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 2,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(topping["image"]!, height: 80,fit: BoxFit.cover,),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                topping["name"]!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: isSelected
                                    ? Colors.red
                                    : Colors.black,
                                child: const Icon(
                                  Icons.add,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
  }
}
