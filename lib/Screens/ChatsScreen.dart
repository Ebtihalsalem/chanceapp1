import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../UI Components/BottomBar.dart';
import 'MyAccount.dart';
import 'SavedScreen.dart';
import 'TrianingDetils.dart';
import 'home.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  late TextEditingController value = TextEditingController();

  List<String> chats = ["hi", "welcome"];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        backgroundColor: const Color(0xffEFEFEF),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
            Container(
              height: 25,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top:4.0),
                    child: _buildHeaderTextTitle("Today", 8, FontWeight.bold),
                  )),
            ),
            const SizedBox(height: 22),
            Expanded(
              child: SizedBox(
                height: 500,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: chats.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: BubbleSpecialThree(
                              text: chats[index],
                              color: const Color(0xFFF59039),
                              tail: true,
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 90,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                            Theme(
                                data: ThemeData(
                                  colorScheme: const ColorScheme.light(
                                    primary: Color(0xFFF59039),
                                  ),
                                ),
                                child: SizedBox(
                                  width: 280,
                                  height: 45,
                                  child: TextField(
                                    controller: value,
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xFFF3F3F3),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                                ),
                          Container(
                              height: 40,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF59039),
                                  borderRadius: BorderRadius.circular(15)),
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      chats.add(value.text);
                                      value.text = "";
                                    });
                                  },
                                  icon: const Icon(
                                    EvaIcons.paperPlane,
                                    color: Colors.white,
                                  )))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: BottomBar(),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[200],
      title: Padding(
        padding: const EdgeInsets.only(top: 18, right: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "lib/images/acadimic.jpg",
              height: 25,
              width: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text("الاكاديمية الليبية",
                style: TextStyle(
                    fontFamily: "Tajawal",
                    fontSize: 16,
                    color: Color(0xFF4A4C4D),
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderText(
      String text, double fontSize, FontWeight fontWeight, Color fontColor) {
    return Text(
      text,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: "Tajawal",
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }

  Widget _buildHeaderTextTitle(
      String text, double fontSize, FontWeight fontWeight) {
    return Text(
      text,
      style: TextStyle(
        color: const Color(0xff4A4C4D),
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: "Tajawal",
      ),
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
    );
  }
}