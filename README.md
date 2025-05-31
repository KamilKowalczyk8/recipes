# 🍽️ Recipes

**Recipes** to aplikacja mobilna stworzona w Flutterze, która umożliwia przeglądanie, dodawanie i zarządzanie przepisami kulinarnymi. Wykorzystuje lokalną bazę danych SQLite do przechowywania danych oraz bibliotekę Riverpod do zarządzania stanem aplikacji.

## 🧰 Technologie

- [Flutter](https://flutter.dev/)
- [Riverpod](https://riverpod.dev/)
- [SQLite](https://www.sqlite.org/index.html)
- [Google Fonts](https://pub.dev/packages/google_fonts)

## 📦 Instalacja

1. Sklonuj repozytorium:
   ```bash
   git clone https://github.com/KamilKowalczyk8/recipes.git
   cd recipes
   ```

2. Zainstaluj zależności:
   ```bash
   flutter pub get
   ```

3. Uruchom aplikację:
   ```bash
   flutter run
   ```

## 📁 Struktura projektu

- `lib/` – główny katalog aplikacji
  - `main.dart` – punkt wejścia aplikacji
  - `screens/` – ekrany aplikacji
  - `data/` – logika dostępu do danych (np. `DatabaseHelper`)
  - `widgets/` – komponenty UI

## 🎨 Motyw

Aplikacja wykorzystuje ciemny motyw zdefiniowany w `main.dart`:

```dart
final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 255, 255, 255),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);
```

## 🧪 Testy

Aby uruchomić testy jednostkowe:

```bash
flutter test
```

## 🤝 Wkład

Chętnie przyjmujemy wkład w rozwój projektu! Jeśli masz pomysł na nową funkcjonalność lub znalazłeś błąd, otwórz zgłoszenie (issue) lub stwórz pull request.

## 📄 Licencja

Ten projekt jest objęty licencją MIT. Zobacz plik [LICENSE](LICENSE), aby uzyskać więcej informacji.
