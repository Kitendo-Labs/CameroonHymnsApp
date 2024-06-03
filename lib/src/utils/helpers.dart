enum Compare {
  equal,
  greaterThan,
  lessThan,
}
Compare compareVersions(String main, String other) {
  final splitMain = main.split(".");
  final splitOther = other.split(".");

  final mainMajor = int.parse(splitMain[0]);
  final mainMinor = int.parse(splitMain[1]);
  final mainPatch = int.parse(splitMain[2]);

  final otherMajor = int.parse(splitOther[0]);
  final otherMinor = int.parse(splitOther[1]);
  final otherPatch = int.parse(splitOther[2]);

  // 1. Compare major versions
  if (mainMajor > otherMajor) {
    return Compare.greaterThan;
  } else if (mainMajor < otherMajor) {
    return Compare.lessThan;
  }

  // 2. Compare minor versions
  if (mainMinor > otherMinor) {
    return Compare.greaterThan;
  } else if (mainMinor < otherMinor) {
    return Compare.lessThan;
  }

  // 3. Compare patch versions
  if (mainPatch > otherPatch) {
    return Compare.greaterThan;
  } else if (mainPatch < otherPatch) {
    return Compare.lessThan;
  }

  // 4. Versions are equal
  return Compare.equal;
}
