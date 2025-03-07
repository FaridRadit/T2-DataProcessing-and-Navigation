import 'package:flutter/material.dart';
import '../model/cat.dart';
import '../data/cats.dart';
import '../main.dart';

class CatDetailPage extends StatelessWidget {
  final Cat cat;  

  const CatDetailPage({super.key, required this.cat}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(cat.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(cat.pictureUrl, width: double.infinity, height: 250, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cat.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("${cat.breed} • ${cat.color}", style: TextStyle(fontSize: 18, color: Colors.grey[700])),
                  SizedBox(height: 10),
                  Text("Sex: ${cat.sex}", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Text("Age: ${cat.age} years", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Text("Vaccines: ${cat.vaccines.isNotEmpty ? cat.vaccines.join(', ') : 'None'}",
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Text("Characteristics: ${cat.characteristics.join(', ')}", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Text("Background:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(cat.background, style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class CatCard extends StatelessWidget {
  final Cat cats;
  CatCard({required this.cats});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/catdetail',
          arguments: cats,  
        );
      },
      child: Card(
        margin: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(cats.pictureUrl, height: 180, width: 500, fit: BoxFit.contain),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cats.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("${cats.breed} • ${cats.color}"),
                  Text("Sex: ${cats.sex}"),
                  SizedBox(height: 5),
                  Text("Characteristics: ${cats.characteristics.join(', ')}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class CatListPage extends StatelessWidget {
  const CatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: catList.length,
      itemBuilder: (context,index) {
       return CatCard(cats: catList[index],);
      }
      );
  }
}
