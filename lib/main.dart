import 'dart:ui';

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
  var selectedIndex = 0;
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
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 90,
              width: width * .8,
            ),
          ],
        ),
      ),
      //bottomNavigationBar: BottomNavigationBar(

      //items: const [],
      //),
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
      margin: const EdgeInsets.only(left: 15, right: 10, top: 15),
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
