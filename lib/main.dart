import 'caketoppings.dart';
import 'package:flutter/material.dart';
import 'cakesauce.dart';
import 'caketypewidget.dart';
import 'cakesizewidget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  String caketype = 'Sponge';
  String cakeSize = 'Small';
  bool Cherries = false;
  bool fruit = false;
  bool nuts = false;
  String cakesauce = 'vanilla';
  double totalprice = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Get Your Cake Now !'),
          backgroundColor: const Color.fromARGB(255, 54, 33, 243),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),

                Caketypewidget(f: updateCaketype),
                Caketoppings(
                    f1: updatewithCherries,
                    f2: updatewithnuts,
                    f3: updatewithfruit),
                Cakesizewidget(f: updatesize),

                Cakesauce(f: updatesauce),
                const SizedBox(height: 30),
                Text('Total Price ${UpdatePrice()} \$',
                  style: const TextStyle(
                    fontSize: 30,
                    backgroundColor: Color.fromARGB(255, 142, 33, 243),
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void updatesauce(selectedtype) {
    cakesauce= selectedtype;
    UpdatePrice();
  }

  void updatesize(selectedtype) {
    cakeSize = selectedtype;
    UpdatePrice();
  }

  void updatewithCherries(selectedtype) {
    Cherries = selectedtype;
    UpdatePrice();
  }

  void updatewithfruit(selectedtype) {
    fruit = selectedtype;
    UpdatePrice();
  }

  void updateCaketype(selectedtype) {
    caketype = selectedtype;
    UpdatePrice();
  }

  void updatewithnuts(selectedtype) {
    nuts = selectedtype;
    UpdatePrice();
  }

  // ignore: non_constant_identifier_names
  double UpdatePrice() {
    double tempprice=0;

    switch (caketype) {
      case 'Sponge':
        tempprice += 5;
        break;
      case 'Marble':
        tempprice += 7;
        break;
      case 'Butter Cake':
        tempprice += 10;
        break;
    }

    switch (cakeSize) {
      case 'Small':
        tempprice += 10;
        break;
      case 'Large':
        tempprice += 18;
        break;
      case 'Medium':
        tempprice += 14;
        break;
    }
    if(Cherries)
    {
      tempprice+=2;
    }
    if(nuts)
    {
      tempprice+=1;
    }
    if(fruit)
    {
      tempprice+=2;
    }

    switch (cakesauce) {
      case 'vanilla':
        tempprice += 1;
        break;
      case 'chocolate':
        tempprice +=2;
        break;
    }
    setState(() {
      totalprice=tempprice;
    });
    return tempprice;
  }
}