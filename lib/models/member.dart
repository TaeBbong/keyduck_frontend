import 'package:equatable/equatable.dart';

class Member extends Equatable {
  final String id;
  const Member(this.id);

  @override
  List<Object> get props {
    return [id];
  }

  static const empty = Member('-');
}
