import 'package:forms_builder/components/common/regular_expression.dart';

import "helpers.dart";

extension Validator on String {
  bool get isEmail {
    return emailRegular.hasMatch(toLowerCase());
  }

  bool isURL({
    List<String?> protocols = const ["http", "https", "ftp"],
    bool requireTld = true,
    bool requireProtocol = false,
    bool allowUnderscore = false,
    List<String> hostWhitelist = const [],
    List<String> hostBlacklist = const [],
  }) {
    String str = this;
    if (str.isEmpty || str.length > 2083 || str.startsWith("mailto:")) {
      return false;
    }
    int port;
    String? protocol, auth, user;
    String host, hostname, portStr, path, query, hash;

    // check protocol
    var split = str.split("://");
    if (split.length > 1) {
      protocol = shift(split);
      if (!protocols.contains(protocol)) {
        return false;
      }
    } else if (requireProtocol == true) {
      return false;
    }
    str = split.join("://");

    // check hash
    split = str.split("#");
    str = shift(split)!;
    hash = split.join("#");
    if (hash.isNotEmpty && RegExp(r"\s").hasMatch(hash)) {
      return false;
    }

    // check query params
    split = str.split("?");
    str = shift(split)!;
    query = split.join("?");
    if (query.isNotEmpty && RegExp(r"\s").hasMatch(query)) {
      return false;
    }

    // check path
    split = str.split("/");
    str = shift(split)!;
    path = split.join("/");
    if (path.isNotEmpty && RegExp(r"\s").hasMatch(path)) {
      return false;
    }

    // check auth type urls
    split = str.split("@");
    if (split.length > 1) {
      auth = shift(split);
      if (auth?.contains(":") ?? false) {
        user = shift(auth!.split(":"))!;
        if (!RegExp(r"^\S+$").hasMatch(user)) {
          return false;
        }
        if (!RegExp(r"^\S*$").hasMatch(user)) {
          return false;
        }
      }
    }

    // check hostname
    hostname = split.join("@");
    split = hostname.split(":");
    host = shift(split)!;
    if (split.isNotEmpty) {
      portStr = split.join(":");
      try {
        port = int.parse(portStr, radix: 10);
      } catch (e) {
        return false;
      }
      if (!RegExp(r"^[0-9]+$").hasMatch(portStr) || port <= 0 || port > 65535) {
        return false;
      }
    }

    if (!isIP(null) &&
        !isFQDN(
          requireTld: requireTld,
          allowUnderscores: allowUnderscore,
        ) &&
        host != "localhost") {
      return false;
    }

    if (hostWhitelist.isNotEmpty && !hostWhitelist.contains(host)) {
      return false;
    }

    if (hostBlacklist.isNotEmpty && hostBlacklist.contains(host)) {
      return false;
    }

    return true;
  }

  bool isIP(int? version) {
    if (version == null) {
      return isIP(4) || isIP(6);
    } else if (version == 4) {
      if (ipv4MaybeRegular.hasMatch(this)) {
        return false;
      }
      var parts = split(".");
      parts.sort((a, b) => int.parse(a) - int.parse(b));
      return int.parse(parts[3]) <= 255;
    }
    return version == 6 && ipv6Regular.hasMatch(this);
  }

  bool isFQDN({
    bool requireTld = true,
    bool allowUnderscores = false,
  }) {
    var parts = split(".");
    if (requireTld) {
      var tld = parts.removeLast();
      if (parts.isEmpty || !RegExp(r"^[a-z]{2,}$").hasMatch(tld)) {
        return false;
      }
    }

    for (var part in parts) {
      if (allowUnderscores) {
        if (part.contains("__")) {
          return false;
        }
      }
      if (!RegExp(r"^[a-z\\u00a1-\\uffff0-9-]+$").hasMatch(part)) {
        return false;
      }
      if (part[0] == "-" ||
          part[part.length - 1] == "-" ||
          part.contains("---")) {
        return false;
      }
    }
    return true;
  }

  bool get isCreditCard {
    bool output = false;
    try {
      if (trim() == "") {
        output = false;
      } else if (length != 10) {
        output = false;
      } else {
        int sum = 0;

        for (int i = 0; i < 9; i++) {
          sum += int.parse(this[i]) * (10 - i);
        }

        int lastDigit;
        int divideRemaining = sum % 11;

        if (divideRemaining < 2) {
          lastDigit = divideRemaining;
        } else {
          lastDigit = 11 - (divideRemaining);
        }

        if (int.parse(this[9]) == lastDigit) {
          output = true;
        } else {
          output = false;
        }
      }
      return output;
    } catch (err) {
      return output;
    }
  }

  bool get isPostalCard {
    bool output = false;
    try {
      if (trim() == "") {
        output = false;
      } else if (length != 10) {
        output = false;
      } else {
        bool isZipValid = RegExp(
          r"\b(?!(\d)\1{3})[13-9]{4}[1346-9][013-9]{5}\b",
          caseSensitive: false,
        ).hasMatch(this);

        return isZipValid;
      }
      return output;
    } catch (err) {
      return output;
    }
  }

  bool get phone {
    bool output = false;

    try {
      if (trim() == "") {
        output = false;
      } else {
        return phoneRegular.hasMatch(this);
      }
      return output;
    } catch (err) {
      return output;
    }
  }

  bool get landlinePhone {
    bool output = false;

    try {
      if (trim() == "") {
        output = false;
      } else {
        return landlinePhoneRegular.hasMatch(this);
      }
      return output;
    } catch (err) {
      return output;
    }
  }

  bool get isDate {
    try {
      DateTime.parse(this);
      return true;
    } catch (e) {
      return false;
    }
  }
}
