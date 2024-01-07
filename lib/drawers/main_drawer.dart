import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
              height: 200,
              width: 200,
              child: Image(image: AssetImage("assets/logo/logo.png"))),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "addPlane");
            },
            leading: const Icon(Icons.flight),
            title: const Text('Uçak Ekle'),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "addRoute");
            },
            leading: const Icon(Icons.route),
            title: const Text('Rota Ekle'),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "addSchedule");
            },
            leading: const Icon(Icons.schedule),
            title: const Text('Güzergah Ekle'),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "reservation");
            },
            leading: const Icon(Icons.book_online),
            title: const Text('Rezervasyon Görüntüle'),
          ),
        ],
      ),
    );
  }
}
