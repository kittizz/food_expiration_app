.PHONY: build
flutter-build:
	flutter build web --release --web-renderer html
docker-build:
	docker build --platform linux/amd64 -t registry.xver.cloud/food_expiration/fdx_app:latest .
	docker push registry.xver.cloud/food_expiration/fdx_app:latest
deploy: flutter-build docker-build
