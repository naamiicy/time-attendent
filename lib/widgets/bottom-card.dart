import 'package:flutter/material.dart';
import 'package:time_attendent_app/models/user-address-model.dart';

class BottomCard extends StatefulWidget {
  final UserAddress userAddress;

  BottomCard({Key key, @required this.userAddress}) : super(key: key);

  @override
  _BottomCardState createState() => _BottomCardState();
}

class _BottomCardState extends State<BottomCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(
                0,
                0,
                0,
                0.15,
              ),
              blurRadius: 25.0,
            ),
          ],
          color: Colors.white,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 160.0,
                    height: 50.0,
                    child: RaisedButton(
                      child: Text(
                        'Clock In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        // DialogSave();
                      },
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 160.0,
                    height: 50.0,
                    child: RaisedButton(
                      child: Text(
                        'Clock Out',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      color: Colors.redAccent,
                      onPressed: () {
                        // DialogSave();
                      },
                    ),
                  ),
                ],
              ),
              // Text(
              //   "Where are you going to?",
              //   // style: _theme.textTheme.title,
              // ),
              // SizedBox(
              //   height: 10.0,
              // ),
              // Text(
              //   "Book on demand or pre-scheduled rides",
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // SizedBox(
              //   height: 15.0,
              // ),
              // InkWell(
              //   onTap: () {},
              //   child: Hero(
              //     tag: "search",
              //     child: Container(
              //       height: 50.0,
              //       decoration: BoxDecoration(
              //         border: Border.all(
              //           color: Colors.grey[300],
              //         ),
              //         borderRadius: BorderRadius.circular(6.0),
              //       ),
              //       padding: EdgeInsets.symmetric(
              //         horizontal: 15.0,
              //       ),
              //       child: Row(
              //         children: <Widget>[
              //           Expanded(
              //             child: Text(
              //               "Enter Destination",
              //               style: TextStyle(
              //                 color: Colors.grey,
              //                 fontSize: 17.0,
              //                 fontWeight: FontWeight.w500,
              //               ),
              //             ),
              //           ),
              //           Icon(
              //             Icons.search,
              //             // color: _theme.primaryColor,
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
