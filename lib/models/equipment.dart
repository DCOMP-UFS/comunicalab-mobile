class Equipment {
  int id;
  String name;
  bool isMarked = false;
  String option = '';
  String disponibility = '';
  
  Equipment({this.id, this.name, this.isMarked, this.option, this.disponibility});

  Equipment copyWith({
    final int id,
    final String name,
    final bool isMarked,
    final String option,
    final String disponibility
  }) {
    return Equipment(
      id: id ?? this.id,
      name: name ?? this.name,
      isMarked: isMarked ?? this.isMarked,
      option: option ?? this.option,
      disponibility: disponibility ?? this.disponibility
    );
  }
}
