import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:time_attendent_app/models/user-address-model.dart';
import 'package:time_attendent_app/models/user-login-model.dart';
import 'package:time_attendent_app/models/user-work-model.dart';
import 'package:time_attendent_app/widgets/drawer-list.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  final UserLogin user;
  // final List<UserWork> userWork;

  CalendarPage({
    Key key,
    @required this.user,
    // this.userWork,
  }) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final CalendarController _calendarController = CalendarController();
  DateTime _dateNow;
  String _formatDateNow;
  String _time;
  String _address;
  DateTime _dateSelect;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Calendar')),
      ),
      drawer: DrawerList(getUser: widget.user),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(30.0),
                ),
                child: TableCalendar(
                  rowHeight: 58.0,
                  calendarStyle: CalendarStyle(
                    todayColor: Colors.amber[100],
                    todayStyle: TextStyle(color: Colors.amber[900]),
                    selectedColor: Colors.amber,
                    selectedStyle: TextStyle(color: Colors.white),
                  ),
                  calendarController: _calendarController,
                  locale: 'en_US',
                  onDaySelected: getDateSelect,
                ),
              ),
            ),
            SizedBox(
              height: 80.0,
              width: 500.0,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 30.0,
                    right: 20.0,
                    top: 20.0,
                    bottom: 20.0,
                  ),
                  child: Text(
                    'Today:  $_formatDateNow',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // showDateCard() {
  //   if (((_time != null) && _address != null)) {
  //     return Card(
  //       child: ListTile(
  //         title: Text('$_time'),
  //         subtitle: Text(
  //           '$_address',
  //           style: TextStyle(
  //             fontSize: 15.0,
  //           ),
  //         ),
  //         trailing: IconButton(
  //           icon: Icon(Icons.more_vert),
  //           onPressed: () {},
  //         ),
  //       ),
  //     );
  //   } else {
  //     return Card();
  //   }
  // }

  @override
  void initState() {
    super.initState();
    getTimeNow();
    getDateWorkData();
    getAddressData();
  }

  void getTimeNow() {
    _dateNow = DateTime.now();

    setState(() {
      _formatDateNow = DateFormat('dd/MM/yyyy').format(_dateNow);
    });
  }

  getDateSelect(DateTime _date, List _events) {
    setState(() {
      _dateSelect = _date;
      // showDateCard();
    });
    // _selectedEvents = events;
    // print('Show events: $events');
  }

  void getAddressData() {}

  void getDateWorkData() {}
}
