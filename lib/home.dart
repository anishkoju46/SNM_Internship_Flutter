import 'package:crud_login/AvatarUI/avatar_home.dart';
import 'package:crud_login/ControllerPage.dart';
import 'package:crud_login/Status_UI.dart';
import 'package:crud_login/WidgetHaru.dart';
import 'package:crud_login/addLocation.dart';
import 'package:crud_login/adventureUI.dart';
import 'package:crud_login/AvatarUI/avatar.dart';
import 'package:crud_login/burger.dart';
import 'package:crud_login/financeUI.dart';
import 'package:crud_login/location.dart';
import 'package:crud_login/travelPage.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Original List
  final List<Location> _locations = [];

  final TextEditingController _searchController = TextEditingController();

  //Filtered List
  final List<Location> _filteredLocations = [];

  // final GlobalKey<AnimatedListState> _animatedListKey =
  //     GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    var loadedList = GetStorage().read("myList");
    //myList vanne key ma chai value vanne tha hunxa
    // if (loadedList != null) {
    //   var storedList = locationFromJson(loadedList);
    //   _locations.addAll(storedList);
    //   _filteredLocations.addAll(storedList);
    // } else {
    //   _filteredLocations.addAll(_locations);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trek Nepal"),
        actions: [
          TextButton(
              onPressed: () async {
                var smth = await sastoMap();

                if (smth != null) {
                  _addLocation(smth);
                }

                // Location test1 = Location(description: "", locationName: "");

                // Location test2 = Location(description: "", locationName: "");

                // print(test1.hashCode);
                // print(test2.hashCode);

                // if (smth != null) {
                //   var index = _locations
                //       .indexWhere((e) => e.locationName == smth.locationName);
                //   if (index == -1) // index >=0 Found || index<0 not Found
                //   {
                //     setState(() {
                //       _locations.add(smth);
                //       _filteredLocations.add(smth);
                //     });
                //   }
                // }
              },
              child: const Text("Add Location"))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 15.00, right: 15.00, top: 5.00, bottom: 0.00),
            //THIS TEXT FIELD IS FOR SEARCH FUNCTIONALITY
            child: TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60.0)),
                contentPadding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
                labelText: 'Search',
                hintText: 'Example: Rara',
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (value) {
                _filterMethod(value);
              },
            ),
          ),
          _viewList(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ControllerPage(),
                      ));
                },
                child: const Text("Lets Container")),
          ),
          //---------------JSON BUTTON -----------------
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UIStatus(),
                      ));
                  // String jsonData = '''{
                  //   "GET /stats/ 200": 161,
                  //   "GET unknown route 404": 60,
                  //   "GET /api/items/ 200": 51
                  // }''';

                  // Map<String, dynamic> fromRawJson(String str) {
                  //   return jsonDecode(str);
                  // }

                  // var decodedJson = fromRawJson(jsonData){
                  //   return decode
                  // },

                  // Map<String, dynamic> decodedData = json.decode(jsonData);

                  // decodedData.forEach((key, value) {
                  //   print("$key: $value");
                  // });

                  // for (var element in jsonString) {
                  //   final seperatedElement = element.split(' ');
                  //   //print(seperatedElement);
                  //   String method = seperatedElement[0];
                  //   String path = seperatedElement[1] + seperatedElement[2];
                  //   String statusCode = seperatedElement[3];

                  //   print("${method}, ${path}, ${statusCode}");

                  //   if (seperatedElement.length >= 3) {
                  //     print(
                  //         "${seperatedElement[0]}, ${seperatedElement[1]}, ${seperatedElement[2]}");
                  //   } else {
                  //     print("${element}");
                  //   }

                  //   print(seperatedElement);

                  //   print(element[0]);
                  //   print(element[1]);
                  //   print(element[2]);
                  // }
                },
                child: const Text("JSON")),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WidgetHaru(),
                      ));
                },
                child: const Text("ROW")),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyBurger(),
                      ));
                },
                child: const Text("BURGUR")),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TravelPage(),
                      ));
                },
                child: const Text("TRAVEL")),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdventureUI(),
                      ));
                },
                child: const Text("ADVENTURE")),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FinanceUI(),
                      ));
                },
                child: const Text("FINANCE")),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyAvatarHome(),
                      ));
                },
                child: const Text("AVATAR")),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //   BottomNavigationBarItem(
      //       label: "Container", icon: Icon(Icons.accessibility_new)),
      //   BottomNavigationBarItem(
      //       label: "asdf", icon: Icon(Icons.accessibility_new))
      // ])
    );
  }

  _filterMethod(String query) {
    _filteredLocations.clear();
    if (query.isEmpty) {
      _filteredLocations.addAll(_locations);
    } else {
      for (var location in _locations) {
        if (location.locationName.toLowerCase().contains(query.toLowerCase())) {
          _filteredLocations.add(location);
        }
      }
    }
    setState(() {});
  }

  //UI KO LAGI METHOD
  _viewList() => Expanded(
          child: Card(
        margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: ListView.builder(
          //key: _animatedListKey,
          itemBuilder: (context, index) {
            return listTileItem(index);
          },
          //List ma vako sabai item print garxa
          itemCount: _filteredLocations.length,
        ),
      ));

  Widget listTileItem(int index) {
    //final loadedList = GetStorage().read("myList");
    //final welcomeMessage = loadedList == null ? "Welcome" : "Welcome Back";
    return ListTile(
      onTap: () {},
      //Icon provide garxa pindrop
      leading: Container(
        alignment: Alignment.center,
        height: 30,
        width: 30,
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.purple,
                offset: Offset(-1, -1),
                blurRadius: 5,
              )
            ]),
        child: const FittedBox(
          fit: BoxFit.contain,
          child: Text(""),
        ),
      ),
      //END ----------------

      title: Text(
        _filteredLocations[index].locationName,
        style: const TextStyle(
          color: Colors.green,
        ),
      ),
      subtitle: Text(
        _filteredLocations[index].description +
            _filteredLocations[index].myCoordinates.toString(),
        style: const TextStyle(color: Colors.blueGrey),
      ),

      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          //EDIT GESTURE DETECTOR
          GestureDetector(
            onTap: () async {
              var smth2 = await sastoMap(_locations[index]);
              if (smth2 != null) {
                setState(() {
                  _locations[index] = smth2;
                  _filteredLocations[index] = smth2;
                });
                GetStorage().write("myList", locationToJson(_locations));
              }
            },
            child: const Icon(Icons.edit),
          ),
          //DELETE GESTURE DETECTOR
          GestureDetector(
            onTap: () {
              _deleteLocation(index);
            },
            child: const Icon(Icons.delete_forever_sharp),
          ),
        ],
      ),
      //this is edit
    );
  }

  Future<Location>? sastoMap([Location? thau]) async {
    var smth = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddLocation(
            location: thau,
          ),
        ));
    return smth;
  }

  Future<void> _addLocation(Location smth) async {
    var index =
        _locations.indexWhere((e) => e.locationName == smth.locationName);
    if (index == -1) {
      _locations.add(smth);
      _filteredLocations.add(smth);
      setState(() {});
      //Responsible for state persistence
      GetStorage().write("myList", locationToJson(_locations));

      //_animatedListKey.currentState!.insertItem(_filteredLocations.length - 1);
    }
  }

  void _deleteLocation(int index) async {
    bool delete = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure ?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text(
              'No',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text(
              'Yes',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
        ],
      ),
    );
    if (delete == true) {
      // _animatedListKey.currentState!
      //     .removeItem(index, (context, animation) => listTileItem(index));

      setState(() {
        final removedLocation = _filteredLocations.removeAt(index);

        final locationIndex = _locations
            .indexWhere((e) => e.locationName == removedLocation.locationName);

        if (locationIndex != -1) {
          _locations.removeAt(locationIndex);
        }
      });
      GetStorage().write("myList", locationToJson(_locations));
    }
  }
}
