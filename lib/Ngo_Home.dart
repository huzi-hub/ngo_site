// ignore_for_file: file_names, prefer_const_constructors

import './donationRequest.dart';
import './donationHistory.dart';
import 'package:flutter/material.dart';
import './alertPopup.dart';
import './warehouseStorage.dart';

class Ngo_Home extends StatefulWidget {
  final storage;
  final ngo_Id;
  Ngo_Home(this.storage, this.ngo_Id);
  @override
  State<Ngo_Home> createState() => Ngo_HomeState();
}

class Ngo_HomeState extends State<Ngo_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              children: [
                Container(
                  child: Container(
                    height: 130,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 0, 30.0),
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            height: 90,
                            color: Colors.blue[800],
                            child: Row(
                              children: [
                                CircleAvatar(
                                  maxRadius: 45,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    maxRadius: 40,
                                    backgroundImage:
                                        AssetImage('assets/images.png'),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                                  height: 80,
                                  width: 190,
                                  child: ListTile(
                                    title: Text(
                                      "Hello There!",
                                      style: TextStyle(
                                        fontSize: 26,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                    color: Colors.blue[800],
                  ),
                ),
              ],
            ),
            color: Colors.blue[800],
          ),
          GridView.count(
            crossAxisCount: 2,
            primary: false,
            crossAxisSpacing: 3.0,
            mainAxisSpacing: 4.0,
            shrinkWrap: true,
            children: <Widget>[
              buildCard(
                  'assets/pic.jpg', 1, 'Donation Request', DonationRequest()),
              buildCard(
                  'assets/1.jpeg',
                  2,
                  'Ask For Donation',
                  AlertPopup(
                      'Ask Donation',
                      'Ask Donation',
                      'Press "Ask" for Ask donations from nearby donors',
                      'Cancel',
                      'Ask')),
              buildCard('assets/ngo1.jpg', 3, 'WareHouse Storage',
                  WarehouseStorage(widget.storage)),
              buildCard('assets/ngo.jpg', 4, 'Donation Records',
                  DonartionHistory(widget.ngo_Id)),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCard(
      String images, int cardIndex, String optionName, Widget nextPage) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 7.0,
          child: Column(
            children: <Widget>[
              Stack(children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.41,
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(images), //NetworkImage(
                        //'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ16dmjgu3tnmRuZPvwh7ZiUMNRNV90ysUpTA&usqp=CAU')
                      )),
                ),
              ]),
              // Text(
              //   address,
              //   style: TextStyle(
              //       fontFamily: 'Quicksand',
              //       fontWeight: FontWeight.bold,
              //       fontSize: 12.0,
              //       color: Colors.grey),
              // ),
              // SizedBox(height: 20.0),
              Expanded(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.blue[800],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                      ),
                      child: Center(
                          child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => nextPage));
                        },
                        child: Text(
                          optionName,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Quicksand',
                          ),
                        ),
                      ))))
            ],
          ),
          margin: cardIndex.isEven
              ? EdgeInsets.fromLTRB(10.0, 0.0, 25.0, 10.0)
              : EdgeInsets.fromLTRB(25.0, 0.0, 5.0, 10.0)),
    );
  }
}
