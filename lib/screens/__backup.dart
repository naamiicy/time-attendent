// void initState() {
//   super.initState();
// }

// void dispose() {
//   _calendarController.dispose();
//   super.dispose();
// }

// void onSelectItemIndex(int index) {
//   setState(() {
//     _selectedIndex = index;
//     print('$_selectedIndex');
//   });
// }

// Future<void> showModalDate(
//     DateTime _datetime, String _currentDate, String _currentTime) {
//   print('check date : $_currentTime');
//   return showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return Container(
//         height: 200.0,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(8.0),
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding: EdgeInsets.all(15.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     Padding(
//                       padding: EdgeInsets.all(5.0),
//                       child: Text(
//                         '$_currentTime',
//                         style: TextStyle(fontSize: 32.0),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(5.0),
//                       child: Text(
//                         '$_currentDate',
//                         style: TextStyle(fontSize: 18.0),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(5.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     MaterialButton(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0)),
//                       color: Colors.green,
//                       textColor: Colors.white,
//                       child: Text('Check In'),
//                       onPressed: () {
//                         setState(() {
//                           showDialogSaveDate(
//                               _datetime, _currentDate, _currentTime);
//                         });
//                       },
//                     ),
//                     MaterialButton(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0)),
//                       color: Colors.grey,
//                       textColor: Colors.white,
//                       child: Text('Check Out'),
//                       onPressed: () {},
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

// Future<void> showDialogSaveDate(String _time) async {
//   return showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Warning'),
//         content: SingleChildScrollView(
//           child: ListBody(
//             children: <Widget>[
//               Text('Do you want to save of this time?'),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           FlatButton(
//             child: Text('CANCEL'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           FlatButton(
//             child: Text('OK'),
//             onPressed: () {
//               Navigator.of(context).pop();
//               // showDateCard(_formattDate, _formattTime);
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

// Align(
//   alignment: Alignment.bottomCenter,
//   child: Container(
//     height: 200.0,
//     alignment: Alignment.center,
//     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//     decoration: BoxDecoration(
//       color: Colors.white70,
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: Column(
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Padding(
//                 padding: EdgeInsets.only(top: 5.0),
//                 child: Text(
//                   '$_currentTime',
//                   style: TextStyle(fontSize: 32.0),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 5.0),
//                 child: Text(
//                   '$_currentDate',
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 0.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               ButtonTheme(
//                 minWidth: 140.0,
//                 height: 50.0,
//                 child: RaisedButton(
//                   child: Text(
//                     'Clock In',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18.0,
//                     ),
//                   ),
//                   color: Colors.green,
//                   onPressed: () {},
//                 ),
//               ),
//               ButtonTheme(
//                 minWidth: 140.0,
//                 height: 50.0,
//                 child: RaisedButton(
//                   child: Text(
//                     'Clock Out',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18.0,
//                     ),
//                   ),
//                   color: Colors.orangeAccent,
//                   onPressed: () {},
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     ),
//   ),
// ),
