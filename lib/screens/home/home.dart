import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallet_app/widget/CurrencyChart.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeMenu = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 18.0, left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          Image.asset("assets/image/face.png").image,
                      backgroundColor: Colors.transparent),
                  Text(
                    "My Balance",
                    style: TextStyle(
                        fontFamily: "Catamaran-Bold",
                        fontSize: 20,
                        color: Color(0xff565A76)),
                  ),
                  Container(
                    width: 42,
                    child: Stack(
                      children: <Widget>[
                        SvgPicture.asset(
                          "assets/icon/bell.svg",
                          width: 35,
                          color: Color(0xffD1D6F2),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 23,
                            height: 23,
                            decoration: BoxDecoration(
                                color: Color(0xff1FCD82),
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: Center(
                              child: Text("3",
                                  style: TextStyle(
                                      color: Color(0xffFDFEFE),
                                      fontFamily: "Catamaran-Bold",
                                      fontSize: 14)),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: size.height * 0.15,
              child: Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          '\$',
                          style: TextStyle(
                              fontFamily: "Catmaran-Bold",
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff42455D)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          '2,564.25',
                          style: TextStyle(
                              fontFamily: "Catmaran-Bold",
                              fontWeight: FontWeight.bold,
                              fontSize: 45,
                              color: Color(0xff42455D)),
                        ),
                      )
                    ],
                  ),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Updated  ",
                          style: TextStyle(
                              color: Color(0xffAFB2D6),
                              fontFamily: "Catmaran-Regular",
                              fontSize: 14),
                        ),
                        Text(
                          "20.03.2019 | 11:31",
                          style: TextStyle(
                              color: Color(0xff767999),
                              fontFamily: "Catmaran-Regular",
                              fontSize: 15),
                        )
                      ],
                    ),
                  )
                ],
              )),
            ),
            Expanded(
              child: ListView(
                children: List.generate(10, (i) {
                  return buildItem(
                      iconColor: [
                        Color(0xffFF802B),
                        Color(0xff627EEB),
                        Color(0xff3CAF54),
                        Color(0xffF3BA30)
                      ][i % 3],
                      icon: "assets/icon/bitcoin-sign.svg",
                      name1: "Bitcoin",
                      name2: "BTC",
                      chartColor: Color(0xffD7BAFF),
                      chartData: List.generate(10 + Random().nextInt(8), (x) {
                        return 5.0 + Random().nextInt(20);
                      }),
                      price: "${Random().nextInt(10000)}.00",
                      grow: "+ ${Random().nextInt(100)}.0%");
                }),
              ),
            )
          ],
        ),
      ),
      bottomSheet: Container(
          width: double.maxFinite,
          height: size.height * 0.095,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, -2),
                    blurRadius: 5,
                    spreadRadius: 5,
                    color: Color(0xffE6E2FF).withOpacity(0.3))
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: FractionallySizedBox(
            widthFactor: 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "menuMain.svg",
                "menuWallet.svg",
                "menuDollar.svg",
                "menuSettings.svg"
              ]
                  .asMap()
                  .map((i, item) {
                    Color _color = [
                      Colors.blue,
                      Colors.brown,
                      Colors.yellow,
                      Colors.grey[850]
                    ][i];
                    return MapEntry(
                        i,
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              activeMenu=i;
                            });
                          },
                          child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              child: SvgPicture.asset("assets/icon/$item",
                                  color: activeMenu == i ? _color : Colors.grey,
                                  width: 28 )),
                        ));
                  })
                  .values
                  .toList(),
            ),
          )),
    );
  }

  Widget buildItem(
      {Color iconColor,
      String icon,
      String name1,
      String name2,
      String price,
      String grow,
      Color chartColor,
      List<double> chartData}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: FractionallySizedBox(
        widthFactor: 0.93,
        child: Center(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xffE6E2FF).withOpacity(0.20),
                      blurRadius: 6,
                      spreadRadius: 8)
                ]),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 10),
                  child: FractionallySizedBox(
                    widthFactor: 0.88,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    color: iconColor.withOpacity(0.25),
                                    offset: Offset(0, 2),
                                    blurRadius: 7,
                                    spreadRadius: 3)
                              ], borderRadius: BorderRadius.circular(25)),
                              child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: iconColor,
                                  child: SvgPicture.asset(
                                    icon,
                                    width: 27,
                                    color: Colors.white,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    name1,
                                    style: TextStyle(
                                        color: Color(0xff686E90),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Catamaran-Bold",
                                        fontSize: 16),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Container(
                                      child: Text(
                                        name2,
                                        style: TextStyle(
                                            color: Color(0xff9294B8),
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Catamaran-Bold",
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 50,
                          child: Stack(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                price,
                                style: TextStyle(
                                    color: Color(0xff686E90),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Catamaran-Bold",
                                    fontSize: 20),
                              ),
                              Positioned(
                                top: 24,
                                right: 0,
                                child: Text(
                                  grow,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Color(0xff2ACC87),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Catamaran-Light",
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    width: double.maxFinite,
                    child: CustomPaint(
                      painter:
                          CurrencyChart(color: chartColor, data: chartData),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
