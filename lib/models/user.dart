class UserModel {
  String? fullName;
  String? dob;
  String? gender;
  String? email;
  String? phone;
  String? age;
  String? address;
  String? city;
  String? state;
  String? pinCode;
  String? password;
  UserModel({
    this.fullName,
    this.dob,
    this.gender,
    this.email,
    this.phone,
    this.age,
    this.address,
    this.city,
    this.pinCode,
    this.state,
    this.password,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    age = json['age'];
    city = json['city'];
    dob = json['dob'];
    email = json['email'];
    fullName = json['fullName'];
    gender = json['gender'];
    phone = json['phone'];
    state = json['state'];
    pinCode = json['pincode'];
  }
  // static UserModel demoUser = UserModel(
  //   fullName: 'Maria',
  //   dob: '25-12-1990',
  //   gender: 'Female',
  //   age: '24',
  //   city: 'New Delhi',
  //   address: '235 A, tower b , New delhi',
  //   state: 'Delhi',
  //   phone: '+91  7554126442',
  //   email: 'malina@gamil.com',
  // );
}
