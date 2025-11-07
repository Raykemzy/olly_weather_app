/// A collection of common validators that can be reused
class Validators {
  static final emailPattern = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@"
    '[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}'
    r'[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}'
    r'[a-zA-Z0-9])?)+\s*$',
  );

  static Validator notEmpty() {
    return (String? value) {
      return (value?.isEmpty ?? true) ? 'This field can not be empty.' : null;
    };
  }

  static Validator matchPattern(
    Pattern pattern, [
    String? patternName,
    String? text,
  ]) {
    return (String? value) {
      if (value == null || (pattern.allMatches(value).isEmpty)) {
        return text ?? "Please enter a valid ${patternName ?? "value"}.";
      }
      return null;
    };
  }

  static Validator email([String? text]) {
    return matchPattern(emailPattern, 'email', text);
  }
}

typedef Validator = String? Function(String? value);
