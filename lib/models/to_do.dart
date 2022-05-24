import 'package:sickle_cell_app/extras/database/database.dart';
import 'package:sickle_cell_app/extras/icon_enum.dart';
import 'package:sickle_cell_app/extras/notifications_manager.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';

class ToDoModel extends Model with IconMixin {
  bool dontWarnAboutMultipleDatabases = true;
  final AppDatabase _database = AppDatabase();
  final NotificationManager notificationManager = NotificationManager();
  ToDoModel ();

  Future<List> getToDoList() async {
    return await _database.getAllToDo();
  }

  AppDatabase getDatabase() {
    return _database;
  }

  void toggleIconState() {
    toggleState();
    notifyListeners();
  }

  DeleteIconState getIconState() {
    return getCurrentIconState();
  }

  void refreshList() {
    notifyListeners();
  }
}

mixin IconMixin {
  var iconState = DeleteIconState.hide; // default

  void toggleState() {
    if (iconState == DeleteIconState.hide) {
      iconState = DeleteIconState.show;
    } else {
      iconState = DeleteIconState.hide;
    }
  }

  DeleteIconState getCurrentIconState() {
    return iconState;
  }
}