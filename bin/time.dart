// ignore_for_file: unnecessary_brace_in_string_interps


void main(List<String> args) {
  Map<String, dynamic> kosnol = {
    "sapslapslap": "Saplsap",
    "saplspalspa": "spalspalspa",
    "Slebew": {
      "slaslpals": "saplspalspa",
      "saplspalspalps": "spalpslapslpa",
      "saplspalspalspla": GeneralTypes.values,
    },
  };
  slebew(data: kosnol);
}

void slebew({
  required Map data,
}) {
  data.forEach((key, value) {
    if (value is Map) {
      slebew(data: value);
    } else if (value is Enum) {
    } else if (value is List<Enum>) {
      print("key: ${key} value: ${value.first}");
    } else {
      print("key: ${key} value: ${value}");
    }
  });
}

enum GeneralTypes {
  install,
  fullscee,
  slebwe,
}
