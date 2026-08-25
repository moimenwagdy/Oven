// ============================================================
// File: validators.dart
// Path: lib/core/validators/validators.dart
// Goal: Provides reusable validation methods used throughout
//       the application, including the multi-step signup flow.
//       Validators return null when the value is valid and an
//       error message when the value is invalid.
// ============================================================

class Validators {
  Validators._();

  // ==========================================================
  // Required / Empty
  // ==========================================================

  static String? validateIsNotEmpty(
    String? value, {
    String message = 'This field is required',
  }) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }

    return null;
  }

  // ==========================================================
  // Email
  // ==========================================================

  static String? validateEmail(
    String? value, {
    String requiredMessage = 'Email is required',
    String invalidMessage = 'Enter a valid email',
  }) {
    if (value == null || value.trim().isEmpty) {
      return requiredMessage;
    }

    final email = value.trim();

    final regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

    if (!regex.hasMatch(email)) {
      return invalidMessage;
    }

    return null;
  }

  // ==========================================================
  // Password
  // ==========================================================

  static String? validatePassword(
    String? value, {
    int minLength = 8,
    String requiredMessage = 'Password is required',
    String? minLengthMessage,
  }) {
    if (value == null || value.isEmpty) {
      return requiredMessage;
    }

    if (value.length < minLength) {
      return minLengthMessage ??
          'Password must be at least $minLength characters';
    }

    return null;
  }

  // ==========================================================
  // Confirm Password
  // ==========================================================

  static String? validateConfirmPassword(
    String? value,
    String? original, {
    String requiredMessage = 'Please confirm your password',
    String mismatchMessage = 'Passwords do not match',
  }) {
    if (value == null || value.isEmpty) {
      return requiredMessage;
    }

    if (value != original) {
      return mismatchMessage;
    }

    return null;
  }

  // ==========================================================
  // Phone
  // ==========================================================

  static String? validatePhone(
    String? value, {
    String requiredMessage = 'Phone number is required',
    String invalidMessage = 'Enter a valid phone number',
  }) {
    if (value == null || value.trim().isEmpty) {
      return requiredMessage;
    }

    final phone = value.trim();

    // Egyptian mobile numbers.
    final regex = RegExp(r'^(010|011|012|015)[0-9]{8}$');

    if (!regex.hasMatch(phone)) {
      return invalidMessage;
    }

    return null;
  }

  // ==========================================================
  // Dropdown / Selection
  // ==========================================================

  static String? validateDropdown<T>(
    T? value, {
    String message = 'Please select an option',
  }) {
    if (value == null) {
      return message;
    }

    return null;
  }

  // ==========================================================
  // Numeric values
  // ==========================================================

  static String? validateNumber(
    String? value, {
    String requiredMessage = 'This field is required',
    String invalidMessage = 'Enter a valid number',
  }) {
    if (value == null || value.trim().isEmpty) {
      return requiredMessage;
    }

    if (double.tryParse(value.trim()) == null) {
      return invalidMessage;
    }

    return null;
  }

  // ==========================================================
  // Integer values
  // ==========================================================

  static String? validateInteger(
    String? value, {
    String requiredMessage = 'This field is required',
    String invalidMessage = 'Enter a valid number',
  }) {
    if (value == null || value.trim().isEmpty) {
      return requiredMessage;
    }

    if (int.tryParse(value.trim()) == null) {
      return invalidMessage;
    }

    return null;
  }

  static String? validateUserName(
    String? value, {
    int minLength = 2,
    int maxLength = 50,
    String requiredMessage = 'Name is required',
    String invalidMessage = 'Enter a valid name',
  }) {
    if (value == null || value.trim().isEmpty) {
      return requiredMessage;
    }

    final name = value.trim();

    if (name.length < minLength) {
      return 'Name must be at least $minLength characters';
    }

    if (name.length > maxLength) {
      return 'Name must not exceed $maxLength characters';
    }

    // Allows letters, spaces, hyphens, and apostrophes.
    final regex = RegExp(r"^[\p{L}]+(?:[ '\-][\p{L}]+)*$", unicode: true);

    if (!regex.hasMatch(name)) {
      return invalidMessage;
    }

    return null;
  }
}
