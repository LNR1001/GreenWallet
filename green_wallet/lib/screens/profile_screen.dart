import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: const Color(0xFF1B5E20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.green,
              child: Icon(Icons.person, size: 45, color: Colors.white),
            ),
            const SizedBox(height: 20),

            const Text(
              "User Name",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            const Text(
              "Eco Level: 🌿 Beginner",
              style: TextStyle(color: Colors.black54),
            ),

            const SizedBox(height: 20),
            const Divider(),

            // ⭐ CENTER THIS WHOLE SECTION:
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Settings", style: TextStyle(fontSize: 18)),
                    const SizedBox(height: 20),

                    ListTile(
                      leading: const Icon(Icons.notifications),
                      title: const Text("Notifications"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.lock),
                      title: const Text("Privacy"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text("Logout"),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
