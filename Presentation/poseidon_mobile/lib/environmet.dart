class DockerConfig {
  String _hostAddress = '';
  DockerConfig(address) {
    _hostAddress = address;
  }
  String get schema => 'http';
  int get port => 5533;
  String get authHost => _hostAddress;
  String get apiUrl => 'http://${_hostAddress}:5430';
}

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

  DockerConfig? config;

  initConfig(String address) {
    config = _getConfig(address);
  }

  DockerConfig _getConfig(String address) {
    return DockerConfig(address);
  }
}
