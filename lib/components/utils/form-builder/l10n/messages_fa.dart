// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import "package:intl/intl.dart";
import "package:intl/message_lookup_by_library.dart";

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => "fa";

  static m1(max) => "مقدار باید برابر یا کمتر از ${max} باشد.";

  static m2(maxLength) =>
      "مقدار باید دارای طول بزرگتر یا برابر ${maxLength} باشد.";

  static m3(min) => "مقدار باید برابر یا بیشتر از ${min} باشد.";

  static m4(minLength) =>
      "مقدار باید دارای طول بزرگتر یا برابر {minLength} باشد.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function>{
        "creditCardErrorText": MessageLookupByLibrary.simpleMessage(
            "این ورودی به شماره کارت اعتباری معتبر نیاز دارد."),
        "dateStringErrorText": MessageLookupByLibrary.simpleMessage(
            "این ورودی به یک تاریخ معتبر نیاز دارد."),
        "emailErrorText": MessageLookupByLibrary.simpleMessage(
            "این ورودی به یک آدرس ایمیل معتبر نیاز دارد."),
        "ipErrorText": MessageLookupByLibrary.simpleMessage(
            "این قسمت نیاز به یک IP معتبر دارد."),
        "matchErrorText":
            MessageLookupByLibrary.simpleMessage("مقدار با الگو مطابقت ندارد."),
        "maxErrorText": m1,
        "maxLengthErrorText": m2,
        "minErrorText": m3,
        "minLengthErrorText": m4,
        "numericErrorText":
            MessageLookupByLibrary.simpleMessage("مقدار باید عددی باشد."),
        "requiredErrorText": MessageLookupByLibrary.simpleMessage(
            "این ورودی نمی تواند خالی باشد."),
        "urlErrorText": MessageLookupByLibrary.simpleMessage(
            "این ورودی به آدرس اینترنتی معتبر نیاز دارد.")
      };
}
