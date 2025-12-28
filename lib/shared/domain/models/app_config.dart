enum Environment { dev, stg, prod }

class AppConfig {
  final Environment environment;
  final String appName;
  final String apiBaseUrl;

  AppConfig({
    required this.environment,
    required this.appName,
    required this.apiBaseUrl,
  });
}
