import 'package:flutter/material.dart';
import 'concessions.dart'; // Import the concessions page
class SeatGridView extends StatefulWidget {
  final int totalSeats;
  final int adultTicketQuantity;
  final int childTicketQuantity;
  final Function(int) onSeatSelected; 

  SeatGridView({
    required this.totalSeats,
    required this.adultTicketQuantity,
    required this.childTicketQuantity,
    required this.onSeatSelected, required int selectedSeats, required int totalseat,
  });

  @override
  _SeatGridViewState createState() => _SeatGridViewState();
}

class _SeatGridViewState extends State<SeatGridView> {
  List<SeatState> seatStates = [];
  int totalSelectedSeats = 0;
  
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.totalSeats; i++) {
      seatStates.add(SeatState.available);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Seats'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Select Your Seats',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemCount: widget.totalSeats,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _onSeatTap(index);
                  },
                  child: _buildSeat(index),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (totalSelectedSeats == widget.adultTicketQuantity + widget.childTicketQuantity) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExtrasPage(
                          adultTicketQuantity: widget.adultTicketQuantity,
                          childTicketQuantity: widget.childTicketQuantity,
                          selectedSeats: seatStates
                              .asMap()
                              .entries
                              .where((entry) => entry.value == SeatState.selected)
                              .map((entry) => entry.key)
                              .toList(), movieName: '',
                        ),
                        
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please select ${widget.adultTicketQuantity + widget.childTicketQuantity} seats.'),
                      ),
                    );
                  }
                },
                child: Text('Continue'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSeat(int index) {
    SeatState state = seatStates[index];
    Color color = _getColorForSeat(state);
    IconData icon = _getIconForSeat(state);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  Color _getColorForSeat(SeatState state) {
    switch (state) {
      case SeatState.booked:
        return Colors.red;
      case SeatState.selected:
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  IconData _getIconForSeat(SeatState state) {
    switch (state) {
      case SeatState.booked:
        return Icons.event_seat;
      case SeatState.selected:
        return Icons.event_seat;
      default:
        return Icons.event_seat;
    }
  }

  void _onSeatTap(int index) {
    if (seatStates[index] == SeatState.available) {
      setState(() {
        if (totalSelectedSeats < widget.adultTicketQuantity + widget.childTicketQuantity) {
          seatStates[index] = SeatState.selected;
          totalSelectedSeats++;
          widget.onSeatSelected(totalSelectedSeats);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('You can only select ${widget.adultTicketQuantity + widget.childTicketQuantity} seats.'),
            ),
          );
        }
      });
    } else if (seatStates[index] == SeatState.selected) {
      setState(() {
        seatStates[index] = SeatState.available;
        totalSelectedSeats--;
        widget.onSeatSelected(totalSelectedSeats);
      });
    }
  }
}

enum SeatState {
  booked,
  selected,
  available,
}
class ExtrasPage extends StatelessWidget {
  final int adultTicketQuantity;
  final int childTicketQuantity;
  final List<int> selectedSeats;
  final String movieName; 

  ExtrasPage({
    required this.adultTicketQuantity,
    required this.childTicketQuantity,
    required this.selectedSeats,
    required this.movieName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Extras'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Selected Seats: ${selectedSeats.join(', ')}'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Extras(
                    movieName: movieName, 
                    adultTickets: adultTicketQuantity,
                    childTickets: childTicketQuantity,
                    imagePath: 'example_image_path', 
                    selectedSeats: selectedSeats,
                  ),
                ),
              );
            },
            child: Text('Select Concessions'),
          ),
        ],
      ),
    );
  }
}

        
/*class ExtrasPage extends StatelessWidget {
  final String movieName;
  final String selectedDay;
  final String selectedTime;
  final String seatArea;
  final int adultTicketQuantity;
  final int childTicketQuantity;
  final List<Map<String, dynamic>> selectedFoods;

  ExtrasPage({
    required this.movieName,
    required this.selectedDay,
    required this.selectedTime,
    required this.seatArea,
    required this.adultTicketQuantity,
    required this.childTicketQuantity,
    required this.selectedFoods,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selected Movie: $movieName'),
            Text('Show Day: $selectedDay'),
            Text('Show Time: $selectedTime'),
            Text('Selected Seat Area: $seatArea'),
            Text('Adult Tickets: $adultTicketQuantity'),
            Text('Child Tickets: $childTicketQuantity'),
            // Display selected concessions here
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Previous'),
                ),
               /* ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ConcessionsPage()),
                    );
                  },
                  child: Text('Continue'),
                ),
                */
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/
