class Status {
  String method;
  String route;
  int code;
  int value;
  Status(
      {required this.method,
      required this.route,
      required this.code,
      required this.value});

  // factory Location.fromJson(Map<String, dynamic> json) => Location(
  //       locationName: json["locationName"],
  //       description: json["description"],
  //       myCoordinates: MyCoordinates.fromJson(json["myCoordinates"]),
  //   );

  // static fromJson(String json) {
  //   var dataFromJson = jsonDecode(json);
  // }
}
