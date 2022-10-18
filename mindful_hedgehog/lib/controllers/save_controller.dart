import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

//import 'package:get/get_rx/get_rx.dart';

class SaveController extends GetxController {
  final storage = GetStorage();

  final List<String> dates = [];

  RxList<String> stringValues = RxList();

  SaveController() {
    //loadData();

    stringValues.add("");
    //stringValues[2].value = "";
    update();
  }

  Future<void> saveValue(String key, String value) async {
    storage.write(key, value);
    //uploadLocalData();
  }

  Future<void> saveList(String key, List<String> value) async {
    storage.write(key, value);
    //uploadLocalData();
  }

  Future<void> saveNestedList(String key, List<List<String>> value) async {
    storage.write(key, value);
    //uploadLocalData();
  }

  String getValue(String key) {
    return storage.read(key) ?? "";
  }

  List<String> getList(String key) {
    if (storage.read(key) != null) {
      return storage.read(key);
    } else {
      return [];
    }
  }

  List<List<String>> getNestedList(String key) {
    if (storage.read(key) != null) {
      return storage.read(key);
    } else {
      return [];
    }
  }

  // List<String> getAllDates() {

  // }

  Future<void> clearValue(String key) async {
    storage.remove(key);
  }
}
