import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String label;
  final String sponsor;
  final int capacity;
  final String eventPoster;
  final String profilePic;
  const EventCard(
      {Key? key,
      required this.label,
      required this.sponsor,
      required this.capacity,
      required this.eventPoster,
      required this.profilePic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      margin: EdgeInsets.all(width * .05),
      child: Stack(
        children: [
          InkWell(
            onTap: () => Container(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(24),
                      topLeft: Radius.circular(24),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(eventPoster),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: const Text.rich(
                    TextSpan(
                      text: 'TODAY',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
                      children: [
                        TextSpan(
                          text: ' 8:00 OM',
                          style: TextStyle(color: Colors.deepOrangeAccent),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 8),
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  padding: const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(profilePic),
                        radius: 13,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text.rich(
                          TextSpan(
                            text: sponsor,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w900),
                            children: const [
                              TextSpan(
                                text: ' Sponsor',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.person,
                        color: Colors.blueGrey[300],
                        size: 18,
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 15),
                        child: Text.rich(
                          TextSpan(
                            text: '0',
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w900),
                            children: [
                              TextSpan(
                                text: '/$capacity',
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 125,
            right: 40,
            child: GestureDetector(
              onTap: () => Container(),
              child: Container(
                padding: const EdgeInsets.only(left: 17, right: 17),
                width: 110,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(14)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.calendar_today_outlined,
                        color: Colors.white, size: 26),
                    Text('Join',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
