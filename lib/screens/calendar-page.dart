import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
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

  //*************************test***********************//
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  //*************************test***********************//

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
            Container(
              // decoration: BoxDecoration(
              //   color: Colors.white,
              // ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TableCalendar(
                  rowHeight: 40.0,
                  calendarStyle: CalendarStyle(
                    todayColor: Hexcolor('#112d4e'),
                    todayStyle: TextStyle(color: Colors.white),
                    selectedColor: Hexcolor('#3f72af'),
                    selectedStyle: TextStyle(color: Colors.white),
                  ),
                  calendarController: _calendarController,
                  locale: 'en_US',
                  onDaySelected: getDateSelect,
                ),
              ),
            ),
            SizedBox(
              height: 60.0,
              width: 500.0,
              child: Container(
                color: Hexcolor('#b44c34'),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    top: 18.0,
                    bottom: 10.0,
                  ),
                  child: Text(
                    'Today:  $_formatDateNow',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: ListView.separated(
                    padding: EdgeInsets.all(10.0),
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Icon(Icons.access_time),
                        title: Text('title : ${entries[index]}'),
                        subtitle: Text('subtitle : ${entries[index]}'),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    }),
              ),
            ),
          ],
        ),
      ),
      // ),
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
