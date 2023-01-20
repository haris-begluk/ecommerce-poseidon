bool compareInt(int? v1, int? v2) => v1 == null || v2 == null
    ? false
    : v1 != v2
        ? false
        : true;

String truncate(String v, int numChars, {String addToEnd = ''}) =>
    v.length > numChars ? v.substring(0, numChars) + addToEnd : v;

String rmNewline(String v) => v.replaceAll('\n', ' ');
