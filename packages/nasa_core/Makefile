#Variables
flutter := flutter

build:
	$(flutter) pub get && $(flutter) packages pub run build_runner build -d
watch:
	$(flutter) pub get && $(flutter) packages pub run build_runner watch --delete-conflicting-outputs
