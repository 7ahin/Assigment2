import 'package:flutter/material.dart';
import 'dart:math';

class Car {
  String name;
  String imagePath;

  Car({required this.name, required this.imagePath});
}

class CarListScreen extends StatefulWidget {
  @override
  _CarListScreenState createState() => _CarListScreenState();
}

class _CarListScreenState extends State<CarListScreen> {
  List<Car> cars = [
    Car(name: 'Mercedes', imagePath: 'assets/images/mercedes.png'),
    Car(name: 'Bugatti', imagePath: 'assets/images/bugatti.png'),
    Car(name: 'Lamborghini', imagePath: 'assets/images/lambo.png'),
    Car(name: 'Porsche', imagePath: 'assets/images/porsche.png'),
  ];

  String selectedCar = '';
  String displayedImagePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car List'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  selectedCar = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Choose your car',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Find the selected car
                Car? selected = cars.firstWhere(
                  (car) => car.name.toLowerCase() == selectedCar.toLowerCase(),
                );

                if (selected != null) {
                  // Handle the selected car
                  // For example, display an image based on the selected car
                  setState(() {
                    displayedImagePath = selected.name.toLowerCase() == 'bugatti'
                        ? 'assets/images/bugatti.png'
                        : selected.imagePath;
                  });
                } else {
                  print('Invalid car choice!');
                }
              },
              child: Text('Display Choice'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Select a random car from the list
                final random = Random();
                final randomCar = cars[random.nextInt(cars.length)];

                // Handle the randomly selected car
                // For example, display a randomly selected image
                setState(() {
                  displayedImagePath = randomCar.imagePath;
                });
              },
              child: Text("I'm Feeling Lucky"),
            ),
            SizedBox(height: 16),
            displayedImagePath.isNotEmpty
                ? Image.asset(
                    displayedImagePath,
                    height: 200,
                    width: 200,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CarListScreen(),
  ));
}
