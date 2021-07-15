class Lab implements Comparable<Lab> {
  final int id;
  final String name;
  final int capacity;
  final String location;
  final int location_id;
  final int latitude;
  final int longitude;
  final bool isInUse;
  final DateTime occupiedAt;
  final String status;

  Lab(
      {this.id,
      this.name,
      this.capacity,
      this.location,
      this.location_id,
      this.latitude,
      this.longitude,
      this.isInUse,
      this.occupiedAt,
      this.status});

  Lab copyWith({
    final int id,
    final String name,
    final int capacity,
    final String location,
    final int location_id,
    final int latitude,
    final int longitude,
    final bool isInUse,
    final DateTime occupiedAt,
    final String status,
  }) {
    return Lab(
        id: id ?? this.id,
        name: name ?? this.name,
        capacity: capacity ?? this.capacity,
        location: location ?? this.location,
        location_id: location_id ?? this.location_id,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        isInUse: isInUse ?? this.isInUse,
        occupiedAt: occupiedAt ?? this.occupiedAt,
        status: status ?? this.status);
  }

  Lab.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        capacity = json['capacity'],
        location = json['location'],
        location_id = json['location_id'],
        latitude = json['latitude'],
        longitude = json['longitude'],
        isInUse = json['is_in_use'],
        occupiedAt = DateTime.parse(json['occupied_at']),
        status = json['status'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'capacity': capacity,
        'location': location,
        'location_id': location_id,
        'latitude': latitude,
        'longitude': longitude,
        'is_in_use': isInUse,
        'occupied_at': occupiedAt.toString(),
        'status': status,
      };

  @override
  int compareTo(Lab other) {
    switch (this.status) {
      case 'Livre':
        switch (other.status) {
          case 'Livre':
            return 1;
            break;
          case 'Reservado':
            return 0;
            break;
          case 'Ocupado':
            return 0;
            break;
        }
        break;
      case 'Reservado':
        switch (other.status) {
          case 'Livre':
            return 1;
            break;
          case 'Reservado':
            return 0;
            break;
          case 'Ocupado':
            return -1;
            break;
        }
        break;
      case 'Ocupado':
        switch (other.status) {
          case 'Livre':
            return 1;
            break;
          case 'Reservado':
            return 1;
            break;
          case 'Ocupado':
            return 0;
            break;
        }
        break;
    }
    return null;
  }
}

List<Map> filterTickets(Map<String, dynamic> filter, List<Map> labs) {
  List<Map> _filteredLabs;

  //sem filtro
  if (filter["name"] == null &&
      filter["status"] == null &&
      filter["location"] == null) {
    _filteredLabs = labs;
    //Só Status do Ticket
  } else if (filter["name"] != null &&
      filter["status"] == null &&
      filter["location"] == null) {
    _filteredLabs =
        labs.where((element) => element['name'] == filter["name"]).toList();
    //Só Data
  } else if (filter["name"] == null &&
      filter["status"] != null &&
      filter["location"] == null) {
    _filteredLabs =
        labs.where((element) => element['status'] == filter["status"]).toList();
    //Só tipo de problema
  } else if (filter["name"] == null &&
      filter["status"] == null &&
      filter["location"] != null) {
    _filteredLabs = labs
        .where((element) => element['location'] == filter["location"])
        .toList();
    //Só o status e data
  } else if (filter["name"] != null &&
      filter["status"] != null &&
      filter["location"] == null) {
    _filteredLabs = labs
        .where((element) =>
            element['name'] == filter["name"] &&
            element['status'] == filter["status"])
        .toList();
    //Só a data e o tipo
  } else if (filter["name"] == null &&
      filter["status"] != null &&
      filter["location"] != null) {
    _filteredLabs = labs
        .where((element) =>
            element['location'] == filter["location"] &&
            element['status'] == filter["status"])
        .toList();
    //So o status e o tipo
  } else if (filter["name"] != null &&
      filter["status"] == null &&
      filter["location"] != null) {
    _filteredLabs = labs
        .where((element) =>
            element['name'] == filter["name"] &&
            element['location'] == filter["location"])
        .toList();
  }

  return _filteredLabs;
}
