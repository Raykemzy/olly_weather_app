# 🌤️ Olly Weather App

Olly Weather is a sleek Flutter app that displays live weather information and daily forecasts using the OpenWeather API. It combines location-based weather data with a clean, responsive UI.

## 🚀 Features

- **🌦️ Current Weather**: Real-time temperature, conditions, and icons
- **📅 Daily Forecast**: Aggregated 3-hour interval forecasts per day
- **📍 Location Support**: Fetches weather automatically based on your current position
- **🧭 Error Handling**: Handles missing permissions and network failures gracefully
- **✨ Beautiful UI**: Minimalist, modern, and responsive

## 🧰 Tech Stack

- **Framework**: Flutter
- **State Management**: Bloc / Cubit
- **Networking**: Dio
- **Environment Variables**: via `.env` and `--dart-define`
- **Code Generation**: build_runner
- **Key Packages**: Geolocator, Flutter Bloc, Dio, etc.

## ⚙️ Setup & Installation

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- OpenWeather API key ([Get one here](https://openweathermap.org/api))

### 1️⃣ Clone the repository

```bash
git clone https://github.com/your-username/olly_weather_app.git
cd olly_weather_app
```

### 2️⃣ Install dependencies

```bash
flutter pub get
```

### 3️⃣ Add your environment file

Copy the example file and update it with your actual API key:

```bash
cp assets/config/.env.example assets/config/.env
```

Then open `assets/config/.env` and add your key:

```env
OPENWEATHER_API_KEY=your_api_key_here
```

### 4️⃣ Generate Config & Assets

Before running the app, generate the asset references and configuration code:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## 🏗️ Running the App

When running or building, include your API key as a Dart define:

**Development:**
```bash
flutter run --dart-define=OPENWEATHER_API_KEY=your_api_key_here
```

**Release Build:**
```bash
flutter build apk --dart-define=OPENWEATHER_API_KEY=your_api_key_here
```

## 📱 Platform Support

- ✅ iOS
- ✅ Android
- ✅ Web (responsive)

