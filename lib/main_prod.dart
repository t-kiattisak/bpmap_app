import 'app_config.dart';
import 'main.dart';

void main() {
  var configuredApp = AppConfig(
    environment: Environment.prod,
    appName: "BP Map",
    apiBaseUrl: "https://api.bpmap.com",
  );

  runMapApp(configuredApp);
}
