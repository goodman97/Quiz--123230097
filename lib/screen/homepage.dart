import 'package:flutter/material.dart';
import '../models/food_list.dart';
import './detail.dart';

List<Food> savedFoods = [];

class FoodListPage extends StatefulWidget {
  final String username;
  const FoodListPage({super.key, required this.username});

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage>{
  void _toggleSave(Food foods){
    setState(() {
      if(savedFoods.contains(foods)){
        savedFoods.remove(foods);
      }else{
        savedFoods.add(foods);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    /*
      implementasikan widget untuk menampilkan list movie yang sudah diambil dari dummy data
        - gunakan ListView.builder untuk menampilkan list movie
        - setiap item movie ditampilkan menggunakan Card widget yang berisi judul movie dan poster movie
        - ketika item movie ditekan, navigasikan ke halaman MovieDetailPage dengan membawa data movie yang dipilih
        
    
     */
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Welcome, ${widget.username}!',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: dummyFoods.length,
        itemBuilder: (context, index) {
          final foods = dummyFoods[index];
          final isSaved = savedFoods.contains(foods);

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailPage(foods: foods),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.only(bottom: 12),
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    // Poster
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        foods.image,
                        width: 70,
                        height: 90,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          width: 70,
                          height: 90,
                          color: Colors.grey[300],
                          child: const Icon(Icons.movie, color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${foods.name}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            foods.category,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),

                          const SizedBox(height: 4),
                          Text(
                            'tekan jika ingin memesan',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          /*const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                '${movie.rating}/10',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),*/
                        ],
                      ),
                    ),
                    // Bookmark button
                    /*IconButton(
                      onPressed: () => _toggleSave(foods),
                      icon: Icon(
                        isSaved ? Icons.bookmark : Icons.bookmark_border,
                        color: isSaved ? Colors.blue : Colors.grey,
                      ),
                    ),*/
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
 