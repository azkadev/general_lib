enum GeneralLibClientType {
  unknown(title: "All"),
  bot(title: "Bot"),
  userbot(title: "Userbot"),
  normal(title: "Normal");

  final String title;
  const GeneralLibClientType({
    required this.title,
  });

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

enum GeneralLibClientUseType {
  unknown(title: "All"),
  paid(title: "Paid"),
  free(title: "Free");

  final String title;
  const GeneralLibClientUseType({
    required this.title,
  });
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
