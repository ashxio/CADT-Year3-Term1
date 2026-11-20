# Project Setup


### 1. Enable the Web platform

Open a terminal in the project root directory and execute:

```bash
flutter create --platforms=web .
```

This command generates the required Web platform files for your existing Flutter project.

### 2. Install dependencies

Execute the following command:

```bash
flutter pub get
```

This command downloads and installs all dependencies declared in `pubspec.yaml`.

### 3. Run app

Once both steps are completed, run the app, select chrome as exampleofr the device

```bash
flutter run
```

Make sure that a Web browser (Chrome or Edge) is available as a target device.

**Important:** Execute these commands from the root directory of your Flutter project.