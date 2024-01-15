class StringUtil {
  static String convertToUrl(String url) {
    return url.contains('https://') ? url : 'https://$url';
  }
}