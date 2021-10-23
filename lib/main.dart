import 'dart:ui';

import 'package:animations_study/widgets/event_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clone de alguma coisa',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: const Color(0xFFff7539),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  String drinkImg =
      'https://t2.rg.ltmcdn.com/pt/images/6/2/8/drink_cubano_feito_com_rum_e_hortela_9826_600.jpg';
  var profilePic =
      'https://scontent.ffor9-1.fna.fbcdn.net/v/t1.6435-9/30728441_1029528040518396_5779818295741906944_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=CayPwwBr5y8AX89XzJH&_nc_ht=scontent.ffor9-1.fna&oh=b851bc2fc23547f31b2adf2121e9ab91&oe=619569D1';
  bool _showNotch = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    List categories = ['Recommend', 'Wine Bureau', 'Dinner Party', 'Rodizio'];
    return Scaffold(
      appBar: _bigAppBar(height, width, context),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment(0.3, 0.0),
              colors: [Colors.grey, Colors.white]),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 35,
              child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    margin: const EdgeInsets.only(left: 10),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: index == selectedIndex
                            ? Colors.grey[200]
                            : Colors.white,
                      ),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: index == selectedIndex
                              ? FontWeight.bold
                              : FontWeight.w200,
                          color: index == selectedIndex
                              ? Colors.black
                              : Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            selectedIndex == 0
                ? EventCard(
                    capacity: 10,
                    eventPoster: 'assets/images/drink_img.jpg',
                    label: "Don't Get Drunk Today",
                    profilePic: profilePic,
                    sponsor: 'Nathan',
                  )
                : Container(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Event',
        onPressed: () {},
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 0,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 15,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: const _BottomAppBar(
        fabLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
  }
}

_bigAppBar(heigth, width, ctx) {
  var profilePic =
      'https://scontent.ffor9-1.fna.fbcdn.net/v/t1.6435-9/30728441_1029528040518396_5779818295741906944_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=CayPwwBr5y8AX89XzJH&_nc_ht=scontent.ffor9-1.fna&oh=b851bc2fc23547f31b2adf2121e9ab91&oe=619569D1';
  return PreferredSize(
    child: Container(
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(profilePic),
                radius: 25,
              ),
              const Spacer(),
              const Icon(
                Icons.notifications_outlined,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 103,
                  ),
                  Image.asset(
                    'assets/images/line.png',
                    height: 70,
                    width: 240,
                    alignment: Alignment.bottomLeft,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 8.0),
                child: const Text('Every Party Will Reap Different Happiness',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      fontFamily: 'Oswald',
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    overflow: TextOverflow.clip),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              SizedBox(
                height: 55,
                width: width * .65,
                child: const TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Search',
                    hintStyle: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5),
                width: width * .15,
                height: 54,
                decoration: BoxDecoration(
                  color: Theme.of(ctx).primaryColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.multiple_stop_rounded,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    preferredSize: Size.fromHeight(heigth * 0.45),
  );
}

class _BottomAppBar extends StatefulWidget {
  final FloatingActionButtonLocation fabLocation;

  const _BottomAppBar({
    Key? key,
    required this.fabLocation,
  }) : super(key: key);

  @override
  State<_BottomAppBar> createState() => _BottomAppBarState();
}

class _BottomAppBarState extends State<_BottomAppBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.white,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Container(
          padding: const EdgeInsets.only(right: 30, left: 30),
          height: 70,
          child: Row(
            children: [
              GestureDetector(
                onTap: () => setState(() {
                  _selectedIndex = 0;
                }),
                child: Container(
                  width: _selectedIndex == 0 ? 100 : 70,
                  height: 50,
                  decoration: BoxDecoration(
                      color:
                          _selectedIndex == 0 ? Colors.grey[200] : Colors.white,
                      borderRadius: BorderRadius.circular(14)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.home_filled,
                          color:
                              _selectedIndex == 0 ? Colors.black : Colors.grey,
                          size: 26),
                      Text(
                        _selectedIndex == 0 ? 'Home' : '',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  _selectedIndex = 1;
                }),
                child: Container(
                  width: _selectedIndex == 1 ? 100 : 70,
                  height: 50,
                  decoration: BoxDecoration(
                      color:
                          _selectedIndex == 1 ? Colors.grey[200] : Colors.white,
                      borderRadius: BorderRadius.circular(14)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Icon(Icons.credit_card_outlined,
                            color: _selectedIndex == 1
                                ? Colors.black
                                : Colors.grey,
                            size: 26),
                      ),
                      Text(
                        _selectedIndex == 1 ? 'Wallet' : '',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  _selectedIndex = 2;
                }),
                child: Container(
                  width: _selectedIndex == 2 ? 100 : 70,
                  height: 50,
                  decoration: BoxDecoration(
                      color:
                          _selectedIndex == 2 ? Colors.grey[200] : Colors.white,
                      borderRadius: BorderRadius.circular(14)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.chat_bubble_outline,
                          color:
                              _selectedIndex == 2 ? Colors.black : Colors.grey,
                          size: 26),
                      Text(
                        _selectedIndex == 2 ? 'Chats' : '',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  _selectedIndex = 3;
                }),
                child: Container(
                  width: _selectedIndex == 3 ? 100 : 70,
                  height: 50,
                  decoration: BoxDecoration(
                      color:
                          _selectedIndex == 3 ? Colors.grey[200] : Colors.white,
                      borderRadius: BorderRadius.circular(14)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.person_outline,
                          color:
                              _selectedIndex == 3 ? Colors.black : Colors.grey,
                          size: 26),
                      Text(
                        _selectedIndex == 3 ? 'Profile' : '',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
