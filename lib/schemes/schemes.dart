import 'package:general_lib/schemes/language_code.dart';

/// GeneralLib
final List<Map<String, dynamic>> schemes = [
  {
    "@type": "captchaResult",
    "type": "words",
    "emoji_answer": {
      "@type": "emoji",
    },
    "random_words": [""],
    "words": [""]
  },
  {
    "@type": "captchaWord",
    "answer": [3, 5, 3],
    "words": [
      "satu",
      "dua",
      "tiga",
      "empat",
      "lima",
      "enam",
      "tujuh",
    ],
  },
  {
    "@type": "durationDataScheme",
    "days": 0,
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "milliseconds": 0,
    "microseconds": 0
  },
  {
    "@type": "durationData",
    "days": 0,
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "milliseconds": 0,
    "microseconds": 0
  },
  {
    "@type": "regExpDataScheme",
    "pattern": "",
    "is_multi_line": false,
    "is_case_sensitive": false,
    "is_unicode": false,
    "is_dot_all": false
  },
  {"@type": "socketConnection", "status": "connect"},
  {"@type": "socketError", "message": "", "description": "", "error": "e"},
  {
    "@type": "languageCodeData",
    ...languageCodeJson,
  },
];
