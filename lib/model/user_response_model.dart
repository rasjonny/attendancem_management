import 'dart:collection';

class UserResponseModel extends MapView {
  final String id;
  final DateTime date;
  final String status;

  UserResponseModel({
    required this.id,
    required this.date,
    required this.status,
  }) : super({"id":id,
  "date":date,
  "status":status});
}
