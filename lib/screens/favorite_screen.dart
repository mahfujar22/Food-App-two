import 'package:flutter/material.dart';
import 'burger_detiles_page.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Map<String, dynamic>> favorites;
  final Function(Map<String, dynamic>) onRemove;

  const FavoriteScreen({
    super.key,
    required this.favorites,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Favorites ❤️"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: favorites.isEmpty
          ? const Center(
        child: Text(
          "No favorites added yet!",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: favorites.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) {
          final burger = favorites[index];
          return Container(
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
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      burger["image"],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(burger["name"],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold)),
                Text(burger["brand"],
                    style: const TextStyle(color: Colors.grey)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        onRemove(burger);
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                BurgerDetailsPage(burger: burger),
                          ),
                        );
                      },
                      icon: const Icon(Icons.info_outline,
                          color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
