import 'package:flutter/material.dart';

bool isFormValid(List<String?> results) {
  return results.where((e) => e != null).isEmpty;
}

FormFieldValidator<String> get requiredValidator =>
    (String? v) => v?.isNotEmpty != true ? 'Required Field' : null;

FormFieldValidator<T> valueValidator<T>([String? error]) =>
    (T? value) => value == null ? (error ?? 'Required Field') : null;

RegExp _emailRegex = RegExp(
  r"^((([a-z]|\d|[!#\$%&'*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$",
);

FormFieldValidator<String> get emailValidator =>
    (String? v) =>
        _emailRegex.hasMatch(v?.toLowerCase() ?? '') ? null : 'Invalid email';

FormFieldValidator<String> get combinedPasswordValidator =>
    (v) => passwordLengthValidator(v) ?? passwordCaseValidator(v); //removed 

FormFieldValidator<String> get passwordLengthValidator =>
    (v) => (v?.length ?? 0) >= 8 ? null : 'Must be at least 8 characters';

FormFieldValidator<String> get passwordCaseValidator =>
    (v) =>
        [
          RegExp(r'(?=.*[A-Z])'),
          RegExp(r'(?=.*[a-z])'),
        ].fold(true, (pv, e) => pv && e.hasMatch(v ?? ''))
        ? null
        : 'At least one uppercase and one lowercase';

FormFieldValidator<String> get passwordDigitValidator =>
    (v) =>
        [
          RegExp(r'(?=.*?[0-9])'),
          RegExp(r'(?=.*?[!@#$&*~^%()/.])'),
        ].fold(true, (pv, e) => pv && e.hasMatch(v ?? ''))
        ? null
        : 'At least one number and one special character';

FormFieldValidator<String> get nameValidator =>
    (v) => v?.isNotEmpty != true ? 'Enter a name' : null;

FormFieldValidator<String> minLengthValidator(int length) =>
    (String? v) =>
        (v?.length ?? 0) < length ? 'Minimum of $length characters' : null;

FormFieldValidator<String> maxLengthValidator(int length) =>
    (String? v) =>
        (v?.length ?? 0) > length ? 'Maximum of $length characters' : null;

FormFieldValidator<String> equalLengthValidator(int length) =>
    (String? v) =>
        minLengthValidator(length)(v) ?? maxLengthValidator(length)(v);

FormFieldValidator get phoneValidator =>
    (v) => v?.isNotEmpty != true ? 'Enter a phone number' : null;

bool hasAlphabets(String v) => RegExp(r'[a-zA-Z]').hasMatch(v);

FormFieldValidator<String> passwordStrengthValidator({
  required String name,
  required String email,
}) {
  return (String? password) {
    final value = password ?? '';
    if (value.length < 8) {
      return null;
    }
    if (value.contains(' ')) {
      return null;
    }
    if (!RegExp(r'[0-9!@#$%^&*()_+\-=\[\]{};:"\\|,.<>\/?]').hasMatch(value)) {
      return null;
    }
    if (name.isNotEmpty && value.toLowerCase().contains(name.toLowerCase())) {
      return null;
    }
    if (email.isNotEmpty && value.toLowerCase().contains(email.toLowerCase())) {
      return null;
    }
    return null;
  };
}
