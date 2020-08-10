import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:time_attendent_app/models/user-address-model.dart';
import 'package:time_attendent_app/models/user-login-model.dart';
import 'package:time_attendent_app/models/user-work.dart';
import 'package:time_attendent_app/widgets/drawer-list.dart';

class CalendarPage extends StatefulWidget {
  final UserLogin user;
  final UserWork userWork;
  final UserAddress getUserAddress;

  CalendarPage({
    Key key,
    @required this.user,
    this.userWork,
    this.getUserAddress,
  }) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final CalendarController _calendarController = CalendarController();
  String _time;
  String _address;
  // String _isClocking;
  // DateTime _dateSelect;
  // String _formattDateToday = DateFormat('EEEE,  d MMMM ,y').format(_dateToday);
  // String _formattTimeToday = DateFormat.Hms().format(_dateToday);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Calendar')),
      ),
      drawer: DrawerList(getUser: widget.user),
      body: Column(
        children: <Widget>[
          TableCalendar(
            calendarController: _calendarController,
            locale: 'en_US',
            onDaySelected: getDateSelect,
          ),
          showDateCard()
        ],
      ),
    );
  }

  showDateCard() {
    if (((_time != null) && _address != null)) {
      return Card(
        child: ListTile(
          title: Text('$_time'),
          subtitle: Text(
            '$_address',
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ),
      );
    } else {
      return Card();
    }
  }

  getDateSelect(DateTime _date, List _events) {
    setState(() {
      showDateCard();
    });
    // _dateSelect = _date;
    // _formattDateSelected = DateFormat('EEEE,  d MMMM ,y').format(_dateSelect);
    // _selectedEvents = events;
    // print('Show events: $events');
  }

  @override
  void initState() {
    super.initState();
    getTimeData();
    getAddressData();
  }

  getAddressData() {
    UserAddress add = widget.getUserAddress;

    if (add != null) {
      setState(() {
        _address = '${add.locality} ${add.administrativeArea} ${add.country}';
      });
    } else {
      return;
    }
  }

  getTimeData() {
    UserWork work = widget.userWork;

    setState(() {
      if (work != null && work.workin != null) {
        // _isClocking = 'in';
        _time = work.workin;
      } else if (work != null && work.workout != null) {
        // _isClocking = 'out';
        _time = work.workout;
      }
    });
  }
}
