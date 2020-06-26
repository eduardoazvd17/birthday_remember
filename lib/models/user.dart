import 'package:birthdayremember/models/friend.dart';

class User {
  String name;
  DateTime birthdayDate;
  List<Friend> friends;

  User({
    this.name,
    this.birthdayDate,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> userMap = {};
    userMap.putIfAbsent('name', () => name);
    userMap.putIfAbsent('birthdayDate', () => birthdayDate);
    List<Map<String, dynamic>> friendsList = [];
    for (var f in friends) {
      friendsList.add(f.toJson());
    }
    userMap.putIfAbsent('friends', () => friendsList);
    return userMap;
  }

  User.fromJson(Map<String, dynamic> userMap) {
    this.name = userMap['name'];
    this.birthdayDate = userMap['birthdayDate'];
    List<Friend> friendsList = [];
    for (var f in userMap['friends']) {
      friendsList.add(Friend.fromJson(f));
    }
    this.friends = friendsList;
  }
}
