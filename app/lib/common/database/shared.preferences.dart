import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/common/classes/person.class.dart';

class SharedPreference {
  String name = '';
  String height = '';
  String weight = '';
  Person person = Person();
  late SharedPreferences storage;

  void saveShared(String nameShared, String heightShared, String weightShared) async {
    storage = await SharedPreferences.getInstance();
    storage.setString('nameShared', nameShared);
    storage.setString('heightShared', heightShared);
    storage.setString('weightShared', weightShared);
  }

  Future showLasCalc() async {
    storage = await SharedPreferences.getInstance();
    name = storage.getString('nameShared')!;
    height = storage.getString('heightShared')!;
    weight = storage.getString('weightShared')!;
  }
}
