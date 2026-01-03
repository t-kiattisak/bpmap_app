enum Environment { dev, stg, prod }

class AppConfig {
  final Environment environment;
  final String appName;
  final String apiBaseUrl;
  final String googleServerClientId;
  final String lineChannelId;

  AppConfig({
    required this.environment,
    required this.appName,
    required this.apiBaseUrl,
    required this.googleServerClientId,
    required this.lineChannelId,
  });
}
