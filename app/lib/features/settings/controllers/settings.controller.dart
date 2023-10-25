import 'package:rx_notifier/rx_notifier.dart';

class SettingsController {
  ///// States
  final _name = RxNotifier<String>('');
  final _height = RxNotifier<double>(0.0);
  final _weight = RxNotifier<double>(0.0);

  final _showValuesButton = RxNotifier<bool>(false);

  ///// Getters/Setters
  String get getName => _name.value;
  set setName(String parValue) => _name.value = parValue;

  double get getHeight => _height.value;
  set setHeight(double parValue) => _height.value = parValue;

  double get getWeight => _weight.value;
  set setWeight(double parValue) => _weight.value = parValue;

  bool get getShowValuesButton => _showValuesButton.value;
  set setShowValuesButton(bool parValue) => _showValuesButton.value = parValue;
}
