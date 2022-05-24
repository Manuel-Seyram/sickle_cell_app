import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sickle_cell_app/extras/database/database.dart';
import 'package:sickle_cell_app/extras/notifications_manager.dart';

class AddTodo extends StatefulWidget {
  
  final double height;
  final AppDatabase _database;
  final NotificationManager manager;
  // ignore: use_key_in_widget_constructors
  const AddTodo(this.height, this._database, this.manager);

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  bool dontWarnAboutMultipleDatabases = true;
  static final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _extra;
  int _selectedIndex = 0;
  final List<String> _icons = [
    'drug.png',
    'pill_rounded.png',
    'pill.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 90),
        height: widget.height * .7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Add Task',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // back to main screen
                    Navigator.pop(context, null);
                  },
                  child: Icon(
                    Icons.close,
                    size: 30,
                    color: Theme.of(context).primaryColor.withOpacity(.65),
                  ),
                )
              ],
            ),
            _buildForm(),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Shape',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            _buildShapesList(),
            const SizedBox(
              height: 70,
            ),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  _submit(widget.manager);
                },
                color: Colors.red.shade100,
                textColor: Colors.white,
                highlightColor: Colors.red.shade100,
                child: Text(
                  'Add Task'.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildShapesList() {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _icons
            .asMap()
            .entries
            .map((MapEntry map) => _buildIcons(map.key))
            .toList(),
      ),
    );
  }

  Form _buildForm() {
    TextStyle labelsStyle =
        const TextStyle(fontWeight: FontWeight.w300, fontSize: 20);
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            style: const TextStyle(fontSize: 20),
            decoration: InputDecoration(
              labelText: 'Title',
              labelStyle: labelsStyle,
            ),
            validator: (input) => (input!.length < 5) ? 'Name is short' : null,
            onSaved: (input) => _name = input!,
          ),
          TextFormField(
            style: const TextStyle(fontSize: 20),
            decoration: InputDecoration(
              labelText: 'Extra',
              labelStyle: labelsStyle,
            ),
            validator: (input) => (input!.length > 50) ? 'Extra is long' : null,
            onSaved: (input) => _extra = input!,
          )
        ],
      ),
    );
  }

  void _submit(NotificationManager manager) async {
    if (_formKey.currentState!.validate()) {
      // form is validated
      _formKey.currentState!.save();
      if (kDebugMode) {
        print(_name);
      }
      if (kDebugMode) {
        print(_extra);
      }
      //show the time picker dialog
      showTimePicker(
        initialTime: TimeOfDay.now(),
        context: context,
      ).then((selectedTime) async {
        int hour = selectedTime!.hour;
        int minute = selectedTime.minute;
        if (kDebugMode) {
          print(selectedTime);
        }
        // insert into database
        var todoId = await widget._database.insertTodo(ToDoTableData(
          name: _name,
          extra: _extra,
          image: 'assets/' + _icons[_selectedIndex],
        ));
        // sehdule the notification
        manager.showNotificationDaily(todoId, _name, _extra, hour, minute);
        // The medicine Id and Notitfaciton Id are the same
        if (kDebugMode) {
          print('New task id' + todoId.toString());
        }
        // go back
        Navigator.pop(context, todoId);
      });
    }
  }

  Widget _buildIcons(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: (index == _selectedIndex)
              ? Theme.of(context).colorScheme.secondary.withOpacity(.4)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Image.asset('assets/' + _icons[index]),
      ),
    );
  }
}
