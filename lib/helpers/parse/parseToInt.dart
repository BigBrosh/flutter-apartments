int parseToInt(dynamic value) =>
    value.runtimeType == int ? value : (int.tryParse(value) ?? 0);