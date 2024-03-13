#Variables
flutter := flutter

build_assets:
	$(flutter) pub get && dart run build_runner build -d
watch_assets:
	$(flutter) pub get && dart run build_runner watch --delete-conflicting-outputs
