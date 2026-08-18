String getInitials(String name) {
  final trimmedName = name.trim();

  if (trimmedName.isEmpty) {
    return '?';
  }

  final parts = trimmedName.split(
    RegExp(r'\s+'),
  );

  if (parts.length == 1) {
    return parts.first
        .substring(0, 1)
        .toUpperCase();
  }

  return '${parts.first.substring(0, 1)}'
          '${parts.last.substring(0, 1)}'
      .toUpperCase();
}