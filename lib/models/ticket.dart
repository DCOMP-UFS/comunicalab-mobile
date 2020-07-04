class Ticket implements Comparable<Ticket> {
  final int id;
  final String requestingUser;
  final String category;
  final String type;
  final DateTime dateTime;
  final String status;
  final int likes;
  final int dislikes;
  final String liked;

  Ticket(
      {this.id,
      this.requestingUser,
      this.category,
      this.type,
      this.dateTime,
      this.status,
      this.likes,
      this.dislikes,
      this.liked});

  Ticket copyWith({
    final int id,
    final String requestingUser,
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
      requestingUser: requestingUser ?? this.requestingUser,
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
        requestingUser = json['requestingUser'],
        category = json['category'],
        type = json['type'],
        dateTime = DateTime.parse(json['dateTime']),
        status = json['status'],
        likes = json['likes'],
        dislikes = json['dislikes'],
        liked = json['liked'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'requestingUser': requestingUser,
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
