import 'package:chanceapp/Core/App_theme.dart';
import 'package:chanceapp/UI%20Components/textFieldWithoutIcon.dart';
import 'package:flutter/material.dart';
import '../UI Components/BuildText.dart';

class AddCv extends StatefulWidget {

  final String title;
  final String name;

  const AddCv({super.key, required this.title, required this.name});

  @override
  State<AddCv> createState() => _AddCvState();
}

class _AddCvState extends State<AddCv> {

  @override
  Widget build(BuildContext context) {

    String title = widget.title;
    String name = widget.name;

    return AlertDialog(
      backgroundColor: primaryColor,
      title:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "lib/images/logo.png",
            height: 18,
            width: 18,
          ),
          const SizedBox(
            width: 10,
          ),
           buildTextTitle(title,
               18,FontWeight.bold),
        ],
      ),
      content:
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, right: 20),
                      child: buildTextTitle(
                        name,
                          12,
                          FontWeight.bold
                      ),
                    ),
                  ],
                ),
                textFieldWithoutIcon(name, 50, 320),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5,  right: 20),
                      child: buildTextTitle(
                        "تاريخ الحصول عليها",
                          12,
                          FontWeight.bold
                      ),
                    ),
                  ],
                ),
                textFieldWithoutIcon("0000/00/00", 50, 320),

                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5,  right: 20),
                      child: buildTextTitle(
                        "مكان الحصول عليها",
                        12,
                          FontWeight.bold
                      ),
                    ),
                  ],
                ),
                textFieldWithoutIcon("اسم الجهة", 50, 320),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: buildText("الغاء",17,FontWeight.bold,secondaryColor),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child:  buildText("اضافة",15,FontWeight.bold,Colors.white),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),

    );

  }

}

