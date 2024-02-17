class Plant {
  String? commonName;

  Duration waterInterval;
  String? waterNotes;
  String? light;
  String? humidity;
  String? soil;

  Map<String, String> properties;
  Uri? imageURL;
  Uri? link;

  Plant({
    this.commonName,
    this.waterInterval = const Duration(days: 7),
    this.waterNotes,
    this.light,
    this.humidity,
    this.soil,
    this.properties = const <String, String>{},
    this.imageURL,
    this.link,
  });
}
