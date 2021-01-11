# gallery

A responsive Flutter gallery application for any platform.

## Commands

Build value: `flutter packages pub run build_runner build --delete-conflicting-outputs`

Generating the .xml source for the Google translation console: `flutter
pub run tool/l10n_cli/main.dart`

Create Icons: `flutter pub run flutter_launcher_icons:main` Build

apk: `flutter build apk --split-per-abi`

## Creating a new release

1. Create a PR to bump the version number up in `pubspec.yaml`. Use
   [semantic versioning](https://semver.org/) to determine which number
   to increment. The version number after the `+` should also be
   incremented. For example `1.2.3+010203` with a patch should become
   `1.2.4+010204`.

2. Create a tag on the `main` branch of this repo in the form of
   `v1.0.0`.
	* `git tag v1.0.0`
	* `git push --tags`

3. Publish the web release (using the [peanut package](https://pub.dev/packages/peanut)).
    * `flutter pub global activate peanut`
    * `flutter pub global run peanut:peanut`
   *  `git push origin gh-pages:gh-pages`

4. Write some release notes about what changes have been done since the
   last release.

5. Publish the Android release (using the correct signing certificates).
   *  Create the APK with `flutter build apk`

6. Publish the linux release on the Snapcraft.
   *  Create the `snap` with `snapcraft`
   *  `snapcraft login`
   *  `snapcraft register`
   *  `snapcraft upload --release=stable aliyazdi75_1.0.0_amd64.snap`

7. Go to [Releases](https://github.com/aliyazdi75/aliyazdi75.github.io/releases) and see
   the latest draft.
    * Include the release notes in the description.
    * Publish the release.