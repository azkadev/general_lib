class ScriptGeneratorOptions {
  final String fileSystemEntityIgnore;
  final bool isVerbose;
  ScriptGeneratorOptions({
    required this.fileSystemEntityIgnore,
    required this.isVerbose,
  });

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
