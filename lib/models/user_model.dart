class AppData {
  static String name = '';
  static String email = '';
  static String firstName = '';
  static String lastName = '';
  static String location = '';
  static String mobileNo = '';

  static void setUserData({
    required String name,
    required String email,
    String? firstName,
    String? lastName,
    String? location,
    String? mobileNo,
  }) {
    AppData.name = name;
    AppData.email = email;
    AppData.firstName = firstName ?? '';
    AppData.lastName = lastName ?? '';
    AppData.location = location ?? '';
    AppData.mobileNo = mobileNo ?? '';
  }

  static void fromMap(Map<String, dynamic> data) {
    name = data['name'] as String? ?? '';
    email = data['email'] as String? ?? '';
    firstName = data['firstName'] as String? ?? '';
    lastName = data['lastName'] as String? ?? '';
    location = data['location'] as String? ?? '';
    mobileNo = data['mobileNo'] as String? ?? '';
  }

  static Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'location': location,
      'mobileNo': mobileNo,
    };
  }
}
