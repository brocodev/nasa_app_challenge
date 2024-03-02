#Variables
flutter := flutter

build_assets:
	$(flutter) pub get && dart run build_runner build --delete-conflicting-outputs
watch_assets:
	$(flutter) pub get && dart run build_runner watch --delete-conflicting-outputs
