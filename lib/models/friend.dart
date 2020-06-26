class Friend {
  String id;
  String name;
  String imageUrl;
  DateTime birthdayDate;

  Friend({
    this.id,
    this.name,
    this.imageUrl,
    this.birthdayDate,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> friendMap = {};
    friendMap.putIfAbsent('id', () => id);
    friendMap.putIfAbsent('name', () => name);
    friendMap.putIfAbsent('imageUrl', () => imageUrl);
    friendMap.putIfAbsent('birthdayDate', () => birthdayDate);
    return friendMap;
  }

  Friend.fromJson(Map<String, dynamic> friendMap) {
    this.id = friendMap['id'];
    this.name = friendMap['name'];
    this.imageUrl = friendMap['imageUrl'];
    this.birthdayDate = friendMap['birthdayDate'];
  }
}
