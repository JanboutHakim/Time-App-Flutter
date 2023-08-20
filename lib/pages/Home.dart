import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map date = {};
  dynamic result;
  String bgImage = "";
  String location = 'Hello';

  ButtonStyle myfun() {
    return ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black));
  }

  @override
  Widget build(BuildContext context) {
    date = date.isNotEmpty
        ? date
        : ModalRoute.of(context)?.settings.arguments as Map;
    // set background

    bgImage = date['daytime'] ? 'day.jpg' : 'night.jpg';

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/$bgImage'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  width: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      if (result != null) {
                        date = {
                          'time': result['time'],
                          'location': result['location'],
                          'daytime': result['daytime'],
                          'flag': result['flag']
                        };
                      }
                    });
                  },
                  style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered))
                          return Colors.grey[500]; //<-- SEE HERE
                        return null;
                      }),
                      backgroundColor: MaterialStatePropertyAll(Colors.black)),
                  icon: Icon(
                    Icons.edit_location,
                    //color: Colors.black,
                  ),
                  label: Text('Edit Location'),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      date['location'],
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500]),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  date['time'],
                  style: TextStyle(
                      fontSize: 46,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
