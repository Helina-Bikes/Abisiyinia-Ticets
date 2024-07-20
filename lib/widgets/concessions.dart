import 'package:abyssinia_tickets/widgets/OrderDetails.dart';
import 'package:abyssinia_tickets/widgets/payment.dart';
import 'package:abyssinia_tickets/widgets/ticket.dart';
import 'package:flutter/material.dart';

class Extras extends StatelessWidget {
  final String movieName;
  final int adultTickets;
  final int childTickets;
  final String imagePath;
  final List<int> selectedSeats;

  Extras({
    required this.movieName,
    required this.adultTickets,
    required this.childTickets,
    required this.imagePath,
    required this.selectedSeats,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Food List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedFoodList(
        movieName: movieName,
        adultTickets: adultTickets,
        childTickets: childTickets,
        imagePath: imagePath,
        selectedSeats: selectedSeats,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}



class AnimatedFoodList extends StatefulWidget {
  final String movieName;
  final int adultTickets;
  final int childTickets;
  final String imagePath;

  AnimatedFoodList({
    required this.movieName,
    required this.adultTickets,
    required this.childTickets,
    required this.imagePath, required selectedSeats,
  });

  @override
  _AnimatedFoodListState createState() => _AnimatedFoodListState();
}

class _AnimatedFoodListState extends State<AnimatedFoodList> {
  final List<FoodItem> foodItems = [
    FoodItem(
      name: 'Popcorn',
      image: 'assets/popcorn.jpeg',
      quantities: [
        QuantityAmount(quantity: '0', amount: '0 Birr'),
        QuantityAmount(quantity: '1', amount: '25 Birr'),
        QuantityAmount(quantity: '2', amount: '50 Birr'),
        QuantityAmount(quantity: '3', amount: '75 Birr'),
        QuantityAmount(quantity: '4', amount: '100 Birr'),
        QuantityAmount(quantity: '5', amount: '125 Birr'),
        QuantityAmount(quantity: '6', amount: '150 Birr'),
        QuantityAmount(quantity: '7', amount: '175 Birr'),
        QuantityAmount(quantity: '8', amount: '200 Birr'),
      ],
    ),
    FoodItem(
      name: 'Burger',
      image: 'assets/burgar.jpeg',
      quantities: [
        QuantityAmount(quantity: '0', amount: '0 Birr'),
        QuantityAmount(quantity: '1', amount: '30 Birr'),
        QuantityAmount(quantity: '2', amount: '60 Birr'),
        QuantityAmount(quantity: '3', amount: '90 Birr'),
        QuantityAmount(quantity: '4', amount: '120 Birr'),
        QuantityAmount(quantity: '5', amount: '150 Birr'),
        QuantityAmount(quantity: '6', amount: '180 Birr'),
        QuantityAmount(quantity: '7', amount: '210 Birr'),
        QuantityAmount(quantity: '8', amount: '240 Birr'),
      ],
    ),
    FoodItem(
      name: 'Pizza',
      image: 'assets/pizza.jpeg',
      quantities: [
        QuantityAmount(quantity: '0', amount: '0 Birr'),
        QuantityAmount(quantity: '1', amount: '20 Birr'),
        QuantityAmount(quantity: '2', amount: '40 Birr'),
        QuantityAmount(quantity: '3', amount: '60 Birr'),
        QuantityAmount(quantity: '4', amount: '80 Birr'),
        QuantityAmount(quantity: '5', amount: '100 Birr'),
        QuantityAmount(quantity: '6', amount: '120 Birr'),
        QuantityAmount(quantity: '7', amount: '140 Birr'),
        QuantityAmount(quantity: '8', amount: '160 Birr'),
     
      ],
    ),
    FoodItem(
      name: 'Soda',
      image: 'assets/soda.jpeg',
      quantities: [
        QuantityAmount(quantity: '0', amount: '0 Birr'),
        QuantityAmount(quantity: '1', amount: '15 Birr'),
        QuantityAmount(quantity: '2', amount: '30 Birr'),
        QuantityAmount(quantity: '3', amount: '45 Birr'),
        QuantityAmount(quantity: '4', amount: '60 Birr'),
        QuantityAmount(quantity: '5', amount: '75 Birr'),
        QuantityAmount(quantity: '6', amount: '90 Birr'),
        QuantityAmount(quantity: '7', amount: '105 Birr'),
        QuantityAmount(quantity: '8', amount: '120 Birr'),
        
      ],
    ),
    FoodItem(
      name: 'Water',
      image: 'assets/water.jpeg',
      quantities: [
        QuantityAmount(quantity: '0', amount: '0 Birr'),
        QuantityAmount(quantity: '1', amount: '15 Birr'),
        QuantityAmount(quantity: '2', amount: '30 Birr'),
        QuantityAmount(quantity: '3', amount: '45 Birr'),
        QuantityAmount(quantity: '4', amount: '60 Birr'),
        QuantityAmount(quantity: '5', amount: '75 Birr'),
        QuantityAmount(quantity: '6', amount: '90 Birr'),
        QuantityAmount(quantity: '7', amount: '105 Birr'),
        QuantityAmount(quantity: '8', amount: '120 Birr'),
       
      ],
    ),
    FoodItem(
      name: 'Fries',
      image: 'assets/burgar.jpeg',
      quantities: [
        QuantityAmount(quantity: '0', amount: '0 Birr'),
        QuantityAmount(quantity: '1', amount: '20 Birr'),
        QuantityAmount(quantity: '2', amount: '40 Birr'),
        QuantityAmount(quantity: '3', amount: '60 Birr'),
        QuantityAmount(quantity: '4', amount: '80 Birr'),
        QuantityAmount(quantity: '5', amount: '100 Birr'),
        QuantityAmount(quantity: '6', amount: '120 Birr'),
        QuantityAmount(quantity: '7', amount: '140 Birr'),
        QuantityAmount(quantity: '8', amount: '160 Birr'),
        
      ],
    ),
    FoodItem(
      name: 'Kolo',
      image: 'assets/kolo.jpeg',
      quantities: [
        QuantityAmount(quantity: '0', amount: '0 Birr'),
        QuantityAmount(quantity: '1', amount: '10 Birr'),
        QuantityAmount(quantity: '2', amount: '20 Birr'),
        QuantityAmount(quantity: '3', amount: '30 Birr'),
        QuantityAmount(quantity: '4', amount: '40 Birr'),
        QuantityAmount(quantity: '5', amount: '50 Birr'),
        QuantityAmount(quantity: '6', amount: '60 Birr'),
        QuantityAmount(quantity: '7', amount: '70 Birr'),
        QuantityAmount(quantity: '8', amount: '80 Birr'),
       
      ],
    ),
    FoodItem(
      name: 'Chips',
      image: 'assets/chips.jpeg',
      quantities: [
        QuantityAmount(quantity: '0', amount: '0 Birr'),
        QuantityAmount(quantity: '1', amount: '15 Birr'),
        QuantityAmount(quantity: '2', amount: '30 Birr'),
        QuantityAmount(quantity: '3', amount: '45 Birr'),
        QuantityAmount(quantity: '4', amount: '60 Birr'),
        QuantityAmount(quantity: '5', amount: '75 Birr'),
        QuantityAmount(quantity: '6', amount: '90 Birr'),
        QuantityAmount(quantity: '7', amount: '105 Birr'),
        QuantityAmount(quantity: '8', amount: '120 Birr'),
        
      ],
    ),
  ];

  List<Map<String, dynamic>> selectedFoods = [];
  
  get selectedDay => null;
  
  get selectedTime => null;
  
  get seatArea => null;
  
  get adultTickets => null;

  void _updateSelectedFoods(String name, QuantityAmount? quantityAmount) {
    setState(() {
      if (quantityAmount != null && quantityAmount.quantity != '0') {
        selectedFoods.add({
          'name': name,
          'quantity': quantityAmount.quantity,
          'price': double.parse(quantityAmount.amount.split(' ')[0]),
        });
      } else {
        selectedFoods.removeWhere((food) => food['name'] == name);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Menu'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                return FoodListItem(
                  foodItem: foodItems[index],
                  onSelected: _updateSelectedFoods,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage()
                  ),
                );
              },
              child: Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }
}

class FoodItem {
  final String name;
  final String image;
  final List<QuantityAmount> quantities;

  FoodItem({
    required this.name,
    required this.image,
    required this.quantities,
  });
}

class QuantityAmount {
  final String quantity;
  final String amount;

  QuantityAmount({required this.quantity, required this.amount});
}

class FoodListItem extends StatefulWidget {
  final FoodItem foodItem;
  final Function(String, QuantityAmount?) onSelected;

  FoodListItem({required this.foodItem, required this.onSelected});

  @override
  _FoodListItemState createState() => _FoodListItemState();
}

class _FoodListItemState extends State<FoodListItem> {
  QuantityAmount? _selectedQuantityAmount;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.foodItem.image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.foodItem.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<QuantityAmount>(
                      hint: Text('Choose Quantity'),
                      value: _selectedQuantityAmount,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedQuantityAmount = newValue!;
                          widget.onSelected(widget.foodItem.name, _selectedQuantityAmount);
                        });
                      },
                      items: widget.foodItem.quantities.map((quantityAmount) {
                        return DropdownMenuItem<QuantityAmount>(
                          value: quantityAmount,
                          child: Text('${quantityAmount.quantity} - ${quantityAmount.amount}'),
                        );
                      }).toList(),
                      isExpanded: true,
                    ),
                  ),
                  if (_selectedQuantityAmount != null)
                    Text(
                      'Total: ${_selectedQuantityAmount!.amount}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
