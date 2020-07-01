class Ticket {
  final String requestingUser;
  final String category;
  final String type;
  final DateTime dateTime;
  final String status;
  final int likes;
  final int dislikes;
  final bool liked;

  Ticket(
    this.requestingUser,
    this.category,
    this.type,
    this.dateTime,
    this.status,
    this.likes,
    this.dislikes,
    this.liked,
  );

  Ticket.fromJson(Map<String, dynamic> json)
      : requestingUser = json['requestingUser'],
        category = json['category'],
        type = json['type'],
        dateTime = DateTime.parse(json['dateTime']),
        status = json['status'],
        likes = json['likes'],
        dislikes = json['dislikes'],
        liked = json['liked'] == 1 ? true : false;

  Map<String, dynamic> toJson() => {
        'requestingUser': requestingUser,
        'category': category,
        'type': type,
        'dateTime': dateTime.toString(),
        'status': status,
        'likes': likes,
        'dislikes': dislikes,
        'liked': liked ? 1 : 0,
      };
}
