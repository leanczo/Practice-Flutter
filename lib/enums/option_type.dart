enum OptionType {
  multiple, // (1 in API) check
  single, //   (2 in API) radio
  drop, //     (3 in API) dropdown
}

OptionType getOptionType(String optionType) {
  int index = 0;
  for (OptionType action in OptionType.values) {
    if (action.toString().split('.').last == optionType) {
      return OptionType.values[index];
    }
    index++;
  }
  return null;
}

OptionType getOptionTypeFromInt(int value) {
  if (value != null && value > 0 && value <= OptionType.values.length) {
    return OptionType.values[value - 1];
  } else {
    return null;
  }
}

String getOptionString(OptionType optionType) {
  String str = optionType.toString().split('.').last;
  return str;
}
