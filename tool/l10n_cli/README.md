# Localization

## Creating New Localization

1. Import following packages as bellow:

```yaml
dependencies:
  flutter_localizations:
    sdk: flutter

  intl: any
  intl_translation: any
  flutter_localized_locales: any
```

2. Create `lib/l10n/intl_en.arb` with following content:

```dart
{
  "mySiteTitle": "Ali Yazdi Homepage",
  "@mySiteTitle": {
    "description": "Title for app."
  },
  "myName": "ALI YAZDI",
  "@myName": {
    "description": "My name."
  },
  "myTitle": "CE GRADUATED @ TEHRAN POLYTECHNIC",
  "@myTitle": {
    "description": "My title."
  },
  "welcomeTitle": "Hi there, welcome to my page",
  "@welcomeTitle": {
    "description": "Welcome title."
  },
  "aboutMe": "I am a Software Engineering graduate from Amirkabir University of Technology, which is one of the most prestigious universities in Iran, {value}. And a Developer, who loves programming in Flutter. I am also interested in Artificial Intelligence, Machine Learning and Software Engineering.",
  "@aboutMe": {
    "description": "About me.",
    "placeholders": {
      "value": {
        "example": "University rank in Iran link"
      }
    }
  },
  "aboutUniversityRank": "ranked second in IT",
  "@aboutUniversityRank": {
    "description": "University rank in Iran."
  }
}
```

3. To generate new translation create `lib/l10n/intl_fa.dart` with following content:

```dart
{
  "mySiteTitle": "صفحه شخصی علی یزدی",
  "myName": "علی یزدی",
  "myTitle": "فارغ التحصیل مهندسی کامپیوتر @ پلی‌تکنیک تهران",
  "welcomeTitle": "سلام، به صفحه شخصی من خوش آمدید",
  "aboutMe": "من فارغ التحصیل مهندسی نرم افزار از دانشگاه صنعتی امیرکبیر هستم، که این دانشگاه که یکی از معتبرترین دانشگاه‌ها در ایران و  {value} است. یک برنامه‌نویس هستم که عاشق برنامه‌نویسی با فلاتر است. همچنین من به هوش مصنوعی، یادگیری ماشین و مهندسی نرم‌افزار علاقه‌مند هستم.",
  "aboutUniversityRank": "رتبه دوم دانشگاه صنعتی"
}
```

4. By running app, flutter generate all Localization see *Generating
   Localizations*, but if you want to generate before running see
   *Generating Localizations in the command line*

4. Add these following line in `lib/main.dart` as bellow:

```dart
MaterialApp(
    localizationsDelegates: [
      ...MySiteLocalizations.localizationsDelegates,
      LocaleNamesLocalizationsDelegate()
    ],
    supportedLocales: MySiteLocalizations.supportedLocales,
    locale: MySiteOptions.of(context).locale,
    localeResolutionCallback: (locale, supportedLocales) {
        final isSupported = supportedLocales.contains(
          supportedLocales.singleWhere(
            (element) => element.languageCode == locale?.languageCode,
            orElse: () => null,
          ),
        );
        if (isSupported) {
          deviceLocale = locale;
        } else {
          deviceLocale = supportedLocales.first;
        }
        return isSupported ? locale : supportedLocales.first;
    },
),
```

## Creating New Locale Messages

When adding new strings to be localized, update `intl_en.arb`, which
is used by this project as the template. When creating new entries, they
have to be in the following format:

```arb
  "dartGetterVariableName": "english translation of the message",
  "@dartGetterVariableName": {
    "description": "description that the localizations delegate will use."
  },
```

In this example, `dartGetterVariableName` should be the Dart method/property
name that you will be using in your localizations delegate.

After adding the new message in `intl_en.arb`, it can be used in the app by
regenerating the Localizations delegate.
This allows use of the English message through your localizations delegate in
the application code immediately without having to wait for the translations
to be completed.

## Generating Localizations

Running the application for the first time should generate a synthetic package
containing the app's localizations through importing
`package:flutter_gen/gen_l10n/`. The code is generated will be generated in
`.dart_tool/flutter_gen/gen_l10n/`.

The generated localizations code is updated every time `flutter run`
is called, and during hot reload and restart. This means that updates to
existing arb files can be made and seen in real time during app development.

### Generating Localizations in the command line

From the root directory, run:

```bash
flutter gen-l10n \
    --template-arb-file=intl_en.arb \
    --output-localization-file=koja_beram_localizations.dart \
    --output-class=KojaBeramLocalizations
```
To see a detailed report, run:

```bash
flutter gen-l10n \
    --template-arb-file=intl_en.arb \
    --untranslated-messages-file \ 
    --output-localization-file=koja_beram_localizations.dart \
    --output-class=KojaBeramLocalizations
```
### Generating the .xml source for the Google translation console

From the root directory, run `flutter pub run tool/l10n_cli/main.dart`,
which will generate `intl_en.xml`. This will be used by the internal
translation console to generate messages in the different locales.

Note that the filename for `intl_en.xml` is used by the internal
translation console and changing the filename may require manually
updating already translated messages to point to the new file.
Therefore, avoid doing so unless necessary.
