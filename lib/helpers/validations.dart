import '../constants/validation.dart';

bool validateMinLength(String value) => value.length >= MIN_LENGTH_NUMBER;
bool validateMaxLength(String value) => value.length <= MAX_LENGTH_NUMBER;
bool validateOneUppercaseLetter(String value) =>
    value.contains(UPPERCASE_LETTER_REGEXP);
bool validateOneDigit(String value) => value.contains(ONE_DIGIT_REGEXP);
