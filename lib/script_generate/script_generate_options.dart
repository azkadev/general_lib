/// GeneralLibrary
class ScriptGeneratorOptions {
  /// GeneralLibrary
  final String fileSystemEntityIgnore;

  /// GeneralLibrary
  final bool isVerbose;

  /// GeneralLibrary
  ScriptGeneratorOptions({
    required this.fileSystemEntityIgnore,
    required this.isVerbose,
  });

  /// GeneralLibrary
  ScriptGeneratorOptions copyWith({
    String? fileSystemEntityIgnore,
    bool? isVerbose,
  }) {
    return ScriptGeneratorOptions(
      fileSystemEntityIgnore:
          fileSystemEntityIgnore ?? this.fileSystemEntityIgnore,
      isVerbose: isVerbose ?? this.isVerbose,
    );
  }
}
