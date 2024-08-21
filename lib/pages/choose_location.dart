import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Africa/Lagos', location: 'Nigeria', flag: 'nigeria.png'),
    WorldTime(url: 'Europe/London', location: 'United Kingdom', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Germany', flag: 'germany.jpg'),
    WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'india.jpg'),
    WorldTime(url: 'Asia/Tokyo', location: 'Japan', flag: 'japan.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Australia', flag: 'australia.png'),
    WorldTime(url: 'America/New_York', location: 'USA', flag: 'usa.png'),
    WorldTime(url: 'America/Argentina/Buenos_Aires', location: 'Argentina', flag: 'argentine.jpg'),
    WorldTime(url: 'Africa/Johannesburg', location: 'South Africa', flag: 'south_africa.png'),
    WorldTime(url: 'Europe/Moscow', location: 'Russia', flag: 'russia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.pink[500],
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
