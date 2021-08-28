import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: wallet(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class wallet extends StatelessWidget {
  const wallet({Key? key}) : super(key: key);
  static const acclinks = ["Accounts", "Cards", "Linked", "Pockets"];

  Widget mycard() {
    final header = Row(
      children: [
        SizedBox(
          width: 15,
        ),
        CircleAvatar(
          backgroundImage: FileImage((File("image/lady.png"))),
          backgroundColor: Colors.white,
          radius: 18,
        ),
        Spacer(),
        Icon(Icons.trending_up),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.bar_chart,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(Icons.notifications),
        SizedBox(
          width: 20,
        ),
      ],
    );
    final links = PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SizedBox(
            height: 50,
            width: 500,
            child: ListView.separated(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TextButton(
                      onPressed: () {},
                      child: Text(
                        "${acclinks[index]}",
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ));
                },
                separatorBuilder: (_, __) => SizedBox(
                      width: 10,
                    ),
                itemCount: acclinks.length)));
    final balance = Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ExpansionTile(
              childrenPadding: EdgeInsets.symmetric(horizontal: 10),
              children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: 500,
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all<double>(0),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue.shade100),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(horizontal: 15)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ))),
                          onPressed: () {},
                          child: Row(children: [
                            Icon(Icons.add),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Add money",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.blue[700]),
                            )
                          ]),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue.shade100),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(horizontal: 15)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ))),
                          onPressed: () {},
                          child: Row(children: [
                            Icon(Icons.arrow_right_alt),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Send",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.blue[700]),
                            )
                          ]),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue.shade100),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.symmetric(horizontal: 10)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ))),
                            onPressed: () {},
                            child: Row(children: [
                              Icon(
                                Icons.more_horiz,
                                size: 20,
                              ),
                            ]))
                      ],
                    ))
              ],
              subtitle:
                  Text('British Pound', style: TextStyle(color: Colors.black)),
              title: Row(children: [
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: '£500',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: '.00',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  )
                ])),
                Icon(Icons.keyboard_arrow_down)
              ]),
              trailing: CircleAvatar(
                child: Image(image: FileImage((File("image/flag.png")))),
                radius: 22,
                backgroundColor: null,
              )),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Text(
              'Transactions',
              style: TextStyle(color: Colors.black54),
            ),
            trailing: Text(
              'See all',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black.withAlpha(20),
              child: Icon(
                Icons.add,
                color: Colors.black54,
              ),
              radius: 20,
            ),
            title: Text('Money added'),
            subtitle: Text('Today, 12.30'),
            trailing: Text('+ 500'),
          )
        ],
      ),
    );

    return Column(
      children: [
        SizedBox(height: 35),
        header,
        SizedBox(height: 20),
        links,
        balance,
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
            child: Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: mycard(),
            color: Colors.grey[50],
          ),
          height: 420,
          width: 350,
        )));
  }
}
