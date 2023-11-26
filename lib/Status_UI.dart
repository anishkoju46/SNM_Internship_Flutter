import 'dart:convert';

import 'package:crud_login/Status.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UIStatus extends StatefulWidget {
  const UIStatus({super.key});
  @override
  State<UIStatus> createState() => UIStatusState();
}

class UIStatusState extends State<UIStatus> {
  List<Status>? statusList = [];
  parseData() async {
    //http network request
    final client = http.Client();

    var response = await client
        .get(Uri.parse("https://api.snmgroup.com.np/aeromax/accounting/stats"));

    if (response.statusCode == 200) {
      // String jsonData = '''{
      //               "GET /stats/ 200": 161,
      //               "GET unknown route 404": 60,
      //               "GET /api/items/ 200": 51
      //             }''';
      Map<String, dynamic> dataAfterJson = jsonDecode(response.body);

      dataAfterJson.forEach((key, value) {
        //print("$key: $value");
        final newElement = key.split(' ');
        // print(newElement);

        String method1 = newElement.first;
        String code1 = newElement.last;

        String route1 = newElement.length > 3
            ? "${newElement[newElement.indexOf(newElement.first) + 1]} ${newElement[newElement.indexOf(newElement.last) - 1]}"
            : newElement[newElement.indexOf(newElement.last) - 1];

        //Instance of Status Class
        Status status = Status(
            method: method1,
            route: route1,
            code: int.parse(code1),
            value: value);
        statusList?.add(status);
      });
      setState(() {});
    } else {
      setState(() {
        statusList = null;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    parseData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("JSON"),
      ),
      body: statusList == null
          ? const Text("Invalid")
          : ListView.builder(
              itemBuilder: (context, index) =>
                  statusItemBoxClone(statusList![index]),
              itemCount: statusList?.length,
            ),
    ));
  }

  //CLONE WALA SIR KO
  statusItemBoxClone(Status item) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.route, style: const TextStyle(color: Colors.white)),
          Container(
            // color: Colors.red,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.value.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Text("code: ${item.code}",
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
                Container(
                    padding: const EdgeInsets.all(4),
                    height: 30,
                    width: 50,
                    decoration: BoxDecoration(
                        border: Border.all(
                            style: BorderStyle.solid, color: Colors.white),
                        borderRadius: BorderRadius.circular(3)),
                    child: Center(
                      child: Text(item.method,
                          style: const TextStyle(color: Colors.white)),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  //MERO UI
  Container statusItemBox(Status item) {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 200,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.black)),
              child: Text(item.method),
            ),
            Text(item.route),
            Text("code: ${item.code.toString()}"),
            Text(item.value.toString()),
          ],
        ));
  }
}

//column xa, child: textwidget, 2nd child: ROW, row's firstchild column ani row ko 2nd child text
