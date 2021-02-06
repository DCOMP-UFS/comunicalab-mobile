class Ticket implements Comparable<Ticket> {
  final int id;
  final String title;
  final String requestingUser;
  final String description;
  final String category;
  final String type;
  final DateTime dateTime;
  final String status;
  final int likes;
  final int dislikes;
  final String liked;

  Ticket(
      {this.id,
      this.title,
      this.requestingUser,
      this.description,
      this.category,
      this.type,
      this.dateTime,
      this.status,
      this.likes,
      this.dislikes,
      this.liked});

  Ticket copyWith({
    final int id,
    final String title,
    final String requestingUser,
    final String description,
    final String category,
    final String type,
    final DateTime dateTime,
    final String status,
    final int likes,
    final int dislikes,
    final String liked,
  }) {
    return Ticket(
      id: id ?? this.id,
      title: title ?? this.title,
      requestingUser: requestingUser ?? this.requestingUser,
      description: description ?? this.description,
      category: category ?? this.category,
      type: type ?? this.type,
      dateTime: dateTime ?? this.dateTime,
      status: status ?? this.status,
      likes: likes ?? this.likes,
      dislikes: dislikes ?? this.dislikes,
      liked: liked ?? this.liked,
    );
  }

  Ticket.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        requestingUser = json['requestingUser'],
        description = json['description'],
        category = json['category'],
        type = json['type'],
        dateTime = DateTime.parse(json['dateTime']),
        status = json['status'],
        likes = json['likes'],
        dislikes = json['dislikes'],
        liked = json['liked'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'requestingUser': requestingUser,
        'description': description,
        'category': category,
        'type': type,
        'dateTime': dateTime.toString(),
        'status': status,
        'likes': likes,
        'dislikes': dislikes,
        'liked': liked,
      };

  /* Este override permite ordenar os chamados de acordo com o seu status. Para
  * tal, basta utilizar a propriedade .sort() em um objeto do tipo List<Ticket>.
  * Em ordem crescente, o status de um chamado pode ser:
  * Pendente -> Andamento -> Finalizado
  */
  @override
  int compareTo(Ticket other) {
    switch (this.status) {
      case 'Pendente':
        switch (other.status) {
          case 'Pendente':
            return 1;
            break;
          case 'Andamento':
            return 0;
            break;
          case 'Finalizado':
            return 0;
            break;
        }
        break;
      case 'Andamento':
        switch (other.status) {
          case 'Pendente':
            return 1;
            break;
          case 'Andamento':
            return 0;
            break;
          case 'Finalizado':
            return -1;
            break;
        }
        break;
      case 'Finalizado':
        switch (other.status) {
          case 'Pendente':
            return 1;
            break;
          case 'Andamento':
            return 1;
            break;
          case 'Finalizado':
            return 0;
            break;
        }
        break;
    }
    return null;
  }
}
