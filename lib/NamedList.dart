//for getting names from json file and make a list

class NamedList{
  final String name;

  NamedList({this.name});

  factory NamedList.fromJson(Map<String, dynamic> json){
    return new NamedList(
      name: json['name'] as String,
    );
  }
}