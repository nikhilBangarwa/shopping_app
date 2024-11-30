import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: customApp(),
      ),
      body: customBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: const Icon(Icons.add_call, color: Colors.white),
      ),
    );
  }

  Widget customBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Favorites',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 20,
                child: Icon(Icons.favorite, color: Colors.white, size: 20),
              ),
              SizedBox(width: 13),
              Text('Add favorite',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15))
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Recent',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          ...List.generate(4, (index) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 14),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  child: Icon(Icons.image),
                ),
                title: Text('Mukesh army girl',
                    style:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                subtitle: Text(
                  'November 14, 15:41',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                trailing: Icon(Icons.call),
              ),
            );
          }),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock),
              const SizedBox(width: 13),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Your Personal calls are',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: '  end to end encrypted',
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget customApp() {
    return AppBar(
      title: const Text(
        'Calls',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.camera_alt, size: 28),
        ),
        const SizedBox(width: 13),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search, size: 28),
        ),
        const SizedBox(width: 13),
        PopupMenuButton<String>(
          onSelected: (value) {

            print(value);
          },
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: "Settings",
                child: Text("Settings"),
              ),
              const PopupMenuItem(
                value: "Help",
                child: Text("Help"),
              ),
              const PopupMenuItem(
                value: "Logout",
                child: Text("Logout"),
              ),
            ];
          },
          icon: const Icon(Icons.more_vert, size: 28),
        ),
        const SizedBox(width: 13),
      ],
    );
  }
}
