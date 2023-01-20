import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:openapi/api.dart';
import 'package:openapi/environmet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:openid_client/openid_client_io.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userEmail;
  String? _userIdentifier;
  UserDto? _poseidonUserDetails;

  int? get userId => getUserId();

  bool get isAuth => token != null;
  String get userEmail => _userEmail ?? '<NULL>';
  String get userIdentifier => _userIdentifier ?? '<NULL>';

  String? get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token!;
    }
    return null;
  }

  final String schema = Environment().config!.schema;
  final int port = Environment().config!.port;
  final String authHost = Environment().config!.authHost;

  String validateToken() {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token!;
    } else {
      login();
      return _token!;
    }
  }

  int getUserId() {
    if (_poseidonUserDetails != null) {
      return _poseidonUserDetails!.userId!;
    } else {
      login();
      return _poseidonUserDetails!.userId!;
    }
  }

  Future<UserDto> getUserDetails() async {
    final token = validateToken();
    final api_instance = PoseidonApiApi();
    api_instance.apiClient.addDefaultHeader('Authorization', 'Bearer $token');
    api_instance.apiClient
        .addDefaultHeader('Content-Type', 'application/json; charset=UTF-8');

    var result = await api_instance.apiUserQueryGet(1, 2,
        orderBy: 'sys_UpdatedAt desc',
        filter: 'externalRef=${this._userIdentifier}');

    this._poseidonUserDetails = result?.items?.first;
    return this._poseidonUserDetails!;
  }

  Future<void> _authenticate() async {
    var uri = new Uri(scheme: schema, host: authHost, port: port);
    var issuer = await Issuer.discover(uri);
    var client = new Client(issuer, "flutter-docker");

    urlLauncher(String url) async {
      var uri = Uri.parse(url);
      var canOpen = await canLaunchUrl(uri);
      if (canOpen) {
        await launchUrl(
          uri,
          mode: LaunchMode.inAppWebView,
        );
      } else {
        throw 'Could not launch $url';
      }
    }

    var authenticator = new Authenticator(client,
        scopes: ["openid", "profile", "poseidon-api"],
        port: 4000,
        urlLancher: urlLauncher);

    var info = await authenticator.authorize();
    var userInfo = await info.getUserInfo();
    var tokenResponse = await info.getTokenResponse();
    closeInAppWebView();

    _token = tokenResponse.accessToken;
    _userEmail = userInfo[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress'];

    _userIdentifier = userInfo["UserIdentifier"];
    _expiryDate = tokenResponse.expiresAt;

    final prefs = await SharedPreferences.getInstance();
    final userData = json.encode(
      {
        'token': _token,
        'email': _userEmail,
        'expiryDate': _expiryDate?.toIso8601String(),
      },
    );
    prefs.setString('userData', userData);

    await getUserDetails();

    notifyListeners();
  }

  Future<void> login() async {
    return _authenticate();
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    if (_userIdentifier == null) {
      return false;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
    final expiryDate =
        DateTime.parse(extractedUserData['expiryDate'] as String);

    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = extractedUserData['token'] as String;
    _userEmail = extractedUserData['email'] as String;
    _expiryDate = expiryDate;
    await getUserDetails();

    notifyListeners();
    return false;
  }

  Future<void> logout() async {
    _token = null;
    _userEmail = null;
    _expiryDate = null;
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
    prefs.clear();

    var logoutUrl = new Uri(scheme: schema, host: authHost, port: port);
    if (await canLaunchUrl(logoutUrl)) {
      await launchUrl(logoutUrl);
    } else {
      throw 'Could not launch $logoutUrl';
    }
    await Future.delayed(Duration(seconds: 2));
    closeInAppWebView();
    notifyListeners();
  }
}
