import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  final String movieName;
  final int adultTickets;
  final int childTickets;
  final List<Map<String, dynamic>> selectedFoods;
  final String imagePath;

  OrderDetailsPage({
    required this.movieName,
    required this.adultTickets,
    required this.childTickets,
    required this.selectedFoods,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    double totalTicketPrice = adultTickets * 10.0 + childTickets * 5.0;
    double totalFoodPrice = selectedFoods.fold(0, (sum, food) => sum + food['price']);
    double totalPrice = totalTicketPrice + totalFoodPrice;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              movieName,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Adult Tickets: $adultTickets'),
            Text('Child Tickets: $childTickets'),
            SizedBox(height: 16.0),
            Text(
              'Selected Concessions:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...selectedFoods.map((food) => Text('${food['name']} - \$${food['price']}')),
            SizedBox(height: 16.0),
            Text(
              'Total Price: \$${totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                },
                child: Text('Confirm Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
