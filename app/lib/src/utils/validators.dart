class Validations {
  //Validate email id
  static String isEmail(String value) {
    if (value.isEmpty) return 'Email не может быть пустым';
    final RegExp emailExp = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!emailExp.hasMatch(value))
      return 'Пожалуйста, проверьте введенный email';
    return null;
  }

  //Validate password
  static String checkPassword(String value) {
    if (value.isEmpty) return 'Пароль не может быть пустым';
    if (value.length < 6) return 'Пароль должен содержать 6 или более символов';
    return null;
  }
}
