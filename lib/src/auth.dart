import 'dart:async';
import 'dart:convert';
import 'package:grpc/grpc.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

class RpcAuthenticator extends HttpBasedAuthenticator {
  final String token;
  final String deviceID;
  final String textileAPI;
  RpcAuthenticator(this.token, this.deviceID, this.textileAPI);

  Future<auth.AccessCredentials> obtainCredentialsWithClient(
          http.Client client, String uri) async {
    final response = await client.post(textileAPI, body: '{ "token": "${this.token}", "device_id": "${deviceID}" }');
    final data = json.decode(response.body);
    final expire = DateTime.now().add(Duration(days: 365)).toUtc();
    final token = auth.AccessToken(
      'Bearer',
      data['session_id'],
      expire
    );
    final result = auth.AccessCredentials(
      token,
      null,
      [
        '*'
      ]
    );
    return result;
  }
}
