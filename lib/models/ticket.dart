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

  Ticket.fromJson(Map<dynamic, dynamic> json)
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

List<Ticket> filterTickets(Map<String, dynamic> filter, List<Ticket> tickets) {
  List<Ticket> _filteredTickets;

  //sem filtro
  if (filter["ticketStatus"] == null &&
      filter["dateTime"] == null &&
      filter["troubleType"] == null) {
    _filteredTickets = tickets;
    //Só Status do Ticket
  } else if (filter["ticketStatus"] != null &&
      filter["dateTime"] == null &&
      filter["troubleType"] == null) {
    _filteredTickets = tickets
        .where((element) => element.status == filter["ticketStatus"])
        .toList();
    //Só Data
  } else if (filter["ticketStatus"] == null &&
      filter["dateTime"] != null &&
      filter["troubleType"] == null) {
    _filteredTickets = tickets
        .where((element) => element.dateTime == filter["dateTime"])
        .toList();
    //Só tipo de problema
  } else if (filter["ticketStatus"] == null &&
      filter["dateTime"] == null &&
      filter["troubleType"] != null) {
    _filteredTickets = tickets
        .where((element) => element.type == filter["troubleType"])
        .toList();
    //Só o status e data
  } else if (filter["ticketStatus"] != null &&
      filter["dateTime"] != null &&
      filter["troubleType"] == null) {
    _filteredTickets = tickets
        .where((element) =>
            element.status == filter["ticketStatus"] &&
            element.dateTime == filter["dateTime"])
        .toList();
    //Só a data e o tipo
  } else if (filter["ticketStatus"] == null &&
      filter["dateTime"] != null &&
      filter["troubleType"] != null) {
    _filteredTickets = tickets
        .where((element) =>
            element.type == filter["troubleType"] &&
            element.dateTime == filter["dateTime"])
        .toList();
    //So o status e o tipo
  } else if (filter["ticketStatus"] != null &&
      filter["dateTime"] == null &&
      filter["troubleType"] != null) {
    _filteredTickets = tickets
        .where((element) =>
            element.status == filter["ticketStatus"] &&
            element.type == filter["troubleType"])
        .toList();
  }

  return _filteredTickets;
}
