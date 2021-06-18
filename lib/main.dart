import 'package:flutter/material.dart';
import 'package:latian_state/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    Widget option(int index, String title, String desc, String pricing) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
                color: selectedIndex == index
                    ? Color(0xff007dff)
                    : Color(0xff4d5b7c)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  selectedIndex == index
                      ? Image.asset(
                          'assets/check_two.png',
                          width: 18,
                          height: 18,
                        )
                      : Image.asset(
                          'assets/check.png',
                          width: 18,
                          height: 18,
                        ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: planText,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        desc,
                        style: descText,
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    pricing,
                    style: priceText,
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget header() {
      return Padding(
        padding: EdgeInsets.only(
          top: 50,
          left: 32,
          right: 32,
        ),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/icon_one.png',
                width: 266.99,
                height: 200,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upgrade to',
                  style: titleText,
                ),
                Text(
                  ' Pro',
                  style: titleText.copyWith(color: Color(0xff007dff)),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Go unlock all features and\n build your own business bigger',
              style: subTitleText,
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }

    Widget checkoutButton() {
      return Column(
        children: [
          Container(
            width: 311,
            height: 51.23,
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Color(0xff007dff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(71),
                  )),
              onPressed: () {},
              child: Text(
                'Checkout Now',
                style: titleText.copyWith(
                    fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ),
          )
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff04112f),
        body: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              option(0, 'Monthly', 'Good for starting up', '\$20'),
              option(1, 'Quarterly', 'Focus on building', '\$50'),
              option(2, 'Yearly', 'Steady company', '\$220'),
              checkoutButton()
            ],
          ),
        ),
      ),
    );
  }
}
