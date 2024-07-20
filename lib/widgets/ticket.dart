
import 'package:flutter/material.dart';
import 'homepage.dart'; 
import 'seat.dart'; 
import 'concessions.dart'; 

class MovieSchedule {
  final String movieName;
  final List<String> showDays;
  final List<String> showTimes;
  final String imagePath;

  MovieSchedule({
    required this.movieName,
    required this.showDays,
    required this.showTimes,
    required this.imagePath,
  });
}
class MovieSchedulePage extends StatelessWidget {
  final List<MovieSchedule> schedules;

  MovieSchedulePage({required this.schedules});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Schedules'),
      ),
      body: ListView.builder(
        itemCount: schedules.length,
        itemBuilder: (context, index) {
          return MovieScheduleItem(schedule: schedules[index]);
        },
      ),
    );
  }
}
class MovieScheduleItem extends StatefulWidget {
  final MovieSchedule schedule;

  MovieScheduleItem({required this.schedule});

  @override
  _MovieScheduleItemState createState() => _MovieScheduleItemState();
}

class _MovieScheduleItemState extends State<MovieScheduleItem> {
  String selectedSeatArea = 'Standard';
  String selectedDay = '';
  String selectedTime = '';
  int adultTicketQuantity = 0;
  int childTicketQuantity = 0;

  List<int> quantities = List<int>.generate(11, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(widget.schedule.imagePath),
              SizedBox(height: 10),
              Text('Movie: ${widget.schedule.movieName}', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('Show Times:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Column(
                children: widget.schedule.showDays.map((day) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(day, style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Wrap(
                        children: widget.schedule.showTimes.map((time) {
                          bool isSelected = selectedDay == day && selectedTime == time;
                          return Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: ChoiceChip(
                              label: Text(time),
                              selected: isSelected,
                              onSelected: (selected) {
                                setState(() {
                                  selectedDay = day;
                                  selectedTime = time;
                                });
                              },
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 10),
                    ],
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              Text('Seat Area:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              DropdownButton<String>(
                value: selectedSeatArea,
                onChanged: (value) {
                  setState(() {
                    selectedSeatArea = value!;
                  });
                },
                items: ['Standard', 'Sofa', 'Premier'].map((area) {
                  return DropdownMenuItem<String>(
                    value: area,
                    child: Text(area),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              Table(
                border: TableBorder.all(),
                columnWidths: {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                },
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Ticket Type', style: TextStyle(fontWeight: FontWeight.bold, backgroundColor: Colors.grey)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Price', style: TextStyle(fontWeight: FontWeight.bold, backgroundColor: Colors.grey)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold, backgroundColor: Colors.grey)),
                      ),
                    ],
                  ),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Adult'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('120.00 birr'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: DropdownButton<int>(
                        value: adultTicketQuantity,
                        onChanged: (value) {
                          setState(() {
                            adultTicketQuantity = value!;
                          });
                        },
                        items: quantities.map((quantity) {
                          return DropdownMenuItem<int>(
                            value: quantity,
                            child: Text(quantity.toString()),
                          );
                        }).toList(),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Child'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                     child: Text('100.00 birr'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: DropdownButton<int>(
                        value: childTicketQuantity,
                        onChanged: (value) {
                          setState(() {
                            childTicketQuantity = value!;
                          });
                        },
                        items: quantities.map((quantity) {
                          return DropdownMenuItem<int>(
                            value: quantity,
                            child: Text(quantity.toString()),
                          );
                        }).toList(),
                      ),
                    ),
                  ]),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (selectedDay.isNotEmpty &&
                          selectedTime.isNotEmpty &&
                          (adultTicketQuantity > 0 || childTicketQuantity > 0)) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SeatGridView(
                              adultTicketQuantity: adultTicketQuantity,
                              childTicketQuantity: childTicketQuantity,
                              totalSeats: 35,
                              selectedSeats: 0,
                              onSeatSelected: (int) {},
                              totalseat: 35,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please enter the required information.'),
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
        ),
      ),
    );
  }
}
class ExtrasPage extends StatelessWidget {
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
               
              ],
            ),
          ],
        ),
      ),
    );
  }
}
