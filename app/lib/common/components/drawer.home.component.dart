import 'package:flutter/material.dart';

class DrawerHomeComponent extends StatefulWidget {
  const DrawerHomeComponent({super.key});

  @override
  State<DrawerHomeComponent> createState() => _DrawerHomeComponentState();
}

class _DrawerHomeComponentState extends State<DrawerHomeComponent> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.5,
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/sx.jpg'),
              ),
              title: Text(
                'SX',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ListTile(
                title: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/settings');
                  },
                  child: Text(
                    'Configuração',
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'v1.0Beta',
                  style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontStyle: FontStyle.italic),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
