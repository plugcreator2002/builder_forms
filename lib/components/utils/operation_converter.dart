import 'package:forms_builder/components/common/regular_expression.dart';

/// convert string to number with error controlling,
/// because we have a lot errors like that
num? numParser(data) {
  assert(
    data is num || data is String && numberRegular.hasMatch(data),
    "this data cant be a num type", // 0
  );

  if (data is num) return data;

  return num.parse(data.toString());
}
