import 'package:flutter/material.dart';

class GlobalDrawer extends StatelessWidget {
  const GlobalDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: <Widget>[
      const DrawerHeader(
        child: Center(
            child: Text(
          'XKCD Demo',
          style: TextStyle(fontSize: 32, color: Colors.white),
        )),
        decoration: BoxDecoration(color: Colors.deepPurple),
      ),
      ListTile(
        title: const Text('Home'),
        onTap: () {
          if (ModalRoute.of(context)!.settings.name != '/') {
            Navigator.pushNamed(context, '/');
          }
        },
      ),
      ListTile(
        title: const Text('Favorites'),
        onTap: () {
          if (ModalRoute.of(context)!.settings.name != '/favorite') {
            Navigator.pushNamed(context, '/favorite');
          }
        },
      ),
    ]));
  }
}
