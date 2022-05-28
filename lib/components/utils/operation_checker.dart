bool isTrue(bool? data) {
  assert(data != null, false);

  return data ?? false;
}

int? isInteger(String? data, [int? radix]) {
  assert(data != null, null);

  return int.tryParse(data ?? "", radix: radix);
}
