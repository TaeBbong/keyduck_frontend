import 'dart:async';

import 'package:keyboard_duckhoo/models/member.dart';
import 'package:uuid/uuid.dart';

class MemberRepository {
  Member? _member;

  Future<Member?> getMember() async {
    if (_member != null) return _member;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _member = Member(const Uuid().v4()),
    );
  }
}
