// ignore_for_file: public_member_api_docs, sort_constructors_first
class Message {
  static const String collectionName = 'message';
  String id;
  String roomId;
  String senderId;
  String content;
  String senderName;
  int dateTime;
  Message({
    required this.id,
    required this.roomId,
    required this.senderId,
    required this.content,
    required this.senderName,
    required this.dateTime,
  });
  Message.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          roomId: json['room_id'],
          senderId: json['sender_id'],
          content: json['content'],
          senderName: json['sender_name'],
          dateTime: json['date_time'],
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'room_id': roomId,
      'sender_id': senderId,
      'content': content,
      'sender_name': senderName,
      'date_time': dateTime,
    };
  }
}
