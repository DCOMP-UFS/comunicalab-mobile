class Call {
  int id;
  int liked;
  int disliked;
  String name;
  String date;
  String message;

  Call({this.id, this.liked, this.disliked, this.name, this.date, this.message});

  Call copyWith({
    final int id,
    final int liked,
    final int disliked,
    final String name,
    final String date,
    final String message,
  }) {
    return Call(
      id: id ?? this.id,
      liked: liked ?? this.liked,
      disliked: disliked ?? this.disliked,
      name: name ?? this.name,
      date: date ?? this.date,
      message: message ?? this.message
    );
  }
}
