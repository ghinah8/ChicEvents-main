import 'package:chic_events/const.dart';
import 'package:chic_events/firebase_options.dart';
import 'package:chic_events/screens/onbourding_screen.dart';
import 'package:chic_events/screens/profile.dart';
import 'package:chic_events/screens/signin_page.dart';
import 'package:chic_events/screens/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  static String id = 'homepage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _currentIndex = 0;
  List<Widget> _pages = [
    HomePage(),
    FavoritesScreen(),
    CartScreen(),
    Myprofile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: color3,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Positioned.fill(
              child: Image.asset(
                'assets/images/134_floral copy.jpg', // Replace with the actual image URL
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            bottom: 16.0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'List of Pictures',
                    style: TextStyle(
                      color: color1,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        backgroundColor: color3,
                        child: Icon(Icons.image),
                      ),
                      title: Text('Image ${index + 1}'),
                      onTap: () {
                        Navigator.pushNamed(
                            context, 'assets/images/134_floral copy.jpg');
                      },
                    ),
                  ),
                  SizedBox(height: 16.0),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: double.infinity,
                    height: 50.0,
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, 'assets/images/134_floral copy.jpg');
                      },
                      backgroundColor: color3,
                      child: Text(
                        'Create Your Event',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks),
            label: 'Tools',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: color2,
        unselectedItemColor: color4,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Favorites Screen'),
    );
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Cart Screen'),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Checevents());
}

class GetStart1 extends StatelessWidget {
  const GetStart1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff4b173d),
    );
  }
}

class Checevents extends StatelessWidget {
  const Checevents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        signinpag.id: (context) => signinpag(),
        signupag.id: (context) => signupag(),
        EditProfile.id1: (context) => EditProfile(),
        support.id3: (context) => support(),
        Payment.id2: (context) => Payment(),
        HomePage.id: (context) => HomePage(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'signinpag',
      home: HomePage(),
    );
  }
}
