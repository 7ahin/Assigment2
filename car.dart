import 'package:flutter/material.dart';

class Car {
  String name;
  String imagePath;

  Car({required this.name, required this.imagePath});
}

void main() {
  List<Car> cars = [
    Car(name: 'Mercedes', imagePath: 'path_to_mercedes_image'),
    Car(name: 'Bugatti', imagePath: 'path_to_bugatti_image'),
    Car(name: 'Lamborghini', imagePath: 'path_to_lamborghini_image'),
    Car(name: 'Porsche', imagePath: 'path_to_porsche_image'),
  ];

  // Accessing car items and their image paths
  for (var car in cars) {
    print('Car: ${car.name}, Image Path: ${car.imagePath}');
  }
}