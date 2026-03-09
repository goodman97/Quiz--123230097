import 'package:flutter/material.dart';
import '../models/food_list.dart';
//import 'package:url_launcher/url_launcher.dart';

class MovieDetailPage extends StatelessWidget {
  final Food foods;
  const MovieDetailPage({super.key, required this.foods});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Food details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 500,
              child: Image.network(
                foods.image,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.movie, size: 80, color: Colors.grey,),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${foods.name}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    '${foods.price}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed:() {
                        
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: const Text('Checkout'),
                    ),
                  ),
                  /*const SizedBox(height: 16,),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 13, color: Colors.black),
                      children: [
                        const TextSpan(
                          text: 'ingredients:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: foods.ingredients),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6,),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 13, color: Colors.black),
                      children: [
                        const TextSpan(
                          text: 'casts:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: movie.casts.join(',')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16,),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber,size: 22,),
                      const SizedBox(width: 6,),
                      Text(
                        'Rated ${movie.rating}/10',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        final Uri url = Uri.parse(movie.movieUrl);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                      },
                      icon: const Icon(Icons.open_in_new),
                      label: const Text("Open in Wikipedia #kepo sama fiturnya, ai dikit bang maap"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 2,
                      ),
                    ),
                  ),*/
                  const SizedBox(height: 20,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

