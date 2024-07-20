import 'package:abyssinia_tickets/widgets/concessions.dart';
import 'package:abyssinia_tickets/widgets/login.dart';
import 'package:abyssinia_tickets/widgets/moviedetails.dart';
import 'package:abyssinia_tickets/widgets/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((User? user) {
      setState(() {
        _user = user;
      });
    });
  }

  void _signOut() async {
    await _auth.signOut();
    setState(() {
      _user = null; 
    });
  }

  void _changePassword() async {
    // Implement password change functionality here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light,//the color of status bar
        elevation: 0,//removes shadow under appbar
        leading: PopupMenuButton(
          icon: Icon(Icons.menu, color: Colors.black87),
          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
            PopupMenuItem(
              child: Row(
                children: [
                  Icon(Icons.home, color: Colors.black87),
                  SizedBox(width: 8),
                  Text('Home'),
                ],
              ),
              onTap: () {
                
              },
            ),
            PopupMenuItem(
              child: Row(
                children: [
                  Icon(Icons.movie, color: Colors.black87),
                  SizedBox(width: 8),
                  Text('Movies'),
                ],
              ),
              onTap: () {
                
              },
            ),
            PopupMenuItem(
              child: Row(
                children: [
                  Icon(Icons.food_bank, color: Colors.black87),
                  SizedBox(width: 8),
                  Text('Food & Drinks'),
                ],
              ),
              onTap: () {
               
              },
            ),
            PopupMenuItem(
              child: Row(
                children: [
                  Icon(Icons.airplane_ticket, color: Colors.black87),
                  SizedBox(width: 8),
                  Text('Tickets'),
                ],
              ),
              onTap: () {
               
              },
            ),
          ],
        ),
        actions: _user == null
            ? [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text('Login', style: TextStyle(color: Colors.black)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text('Signup', style: TextStyle(color: Colors.black)),
                ),
              ]
            : [
                IconButton(
                  icon: Icon(Icons.favorite, color: Colors.brown, size: 30),
                  onPressed: () {
                  
                  },
                ),
                Stack(
                  children: [
                    IconButton(
                      icon: Icon(Icons.notifications, color: Colors.brown),
                      onPressed: () {
                        
                      },
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '3', 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SingleChildScrollView(
                         child: Container(
                          
                          padding: EdgeInsets.all(20),
                          
                          child: Column(
                          
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Account Settings',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Logged in as: ${_user!.email}',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10),
                              TextButton(
                                onPressed: () {
                                  
                                },
                                child: Text('Change Profile Picture'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Implement profile picture deletion functionality
                                },
                                child: Text('Delete Profile Picture'),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Change Password',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Old Password',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'New Password',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: _changePassword,
                                child: Text('Save Password'),
                              ),
                            ],
                          ),
                        ),
                        );
                      },
                    );
                  },
                  child: Transform.scale(
                    scale: 0.7,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/helu+.jpg'),
                      radius: 35,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: _signOut,
                ),
              ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(35)),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Buy Your Tickets  ",
                      style: TextStyle(color: Colors.brown, fontSize: 30),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      " Online",
                      style: TextStyle(color: Colors.green, fontSize: 40),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(244, 243, 243, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search, color: Colors.white),
                          hintText: "SEARCH MOVIES",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Now Showing",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 230,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _buildMovieCard('assets/teza.jpeg', 'Teza', '2008', 'Cast 1, Cast 2, Cast 3', 'Director 1', '4.5', 'Description of Teza'),
                          _buildMovieCard('assets/yechewalij.jpeg', 'YechewaLij', '2009', 'Cast1', 'Director 1', '4.6', 'Description of yechewa lij'),
                          _buildMovieCard('assets/aemaria.jpeg', 'Aemaria', '2010', 'Cast1', 'Director1', '4.8', 'Description of Aemaria'),
                          _buildMovieCard('assets/grumkal.jpeg', 'GrumKal', '2012', 'Cast 1', 'Director 2', '4.7', 'Description of Grumkal'),
                          _buildMovieCard('assets/mnalesh.jpeg', 'Mnalesh', '2012', 'Cast1', 'Director 1', '4.3', 'Description of Mnalesh'),
                          // Add more movie cards here
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 230,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _buildMovieCard('assets/yezore.jpeg', 'Yezore', '2016', 'cast1', 'director 1', '4.9', 'description of Yezore'),
                          _buildMovieCard('assets/hagere.jpeg', 'Hagere', '2017', 'cast1', 'director 1', '4.7', 'description of hagere'),
                          _buildMovieCard('assets/kidamegebeya.jpeg', 'KidameGebeya', '2019', 'cast1, cast2', 'Director 1, Director 2', '4.1', 'Description of Kidame gebeya'),
                          _buildMovieCard('assets/yikrta.jpeg', 'Yikrta', '2016', 'cast1, cast2, cast3 ', 'Director 1, Director 2, Director 3', '5.0', 'Description of yikrta'),
                          _buildMovieCard('assets/lebaenaleba.jpeg', 'Lebaenaleba', '2016', 'cast1, cast2, cast3 ', 'Director 1, Director 2, Director 3', '5.0', 'Description of yikrta'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 230,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _buildMovieCard('assets/yeregefefkr.jpeg', 'Yikrta', '2016', 'cast1, cast2, cast3 ', 'Director 1, Director 2, Director 3', '5.0', 'Description of yikrta'),
                          _buildMovieCard('assets/yikrta.jpeg', 'Yikrta', '2016', 'cast1, cast2, cast3 ', 'Director 1, Director 2, Director 3', '5.0', 'Description of yikrta'),
                          _buildMovieCard('assets/aratnetb.jpeg', 'Yikrta', '2016', 'cast1, cast2, cast3 ', 'Director 1, Director 2, Director 3', '5.0', 'Description of yikrta'),
                          _buildMovieCard('assets/azmera.jpeg', 'Yikrta', '2016', 'cast1, cast2, cast3 ', 'Director 1, Director 2, Director 3', '5.0', 'Description of yikrta'),
                          _buildMovieCard('assets/fkrenladen.jpeg', 'Yikrta', '2016', 'cast1, cast2, cast3 ', 'Director 1, Director 2, Director 3', '5.0', 'Description of yikrta'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            label: 'Coming soon',
            icon: Icon(Icons.movie),
            backgroundColor: Colors.black,
          ),
         
          BottomNavigationBarItem(
            label: 'Tickets',
            icon: Icon(Icons.airplane_ticket),
            backgroundColor: Colors.black,
          ),
        ],
        
      ),
    );
  }

  Widget _buildMovieCard(String imagePath, String movieName, String releaseYear, String cast, String director, String rating, String description) {
    return AspectRatio(
      aspectRatio: 2.63 / 3,
      child: Container(
        margin: EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(imagePath),
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  stops: [0.4, 0.9],
                  colors: [
                    Color.fromARGB(255, 141, 116, 147).withOpacity(0.8),
                    Color.fromARGB(205, 255, 0, 0).withOpacity(0.1)
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 1,
              left: 5,
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow,),
                  SizedBox(width: 3),
                  Text(rating),
                ],
              ),
            ),
            Positioned(
              bottom: 5,
              left: 25,
              right: 5,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 0.6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      // Navigate to MovieDetailPage when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailPage(
                            imagePath: imagePath,
                            movieName: movieName,
                            description: description,
                            releaseYear: releaseYear,
                            cast: cast,
                            director: director,
                            rating: rating,
                          ),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.black.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 35),
                      child: Text(
                        'See Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

