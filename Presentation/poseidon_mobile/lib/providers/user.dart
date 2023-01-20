import 'package:flutter/foundation.dart';
import 'package:openapi/api.dart';
import 'package:openapi/auth-clients/poseidon-client.dart';
import 'package:openapi/providers/auth.dart';

class User with ChangeNotifier {
  final Auth auth;
  final ApiClients apiClients = ApiClients();
  User(this.auth, User? userDetails);

  UserDetailsDto? _userDetails;

  UserDetailsDto get userDetails {
    if (_userDetails == null) {
      loadUserDetails().then((value) => {_userDetails = value});
      return _userDetails!;
    } else {
      return _userDetails!;
    }
  }

  Future<UserDetailsDto?> loadUserDetails() async {
    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);

    final result = await poseidonClient.apiUserDetailsGet();

    _userDetails = result?.items?.first;
    notifyListeners();
    return _userDetails;
  }
}
