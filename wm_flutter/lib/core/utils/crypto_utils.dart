import 'dart:math';

class CryptoUtils {
  final Random random = Random();

  String generateV4Uuid() {
    // A list of 16-bit integers to store the random bytes
    List<int> bytes = List<int>.generate(16, (i) => random.nextInt(256));

    // 1. Set the version bits (4) in the time_high_and_version field (Byte 6)
    // This sets the 4 MSBs (Most Significant Bits) to 0100 (which is 4)
    bytes[6] = (bytes[6] & 0x0f) | 0x40;
    // Explanation:
    // - (bytes[6] & 0x0f) preserves the last 4 bits.
    // - | 0x40 sets the first 4 bits to 0100 (binary for 4).

    // 2. Set the variant bits (10xx) in the clock_seq_high_and_reserved field (Byte 8)
    // This sets the 2 MSBs to 10 (binary) as required for the standard variant.
    bytes[8] = (bytes[8] & 0x3f) | 0x80;
    // Explanation:
    // - (bytes[8] & 0x3f) preserves the last 6 bits.
    // - | 0x80 sets the first 2 bits to 10.

    // 3. Convert the bytes to the standard UUID string format
    final StringBuffer buffer = StringBuffer();

    // Helper function to format a byte as a 2-digit hex string
    String toHex(int value) => value.toRadixString(16).padLeft(2, '0');

    // Group 1: 8 hex digits (bytes 0-3)
    buffer.write(toHex(bytes[0]));
    buffer.write(toHex(bytes[1]));
    buffer.write(toHex(bytes[2]));
    buffer.write(toHex(bytes[3]));
    buffer.write('-');

    // Group 2: 4 hex digits (bytes 4-5)
    buffer.write(toHex(bytes[4]));
    buffer.write(toHex(bytes[5]));
    buffer.write('-');

    // Group 3: 4 hex digits (bytes 6-7) - contains the V4 marker
    buffer.write(toHex(bytes[6]));
    buffer.write(toHex(bytes[7]));
    buffer.write('-');

    // Group 4: 4 hex digits (bytes 8-9) - contains the variant marker
    buffer.write(toHex(bytes[8]));
    buffer.write(toHex(bytes[9]));
    buffer.write('-');

    // Group 5: 12 hex digits (bytes 10-15)
    for (int i = 10; i < 16; i++) {
      buffer.write(toHex(bytes[i]));
    }

    return buffer.toString();
  }

  static String generatePassword({int length = 12}) {
    // Define character sets
    const String lowercase = 'abcdefghijklmnopqrstuvwxyz';
    const String uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const String numbers = '0123456789';
    const String symbols = '!@#\$%^&*()_+-=[]{};:<>.,/?';

    // Combine all character sets
    const String allChars = lowercase + uppercase + numbers + symbols;

    // Ensure at least one of each type for security compliance
    String password = '';

    // Use a cryptographically secure random number generator
    final Random random = Random.secure();

    // 1. Start by ensuring the password contains at least one of each type
    password += lowercase[random.nextInt(lowercase.length)];
    password += uppercase[random.nextInt(uppercase.length)];
    password += numbers[random.nextInt(numbers.length)];
    password += symbols[random.nextInt(symbols.length)];

    // 2. Fill the rest of the length with random characters from the combined set
    for (int i = password.length; i < length; i++) {
      int randomIndex = random.nextInt(allChars.length);
      password += allChars[randomIndex];
    }

    // 3. Shuffle the characters to prevent predictable patterns (e.g., lowercase first)
    List<String> passwordChars = password.split('');
    passwordChars.shuffle(random);

    // 4. Return the final shuffled password
    return passwordChars.join();
  }
}
