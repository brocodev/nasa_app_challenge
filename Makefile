#Variables
flutter := flutter
# Generate code Shortcuts (Build Mode)
init:
	make ui_pub_get && make data_build && make app_build
app_build:
	$(flutter) pub upgrade && $(flutter) pub get && $(flutter) packages pub run build_runner build -d
app_watch:
	$(flutter) pub upgrade && $(flutter) pub get && $(flutter) packages pub run build_runner watch --delete-conflicting-outputs



# App Bundle Generator Shortcuts
gen_aab_dev:
	$(flutter) build appbundle --flavor development -t lib/main_development.dart
gen_aab_stg:
	$(flutter) build appbundle --flavor staging -t lib/main_staging.dart
gen_aab_prod:
	$(flutter) build appbundle --flavor production -t lib/main_production.dart
open_aab:
	open build/app/outputs/bundle/

# APK Generator Shortcuts
gen_apk_dev:
	$(flutter) build apk --flavor development -t lib/main_development.dart
gen_apk_stg:
	$(flutter) build apk --flavor staging -t lib/main_staging.dart
gen_apk_prod:
	$(flutter) build apk --flavor production -t lib/main_production.dart
open_apk:
	open build/app/outputs/flutter-apk/

run_apk:
	$(flutter) run --flavor production -t lib/main_production.dart --dart-define NASA_API_KEY=7hD9jAYsVfpnKUeVmCdnN92CGbHqDDXY3aCmHWwA

# Build iOS Shortcuts
gen_ios_dev:
	$(flutter) build ios --flavor development -t lib/main_development.dart
gen_ios_stg:
	$(flutter) build ios --flavor staging -t lib/main_staging.dart
gen_ios_prod:
	$(flutter) build ios --flavor production -t lib/main_production.dart

# Build IPA Shortcuts
gen_ipa_dev:
	$(flutter) build ipa --flavor development -t lib/main_development.dart
gen_ipa_stg:
	$(flutter) build ipa --flavor staging -t lib/main_staging.dart
gen_ipa_prod:
	$(flutter) build ipa --flavor production -t lib/main_production.dart
open_ipa:
	open build/ios/ipa/

# Help Shortcuts
update_pods:
	cd ios && pod update && pod install
install_pods:
	cd ios && pod install
gen_icon:
	$(flutter) pub get && $(flutter) pub run flutter_launcher_icons
clean:
	$(flutter) clean

