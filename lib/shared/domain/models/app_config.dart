enum Environment { dev, stg, prod }

class AppConfig {
  final Environment environment;
  final String appName;
  final String apiBaseUrl;
  final String googleServerClientId;

  AppConfig({
    required this.environment,
    required this.appName,
    required this.apiBaseUrl,
    required this.googleServerClientId,
  });
}
