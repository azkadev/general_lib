// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'patterns.dart';
import 'utils.dart';
import 'version.dart';
import 'version_range.dart';
import 'version_union.dart';

/// A [PackageVersionNumberGeneralLibraryConstraint] is a predicate that can determine whether a given
/// version is valid or not.
///
/// For example, a ">= 2.0.0" constraint allows any version that is "2.0.0" or
/// greater. PackageVersionNumberGeneralLibrary objects themselves implement this to match a specific
/// version.
abstract class PackageVersionNumberGeneralLibraryConstraint {
  /// A [PackageVersionNumberGeneralLibraryConstraint] that allows all versions.
  static PackageVersionNumberGeneralLibraryConstraint any = PackageVersionNumberGeneralLibraryRange();

  /// A [PackageVersionNumberGeneralLibraryConstraint] that allows no versions -- the empty set.
  static PackageVersionNumberGeneralLibraryConstraint empty = const _EmptyPackageVersionNumberGeneralLibrary();

  /// Parses a version constraint.
  ///
  /// This string is one of:
  ///
  ///   * "any". [any] version.
  ///   * "^" followed by a version string. PackageVersionNumberGeneralLibrarys compatible with
  ///     ([PackageVersionNumberGeneralLibraryConstraint.compatibleWith]) the version.
  ///   * a series of version parts. Each part can be one of:
  ///     * A version string like `1.2.3`. In other words, anything that can be
  ///       parsed by [PackageVersionNumberGeneralLibrary.parse()].
  ///     * A comparison operator (`<`, `>`, `<=`, or `>=`) followed by a
  ///       version string.
  ///
  /// Whitespace is ignored.
  ///
  /// Examples:
  ///
  ///     any
  ///     ^0.7.2
  ///     ^1.0.0-alpha
  ///     1.2.3-alpha
  ///     <=5.1.4
  ///     >2.0.4 <= 2.4.6
  factory PackageVersionNumberGeneralLibraryConstraint.parse(String text) {
    var originalText = text;

    void skipWhitespace() {
      text = text.trim();
    }

    skipWhitespace();

    // Handle the "any" constraint.
    if (text == 'any') return any;

    // Try to parse and consume a version number.
    PackageVersionNumberGeneralLibrary? matchPackageVersionNumberGeneralLibrary() {
      var version = startVersion.firstMatch(text);
      if (version == null) return null;

      text = text.substring(version.end);
      return PackageVersionNumberGeneralLibrary.parse(version[0]!);
    }

    // Try to parse and consume a comparison operator followed by a version.
    PackageVersionNumberGeneralLibraryRange? matchComparison() {
      var comparison = startComparison.firstMatch(text);
      if (comparison == null) return null;

      var op = comparison[0]!;
      text = text.substring(comparison.end);
      skipWhitespace();

      var version = matchPackageVersionNumberGeneralLibrary();
      if (version == null) {
        throw FormatException('Expected version number after "$op" in '
            '"$originalText", got "$text".');
      }

      return switch (op) {
        '<=' => PackageVersionNumberGeneralLibraryRange(max: version, includeMax: true),
        '<' => PackageVersionNumberGeneralLibraryRange(max: version, alwaysIncludeMaxPreRelease: true),
        '>=' => PackageVersionNumberGeneralLibraryRange(min: version, includeMin: true),
        '>' => PackageVersionNumberGeneralLibraryRange(min: version),
        _ => throw UnsupportedError(op),
      };
    }

    // Try to parse the "^" operator followed by a version.
    PackageVersionNumberGeneralLibraryConstraint? matchCompatibleWith() {
      if (!text.startsWith(compatibleWithChar)) return null;

      text = text.substring(compatibleWithChar.length);
      skipWhitespace();

      var version = matchPackageVersionNumberGeneralLibrary();
      if (version == null) {
        throw FormatException('Expected version number after '
            '"$compatibleWithChar" in "$originalText", got "$text".');
      }

      if (text.isNotEmpty) {
        throw FormatException('Cannot include other constraints with '
            '"$compatibleWithChar" constraint in "$originalText".');
      }

      return PackageVersionNumberGeneralLibraryConstraint.compatibleWith(version);
    }

    var compatibleWith = matchCompatibleWith();
    if (compatibleWith != null) return compatibleWith;

    PackageVersionNumberGeneralLibrary? min;
    var includeMin = false;
    PackageVersionNumberGeneralLibrary? max;
    var includeMax = false;

    for (;;) {
      skipWhitespace();

      if (text.isEmpty) break;

      var newRange = matchPackageVersionNumberGeneralLibrary() ?? matchComparison();
      if (newRange == null) {
        throw FormatException('Could not parse version "$originalText". '
            'Unknown text at "$text".');
      }

      if (newRange.min != null) {
        if (min == null || newRange.min! > min) {
          min = newRange.min;
          includeMin = newRange.includeMin;
        } else if (newRange.min == min && !newRange.includeMin) {
          includeMin = false;
        }
      }

      if (newRange.max != null) {
        if (max == null || newRange.max! < max) {
          max = newRange.max;
          includeMax = newRange.includeMax;
        } else if (newRange.max == max && !newRange.includeMax) {
          includeMax = false;
        }
      }
    }

    if (min == null && max == null) {
      throw const FormatException('Cannot parse an empty string.');
    }

    if (min != null && max != null) {
      if (min > max) return PackageVersionNumberGeneralLibraryConstraint.empty;
      if (min == max) {
        if (includeMin && includeMax) return min;
        return PackageVersionNumberGeneralLibraryConstraint.empty;
      }
    }

    return PackageVersionNumberGeneralLibraryRange(
        min: min, includeMin: includeMin, max: max, includeMax: includeMax);
  }

  /// Creates a version constraint which allows all versions that are
  /// backward compatible with [version].
  ///
  /// PackageVersionNumberGeneralLibrarys are considered backward compatible with [version] if they
  /// are greater than or equal to [version], but less than the next breaking
  /// version ([PackageVersionNumberGeneralLibrary.nextBreaking]) of [version].
  factory PackageVersionNumberGeneralLibraryConstraint.compatibleWith(PackageVersionNumberGeneralLibrary version) =>
      CompatibleWithPackageVersionNumberGeneralLibraryRange(version);

  /// Creates a new version constraint that is the intersection of
  /// [constraints].
  ///
  /// It only allows versions that all of those constraints allow. If
  /// constraints is empty, then it returns a PackageVersionNumberGeneralLibraryConstraint that allows
  /// all versions.
  factory PackageVersionNumberGeneralLibraryConstraint.intersection(
      Iterable<PackageVersionNumberGeneralLibraryConstraint> constraints) {
    var constraint = PackageVersionNumberGeneralLibraryRange();
    for (var other in constraints) {
      constraint = constraint.intersect(other) as PackageVersionNumberGeneralLibraryRange;
    }
    return constraint;
  }

  /// Creates a new version constraint that is the union of [constraints].
  ///
  /// It allows any versions that any of those constraints allows. If
  /// [constraints] is empty, this returns a constraint that allows no versions.
  factory PackageVersionNumberGeneralLibraryConstraint.unionOf(Iterable<PackageVersionNumberGeneralLibraryConstraint> constraints) {
    var flattened = constraints.expand((constraint) {
      if (constraint.isEmpty) return <PackageVersionNumberGeneralLibraryRange>[];
      if (constraint is PackageVersionNumberGeneralLibraryUnion) return constraint.ranges;
      if (constraint is PackageVersionNumberGeneralLibraryRange) return [constraint];
      throw ArgumentError('Unknown PackageVersionNumberGeneralLibraryConstraint type $constraint.');
    }).toList();

    if (flattened.isEmpty) return PackageVersionNumberGeneralLibraryConstraint.empty;

    if (flattened.any((constraint) => constraint.isAny)) {
      return PackageVersionNumberGeneralLibraryConstraint.any;
    }

    flattened.sort();

    var merged = <PackageVersionNumberGeneralLibraryRange>[];
    for (var constraint in flattened) {
      // Merge this constraint with the previous one, but only if they touch.
      if (merged.isEmpty ||
          (!merged.last.allowsAny(constraint) &&
              !areAdjacent(merged.last, constraint))) {
        merged.add(constraint);
      } else {
        merged[merged.length - 1] =
            merged.last.union(constraint) as PackageVersionNumberGeneralLibraryRange;
      }
    }

    if (merged.length == 1) return merged.single;
    return PackageVersionNumberGeneralLibraryUnion.fromRanges(merged);
  }

  /// Returns `true` if this constraint allows no versions.
  bool get isEmpty;

  /// Returns `true` if this constraint allows all versions.
  bool get isAny;

  /// Returns `true` if this constraint allows [version].
  bool allows(PackageVersionNumberGeneralLibrary version);

  /// Returns `true` if this constraint allows all the versions that [other]
  /// allows.
  bool allowsAll(PackageVersionNumberGeneralLibraryConstraint other);

  /// Returns `true` if this constraint allows any of the versions that [other]
  /// allows.
  bool allowsAny(PackageVersionNumberGeneralLibraryConstraint other);

  /// Returns a [PackageVersionNumberGeneralLibraryConstraint] that only allows [PackageVersionNumberGeneralLibrary]s allowed by both
  /// this and [other].
  PackageVersionNumberGeneralLibraryConstraint intersect(PackageVersionNumberGeneralLibraryConstraint other);

  /// Returns a [PackageVersionNumberGeneralLibraryConstraint] that allows [PackageVersionNumberGeneralLibrary]s allowed by either
  /// this or [other].
  PackageVersionNumberGeneralLibraryConstraint union(PackageVersionNumberGeneralLibraryConstraint other);

  /// Returns a [PackageVersionNumberGeneralLibraryConstraint] that allows [PackageVersionNumberGeneralLibrary]s allowed by this but
  /// not [other].
  PackageVersionNumberGeneralLibraryConstraint difference(PackageVersionNumberGeneralLibraryConstraint other);
}

class _EmptyPackageVersionNumberGeneralLibrary implements PackageVersionNumberGeneralLibraryConstraint {
  const _EmptyPackageVersionNumberGeneralLibrary();

  @override
  bool get isEmpty => true;

  @override
  bool get isAny => false;

  @override
  bool allows(PackageVersionNumberGeneralLibrary other) => false;

  @override
  bool allowsAll(PackageVersionNumberGeneralLibraryConstraint other) => other.isEmpty;

  @override
  bool allowsAny(PackageVersionNumberGeneralLibraryConstraint other) => false;

  @override
  PackageVersionNumberGeneralLibraryConstraint intersect(PackageVersionNumberGeneralLibraryConstraint other) => this;

  @override
  PackageVersionNumberGeneralLibraryConstraint union(PackageVersionNumberGeneralLibraryConstraint other) => other;

  @override
  PackageVersionNumberGeneralLibraryConstraint difference(PackageVersionNumberGeneralLibraryConstraint other) => this;

  @override
  String toString() => '<empty>';
}
