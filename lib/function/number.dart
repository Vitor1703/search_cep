String getJustNumbers(String? value) {
  return (value ?? '').replaceAll(RegExp('[^0-9]'), '');
}