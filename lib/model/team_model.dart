class Team {
  final int id;
  final String name;

  Team(this.id, this.name);

  Team.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name
  };
}
