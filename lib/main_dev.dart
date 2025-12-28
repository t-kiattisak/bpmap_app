import 'app_config.dart';
import 'main.dart';

void main() {
  var configuredApp = AppConfig(
    environment: Environment.dev,
    appName: "BP Map (Dev)",
    apiBaseUrl: "https://dev-api.bpmap.com",
  );

  runMapApp(configuredApp);
}
