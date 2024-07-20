import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:abyssinia_tickets/widgets/ticket.dart';
import 'package:abyssinia_tickets/widgets/login.dart'; // Import the LoginPage

class MovieDetailPage extends StatefulWidget {
  final String imagePath;
  final String movieName;
  final String releaseYear;
  final String cast;
  final String director;
  final String rating;
  final String description;

  MovieDetailPage({
    required this.imagePath,
    required this.movieName,
    required this.releaseYear,
    required this.cast,
    required this.director,
    required this.rating,
    required this.description,
  });

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final TextEditingController _commentController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<String> comments = [
    'Good movie! Keep it up.',
    'Awesome!',
    'Loved it!',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movieName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(widget.imagePath),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.movieName,
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text('Release Year: ${widget.releaseYear}'),
                  SizedBox(height: 8.0),
                  Text('Cast: ${widget.cast}'),
                  SizedBox(height: 8.0),
                  Text('Director: ${widget.director}'),
                  SizedBox(height: 8.0),
                  Text('Rating: ${widget.rating}'),
                  SizedBox(height: 16.0),
                  Text('Description:'),
                  Text(widget.description),
                  SizedBox(height: 16.0),
                  _buildGetTicketsButton(),
                  SizedBox(height: 16.0),
                   _buildCommentSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGetTicketsButton() {
    if (_auth.currentUser == null) {
      return Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            elevation: 0,
          ),
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.brown, Colors.purple, Colors.blue, Colors.lightGreen],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(
                minHeight: 50,
                minWidth: 200,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.login, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Log in to get the tickets',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieScheduleItem(
                schedule: MovieSchedule(
                  movieName: widget.movieName,
                  showDays: ['Monday', 'Tuesday', 'Wednesday'],
                  showTimes: ['12:00 PM', '3:00 PM', '6:00 PM'],
                  imagePath: widget.imagePath,
                ),
              ),
            ),
          );
        },
       child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.brown, Colors.purple, Colors.blue, Colors.lightGreen],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(
                minHeight: 50,
                minWidth: 200,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.login, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Get Tickets',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      
      
      
       
    }
  }
  Widget _buildCommentSection() {
    if (_auth.currentUser == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text('Comments List:'),
          SizedBox(height: 8.0),
          ...comments.map((comment) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(comment),
              )),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _commentController,
            decoration: InputDecoration(
              hintText: 'Write your comment...',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              contentPadding: EdgeInsets.all(10.0),
            ),
            maxLines: 3,
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              if (_commentController.text.isNotEmpty) {
                setState(() {
                  comments.add(_commentController.text);
                  _commentController.clear();
                });
              }
            },
            
            child: Text('Post Comment'),
          ),
          SizedBox(height: 16.0),
          Text('Comments List:'),
          SizedBox(height: 8.0),
          ...comments.map((comment) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(comment),
              )),
        ],
      );
    }
  }

  
  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}

