import 'package:flutter/material.dart';

void main() {
  runApp(const PreschoolApp());
}

class PreschoolApp extends StatelessWidget {
  const PreschoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preschool Learning App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Nunito',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'title': 'Alphabet', 'icon': Icons.abc, 'color': Colors.orange},
      {'title': 'Numbers', 'icon': Icons.format_list_numbered, 'color': Colors.green},
      {'title': 'Shapes', 'icon': Icons.category, 'color': Colors.purple},
      {'title': 'Colors', 'icon': Icons.color_lens, 'color': Colors.blue},
      {'title': 'Animals', 'icon': Icons.pets, 'color': Colors.red},
      {'title': 'Music', 'icon': Icons.music_note, 'color': Colors.pink},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Let's Learn!",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[300],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return CategoryCard(
            title: categories[index]['title'],
            icon: categories[index]['icon'],
            color: categories[index]['color'],
            onTap: () {
              // Placeholder for navigation to the specific category screen
              print("${categories[index]['title']} category tapped");
            },
          );
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 60, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
