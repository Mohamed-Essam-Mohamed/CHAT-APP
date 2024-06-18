// ignore_for_file: public_member_api_docs, sort_constructors_first

class GroupApp {
  static const String groupApp = "GroupApp";
  String roomId;
  String groupName;
  String groupType;
  String groupDescription;
  GroupApp({
    required this.roomId,
    required this.groupName,
    required this.groupType,
    required this.groupDescription,
  });
  GroupApp.fromJsonRoom(Map<String, dynamic> json)
      : this(
          roomId: json["room_id"],
          groupName: json["group_name"],
          groupType: json["group_type"],
          groupDescription: json["group_description"],
        );
  Map<String, dynamic> toJsonRoom() {
    return {
      "room_id": roomId,
      "group_name": groupName,
      "group_type": groupType,
      "group_description": groupDescription,
    };
  }
}
