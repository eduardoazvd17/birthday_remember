import 'package:birthdayremember/models/friend.dart';

class User {
  List<Friend> friends;

  User(this.friends);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> userMap = {};
    List<Map<String, dynamic>> friendsList = [];
    for (var f in friends) {
      friendsList.add(f.toJson());
    }
    userMap.putIfAbsent('friends', () => friendsList);
    return userMap;
  }

  User.fromJson(Map<String, dynamic> userMap) {
    List<Friend> friendsList = [];
    for (var f in userMap['friends']) {
      friendsList.add(Friend.fromJson(f));
    }
    this.friends = friendsList;
  }
}
