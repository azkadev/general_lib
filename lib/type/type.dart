/// GeneralLib
enum GeneralLibClientType {
  /// GeneralLib
  unknown(title: "All"),

  /// GeneralLib
  bot(title: "Bot"),

  /// GeneralLib
  userbot(title: "Userbot"),

  /// GeneralLib
  normal(title: "Normal");

  /// GeneralLib
  final String title;
  const GeneralLibClientType({
    required this.title,
  });

  /// GeneralLib
  static GeneralLibClientType getFromText({
    required String text,
  }) {
    for (final element in values) {
      if (element.name == text) {
        return element;
      }
    }
    return GeneralLibClientType.unknown;
  }

  /// GeneralLib
  static GeneralLibClientType getFromTextOrDefault({
    required String text,
    required GeneralLibClientType Function() onDefault,
  }) {
    final GeneralLibClientType generalLibClientType = getFromText(text: text);
    if (generalLibClientType == GeneralLibClientType.unknown) {
      return onDefault();
    }
    return generalLibClientType;
  }
}

/// GeneralLib
enum GeneralLibClientUseType {
  /// GeneralLib
  unknown(title: "All"),

  /// GeneralLib
  paid(title: "Paid"),

  /// GeneralLib
  free(title: "Free");

  /// GeneralLib
  final String title;
  const GeneralLibClientUseType({
    required this.title,
  });

  /// GeneralLib
  static GeneralLibClientUseType getFromText({
    required String text,
  }) {
    for (final element in values) {
      if (element.name == text) {
        return element;
      }
    }
    return GeneralLibClientUseType.unknown;
  }

  /// GeneralLib
  static GeneralLibClientUseType getFromTextOrDefault({
    required String text,
    required GeneralLibClientUseType Function() onDefault,
  }) {
    final GeneralLibClientUseType generalLibClientUseType = getFromText(text: text);
    if (generalLibClientUseType == GeneralLibClientUseType.unknown) {
      return onDefault();
    }
    return generalLibClientUseType;
  }
}
