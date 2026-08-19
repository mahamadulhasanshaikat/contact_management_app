class PackageLicense {
  final String name;
  final String licenseType;
  final String copyright;
  final String description;

  const PackageLicense({
    required this.name,
    required this.licenseType,
    required this.copyright,
    required this.description,
  });
}

class AppLegalInfo {
  AppLegalInfo._();

  static const String appName = 'Contact Management App';
  static const String appVersion = '1.0.0 (Build 1)';
  static const String developerName = 'MHS Tech Labs';
  static const String copyrightYear = '2026';
  static const String supportEmail = 'support@yourdomain.com';

  static const String appDescription =
      'A secure, lightweight, and modern contact management solution built with Flutter and SQLite.';

  static const String mainAppLicense =
      '''
MIT License

Copyright (c) 2026 $developerName. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.''';

  static const List<PackageLicense> thirdPartyLibraries = [
    PackageLicense(
      name: 'Flutter SDK',
      licenseType: 'BSD 3-Clause',
      copyright: 'Copyright 2014 The Flutter Authors',
      description: 'Cross-platform UI development framework by Google.',
    ),
    PackageLicense(
      name: 'sqflite',
      licenseType: 'BSD 2-Clause',
      copyright: 'Copyright (c) 2019 Alexandre Roux',
      description: 'SQLite plugin for Flutter to store local database records.',
    ),
    PackageLicense(
      name: 'go_router',
      licenseType: 'BSD 3-Clause',
      copyright: 'Copyright 2013 The Flutter Authors',
      description: 'Declarative routing package for Flutter applications.',
    ),
    PackageLicense(
      name: 'shared_preferences',
      licenseType: 'BSD 3-Clause',
      copyright: 'Copyright 2013 The Flutter Authors',
      description:
          'Persistent local key-value store for app settings and themes.',
    ),
  ];
}
