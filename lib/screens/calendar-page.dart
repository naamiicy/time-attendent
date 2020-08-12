import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:time_attendent_app/models/user-login-model.dart';
import 'package:time_attendent_app/models/user-work-model.dart';
import 'package:time_attendent_app/widgets/drawer-list.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  final UserLogin user;
  final List<UserWork> userWork;

  CalendarPage({
    Key key,
    @required this.user,
    this.userWork,
  }) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final CalendarController _calendarController = CalendarController();
  DateTime _date = DateTime.now();
  DateTime _dateNow;
  List _events;
  String _dateNowFormat;
  DateTime _dateSelect;
  String _dateSelectFormat;
  List<UserWork> _userwork = <UserWork>[];
  List<UserWork> _userworkList = <UserWork>[];

  //*************************test***********************//
  // final List<String> entries = <String>['A', 'B', 'C'];
  // final List<int> colorCodes = <int>[600, 500, 100];
  //*************************test***********************//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Calendar')),
        backgroundColor: Hexcolor('#3f72af'),
        elevation: 0.0,
      ),
      drawer: DrawerList(getUser: widget.user),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TableCalendar(
                  rowHeight: 40.0,
                  calendarStyle: CalendarStyle(
                    todayColor: Colors.red[100],
                    todayStyle: TextStyle(
                      color: Colors.red[700],
                    ),
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
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    top: 18.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    'Today:  $_dateNowFormat',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: (_dateSelectFormat == _dateNowFormat)
                  ? SizedBox(
                      child: ListView.separated(
                        padding: EdgeInsets.all(10.0),
                        itemCount: _userworkList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            color: _userworkList[index].workType == 'IN'
                                ? Colors.green[100]
                                : Colors.red[100],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ListTile(
                              leading: Container(
                                width: 50.0,
                                height: 50.0,
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    '${_userworkList[index].workType}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(
                                '${DateFormat.Hms().format(_userworkList[index].workDate)}',
                                style: TextStyle(color: Colors.black87),
                              ),
                              subtitle: Text(
                                '${_userworkList[index].workAddress.locality} ${_userworkList[index].workAddress.administrativeArea}, ${_userworkList[index].workAddress.country}',
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                      ),
                    )
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getDateSelect(_date, _events);
    getTimeNow();
    getDateWorkData();
    getAddressData();
  }

  void getTimeNow() {
    _dateNow = DateTime.now();

    setState(() {
      _dateNowFormat = DateFormat('dd/MM/yyyy').format(_dateNow);
    });
  }

  getDateSelect(DateTime _date, List _events) {
    setState(() {
      _dateSelect = _date;
      _dateSelectFormat = DateFormat('dd/MM/yyyy').format(_dateSelect);
    });
    // _selectedEvents = events;
    // print('Show events: $events');
  }

  void getDateWorkData() {
    _userwork = widget.userWork;
    int index;

    setState(() {
      if (_userwork != null) {
        for (index = 0; index < _userwork.length; index++) {
          _userworkList = _userwork;
        }
      }
    });
  }

  void getAddressData() {}
}
