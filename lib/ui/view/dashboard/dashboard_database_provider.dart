import 'package:CatchTheGoal/core/constants/app/app_constants.dart';
import 'package:CatchTheGoal/core/init/services/database/database_provider.dart';
import 'package:CatchTheGoal/ui/model/dashboard_model.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

class DashboardDatabaseProvider extends DatabaseProvider<DashboardModel> {
  String _databasename = ApplicationConstants.DB_NAME;
  String _dashboardTableName = "dashboard";
  int _version = 1;
  Database database;

  String columnUserName = "userName";
  String columnAge = "age";
  String columnIsMarried = "isMarried";
  String columnId = "id";
  @override
  Future<DashboardModel> getItem(int id) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<List<DashboardModel>> getList() async {
    if (database == null) await open();
    List<Map> userMaps = await database.query(_dashboardTableName);
    return userMaps.map((e) => DashboardModel.fromJson(e)).toList();
  }

  @override
  Future<bool> insertItem(DashboardModel model) async {
    if (database == null) open();

    final userMaps = await database.insert(
      _dashboardTableName,
      model.toJson(),
    );

    return userMaps != null;
  }

  Future<void> open() async {
    database = await openDatabase(
      join(await getDatabasesPath(), _databasename),
      version: _version,
      onCreate: (db, version) {
        createTable(db);
      },
    );
  }

  Future<void> createTable(Database db) async {
    await db.execute(
      '''CREATE TABLE dashboard (
              id text PRIMARY KEY,
              user_id text NOT NULL,
              day text NOT NULL, 
              goal_id text NOT NULL,
              goal_type text NOT NULL,
              goal_name text NOT NULL,
              goal_icon text,
              goal_color text,
              target integer,
              amount  integer,
              result integer,
              percent integer,
                is_completed integer,
                unit text
          );
        ''',
    );
  }

  @override
  Future<bool> removeItem(int id) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }

  @override
  Future<bool> updateItem(int id, DashboardModel model) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
