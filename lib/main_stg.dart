import 'app_config.dart';
import 'main.dart';

void main() {
  var configuredApp = AppConfig(
    environment: Environment.stg,
    appName: "BP Map (Staging)",
    apiBaseUrl: "https://stg-api.bpmap.com",
  );

  runMapApp(configuredApp);
}
