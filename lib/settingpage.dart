import 'package:flutter/material.dart';
import 'profilepage.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false;
  bool _isWifiOn = false;
  bool _isLocationOn = false;
  bool _isBluetoothOn = false;

  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkMode = value;
      // Apply dark mode or light mode to the entire app.
      if (_isDarkMode) {
        // Set dark mode
      } else {
        // Set light mode
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          },
        ),
        backgroundColor: Colors.yellow.shade800,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: const Text('Enable Dark Mode'),
            value: _isDarkMode,
            onChanged: _toggleDarkMode,
            secondary: const Icon(Icons.brightness_6),
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('WiFi'),
            value: _isWifiOn,
            onChanged: (bool value) {
              setState(() {
                _isWifiOn = value;
              });
            },
            secondary: const Icon(Icons.wifi),
          ),
          SwitchListTile(
            title: const Text('Location'),
            value: _isLocationOn,
            onChanged: (bool value) {
              setState(() {
                _isLocationOn = value;
              });
            },
            secondary: const Icon(Icons.location_on),
          ),
          SwitchListTile(
            title: const Text('Bluetooth'),
            value: _isBluetoothOn,
            onChanged: (bool value) {
              setState(() {
                _isBluetoothOn = value;
              });
            },
            secondary: const Icon(Icons.bluetooth),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person_add),
            title: const Text('Invite Friends'),
            onTap: () {
              // Handle invite friends functionality
            },
          ),
          ListTile(
            leading: const Icon(Icons.link),
            title: const Text('Create WhatsApp Link'),
            onTap: () {
              // Handle creating WhatsApp link
            },
          ),
          ListTile(
            leading: const Icon(Icons.link),
            title: const Text('Create Telegram Link'),
            onTap: () {
              // Handle creating Telegram link
            },
          ),
        ],
      ),
    );
  }
}
