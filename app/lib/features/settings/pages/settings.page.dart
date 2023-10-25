import 'package:app/common/controller/common.controller.dart';
import 'package:app/common/database/shared.preferences.dart';
import 'package:app/features/settings/controllers/settings.controller.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SharedPreference parSharedPreference;
  late SettingsController parSettingsController;
  late CommonController parCommonController;

  @override
  void initState() {
    parSharedPreference = SharedPreference();
    parSettingsController = SettingsController();
    parCommonController = CommonController();
    parCommonController.showTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Configurações'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
      body: RxBuilder(builder: (context) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    parSettingsController.setShowValuesButton = true;
                    parSharedPreference.showLasCalc();
                  },
                  child: Text(
                    'Ver ultimos valores calculados',
                    style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Visibility(
                  visible: parSettingsController.getShowValuesButton,
                  child: Container(
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.onPrimary, borderRadius: BorderRadius.circular(10)),
                    width: 280,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nome: ${parSharedPreference.name}',
                            style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Peso: ${parSharedPreference.weight}',
                            style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Altura: ${parSharedPreference.height}',
                            style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Center(child: RxBuilder(builder: (context) {
                return Text(
                  '®Santa ${parCommonController.getDateTime}',
                  style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                );
              })),
            ),
          ],
        );
      }),
    );
  }
}
