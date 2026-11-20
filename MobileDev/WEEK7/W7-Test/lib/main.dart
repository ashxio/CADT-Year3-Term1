import 'package:flutter/material.dart';

enum Device {
  lamp(name: "Lamp", icon: Icons.lightbulb, room: "Bedroom"),
  tv(name: "TV", icon: Icons.tv, room: "Living room"),
  fan(name: "Fan", icon: Icons.air, room: "Office"),
  speaker(name: "Speaker", icon: Icons.speaker, room: "Kitchen"),
  heater(name: "Heater", icon: Icons.local_fire_department, room: "Bathroom"),
  camera(name: "Camera", icon: Icons.videocam, room: "Garage");

  const Device({required this.name, required this.icon, required this.room});

  final String name;
  final IconData icon;
  final String room;
}

//
//  Create your stateless widget DeviceCard here
//
//
class DeviceCard extends StatelessWidget {
  final Device device;
  final bool isOn;

  const DeviceCard({super.key, required this.device, this.isOn = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: isOn ? Colors.amber : Colors.grey,
            child: Icon(device.icon, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Text("${device.name} - ${device.room}"),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            "EX-2 - Stateless Widgets",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          // REMOVE THIS CODE AND REPLACE WITH YOUR OWN CODE
          // We give here an example of CircleAvatar usage (with an icon)
          child: Column(
            children: const [
              DeviceCard(device: Device.lamp),
              DeviceCard(device: Device.tv, isOn: true),
              DeviceCard(device: Device.fan),
              DeviceCard(device: Device.speaker, isOn: true),
              DeviceCard(device: Device.heater),
              DeviceCard(device: Device.camera, isOn: true),
            ],
          ),
        ),
      ),
    ),
  );
}
