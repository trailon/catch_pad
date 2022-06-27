class URL {
  static String baseUrl = "http://www.boredapi.com/";
  static String api = "api/";
  static String activity = "$baseUrl${api}activity/";
  static String priceRange(num min, num max) =>
      "$activity?minprice=$min&maxprice=$max";
  static String participantFilter(int amount) =>
      "$activity?participants=$amount";
  static String typeFilter(String type) =>
      "$activity?type=$type";
}
