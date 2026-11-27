import 'package:flutter/material.dart';

const int maxStars = 4;

//
//  TODO: convert this StatelessWidget into a StatefulWidget
//        and implement the behaviour described in INSTRUCTIONS.md
//
class StarRating extends StatefulWidget {
  final String title;
  const StarRating({super.key, required this.title});

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int stars = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(widget.title) 
          
        ),
      
      IconButton(onPressed:(){
        setState(() {
          if (stars > 0) {
            stars--;
          }
        });
      },
      icon: const Icon(Icons.remove),
      ),
      for (int i = 0; i < maxStars; i++)
          Icon(
            i < stars ? Icons.star : Icons.star_border,
            color: i < stars ? Colors.amber : Colors.grey,
          ),
      IconButton(onPressed:(){
        setState(() {
          if (stars < maxStars) {
            stars++;
          }
        });
      },
      icon: const Icon(Icons.add),
      ),
      ],
    );
  }
}
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text(
            'W8 - Stateful Widgets',
            style: TextStyle(
              color: Colors.white,
            ),
            ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              StarRating(title: 'Food'),
              StarRating(title: 'Service'),
              StarRating(title: 'Price'),
            ],
          ),
        ),
      ),
    );
  }
}