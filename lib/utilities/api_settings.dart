mixin ApiSettings {
  static const String _API_BASE_URL = 'https://jsonplaceholder.typicode.com/';

  static const String GET_POST =
      _API_BASE_URL +"posts?";
  static const String CREATE_TEMP_USER = _API_BASE_URL + "temp-user/create";
  static const String GET_UPDATE_USER_DETILES = _API_BASE_URL + "user";
  static const String LOGIN_USER = _API_BASE_URL + "login";
  static const String REGISTER_USER = _API_BASE_URL + "temp-user/register";
  static const String VERIFY_CODE_USER = _API_BASE_URL + "contact/otp/verify/";
  static const String RESEND_CODE = _API_BASE_URL + "contact/otp/resend/";
  static const String GET_BRANCH = _API_BASE_URL + "nearby/";
  static const String GET_BRANCH_DETILES = _API_BASE_URL + "branch/";
  static const String GET_ADDRESSES = _API_BASE_URL + "user/addresses";
  static const String ADD_REMOVE_PRODUCT_TO_WISHLIST =
      _API_BASE_URL + "wishlist/";
  static const String GET_PRODUCT_WISHLIST = _API_BASE_URL + "wishlist";
  static const String ADD_REMOVE_UPDATE_ADDRESS =
      _API_BASE_URL + "user/address";
  static const String GET_OFFER = _API_BASE_URL + "offer/nearby";
  static const String GET_COUNTRIES = _API_BASE_URL + "countries";
  static const String GET_SUGGESTION = _API_BASE_URL + "suggestion";
  static const String CHANGE_PASSWORD = _API_BASE_URL + "password";
  static const String FORGET_PASSWORD = _API_BASE_URL + "password/reset";
  static const String SUPER_SEARCH = _API_BASE_URL + "super-search";
  static const String GET_NEARBY_CUISINES = _API_BASE_URL + "cuisines/";
  static const String GET_CHECKOUT_DETAILS = _API_BASE_URL + "checkout/details";
  static const String GET_CHECKOUT = _API_BASE_URL + "checkout";
  static const String GET_HISTORY = _API_BASE_URL + "orders/history";
  static const String GET_ORDER = _API_BASE_URL + "orders/";
  static const String GET_ORDER_PENDING = _API_BASE_URL + "orders/pending";
}
