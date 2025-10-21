# Roqu Copy Trader

A cryptocurrency copy trading app built in flutter.

## Setup
add `.env` file in root directory with the following values
```
TWELVE_DATA_API_KEY="**twelve data api key**"
```

Run `flutter pub get` to get all dependencies

Run `flutter run` to build the mobile app and youre set!


## Test App
Run Tests using
```bash
flutter test test/unit_test/price_websocket_source_test.dart
```


## Video preview
Preview of the app in both Android and IOS


<video width="320" height="240" controls>
    <source src="https://asset.cloudinary.com/aniobi/5846f0ed9d519d7ad48a1c5f7d12c035" type="video/mp4">
    Your browser does not support the video tag.
</video>

[Link to video is available here](https://asset.cloudinary.com/aniobi/5846f0ed9d519d7ad48a1c5f7d12c035)


## Notes

**Important limitations:**
- The Twelve Data API only accepts one websocket connection at a time. Running multiple app instances simultaneously will cause websocket connectivity issues - only one instance will maintain an active connection.
- The free plan only displays Bitcoin/USD price data. Additional trading pairs require a paid subscription.