class Teacher {
  String name;
  String email;
  String image_profile;

  Teacher({this.name = '', this.email = '', this.image_profile = ''});
  @override
  String toString() {
    return 'Teacher{name: $name, email: $email, imageProfile: $image_profile}';
  }
}
