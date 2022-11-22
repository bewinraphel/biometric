import 'package:apps/home.dart';
import 'package:apps/model/hive_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class add {
  add._insternal();
  static add instance = add._insternal();
  factory add() {
    return instance;
  }

  Future<void> addHiveList(List<hivemodelList> value) async {
    final dataDB = await Hive.openBox<hivemodelList>('hive_list');
    await dataDB.addAll(value);
  }

  Future<void> getdata() async {
    final hivedatas = await Hive.openBox<hivemodelList>('hive_list');
    listofHive.clear();
    listofHive.addAll(hivedatas.values);
  }
}
