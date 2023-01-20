import 'package:openapi/api.dart';
import 'package:openapi/providers/auth.dart';

class ApiClients {
  PoseidonApiApi createPoseidonClient(Auth authProvider) {
    final token = authProvider.validateToken();
    final api_instance = PoseidonApiApi();
    api_instance.apiClient.addDefaultHeader('Authorization', 'Bearer $token');
    api_instance.apiClient
        .addDefaultHeader('Content-Type', 'application/json; charset=UTF-8');
    return api_instance;
  }

  PoseidonApiApi createPoseidonClientWithToken(String token) {
    final api_instance = PoseidonApiApi();
    api_instance.apiClient.addDefaultHeader('Authorization', 'Bearer $token');
    api_instance.apiClient
        .addDefaultHeader('Content-Type', 'application/json; charset=UTF-8');
    return api_instance;
  }
}
