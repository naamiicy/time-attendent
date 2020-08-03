import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:time_attendent_app/widget/drawer-list.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final CalendarController _calendarController = CalendarController();
  String _formattDateSelected;
  DateTime _dateSelect;
  DateTime _dateToday = DateTime.now();
  // String _formattDateToday = DateFormat('EEEE,  d MMMM ,y').format(_dateToday);
  // String _formattTimeToday = DateFormat.Hms().format(_dateToday);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Calendar')),
      ),
      drawer: DrawerList(),
      body: Column(
        children: <Widget>[
          TableCalendar(
            calendarController: _calendarController,
            locale: 'en_US',
            onDaySelected: getDateSelect,
          ),
          showDateCard(_dateToday)
        ],
      ),
    );
  }

  showDateCard(DateTime _dateToday) {
    String _time = DateFormat.Hms().format(_dateToday);
    return Card(
      child: ListTile(
        title: Text('$_time'),
        trailing: IconButton(
          icon: Icon(Icons.location_on),
          onPressed: () {
            showDialogSaveDate(_time);
          },
        ),
      ),
    );
  }

  getDateSelect(DateTime _date, List _events) {
    _dateSelect = _date;
    _formattDateSelected = DateFormat('EEEE,  d MMMM ,y').format(_dateSelect);

    setState(() {
      showDateCard(_dateToday);
    });
    print('date select $_formattDateSelected ==> ');

    // _selectedEvents = events;
    // print('Show events: $events');
  }

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

  Future<void> showDialogSaveDate(String _time) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want to save of this time?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                // showDateCard(_formattDate, _formattTime);
              },
            ),
          ],
        );
      },
    );
  }

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
}
