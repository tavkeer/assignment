// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:tavkeer_assignment/exports.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
    required this.email,
    required this.password,
    required this.gender,
    required this.dob,
    required this.fullName,
    required this.phone,
    required this.age,
    required this.address,
    required this.city,
    required this.state,
    required this.pinCode,
  });
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController gender;
  final TextEditingController dob;
  final TextEditingController fullName;
  final TextEditingController phone;
  final TextEditingController age;
  final TextEditingController address;
  final TextEditingController city;
  final TextEditingController state;
  final TextEditingController pinCode;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  void initState() {
    getLocation();
    super.initState();
  }

  getPlaceDetails(double latitude, double longitude) async {
    final apiUrl =
        'https://nominatim.openstreetmap.org/reverse?format=json&lat=$latitude&lon=$longitude';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final result = json.decode(response.body);

        if (result['address'] != null) {
          final addressDetails = result['address'];
          String addressfetched = addressDetails['road'] ?? '';
          String cityfetched = addressDetails['city'] ?? '';
          String statefetched = addressDetails['state'] ?? '';
          String pincodefetched = addressDetails['postcode'] ?? '';

          widget.address.text = addressfetched;
          widget.city.text = cityfetched;
          widget.state.text = statefetched;
          widget.pinCode.text = pincodefetched;
        } else {
          return {'error': 'Unable to fetch place details'};
        }
      } else {
        return {'error': 'Error: ${response.statusCode}'};
      }
    } catch (e) {
      return {'error': 'Error: $e'};
    }
    Get.find<SignUpController>().gettinglocation.value = false;
  }

  getLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    LocationData locationData = await location.getLocation();
    getPlaceDetails(locationData.latitude!, locationData.longitude!);
    debugPrint('Location: ${locationData.latitude}, ${locationData.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //name
        TextInputWidget(
          title: 'Full Name',
          hint: 'Enter Full Name',
          textController: widget.fullName,
          required: true,
        ),
        const SizedBox(height: 15),

        //gender
        TextInputWidget(
          title: 'Gender',
          hint: 'Enter Gender',
          textController: widget.gender,
          readOnly: true,
          required: true,
          trailingWidget: PopupMenuButton<String>(
            icon: Icon(Icons.keyboard_arrow_down, color: appThemeColor),
            itemBuilder: (context) {
              return <PopupMenuEntry<String>>[
                for (String option in ['Male', 'Female', 'Other'])
                  PopupMenuItem<String>(
                    value: option,
                    child: Text(
                      option,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ];
            },
            onSelected: (String value) {
              widget.gender.text = value;
            },
          ),
        ),
        const SizedBox(height: 15),

        //dob
        TextInputWidget(
          title: 'D.O.B',
          hint: 'Enter D.O.B',
          textController: widget.dob,
          readOnly: true,
          trailingWidget: Icon(
            Icons.calendar_month,
            color: appThemeColor,
          ),
          ontap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return DateDialog(controller: widget.dob);
              },
            );
          },
          required: true,
        ),
        const SizedBox(height: 15),

        //email
        TextInputWidget(
          title: 'Email-Address',
          hint: 'Enter E-mail Address',
          keyboard: TextInputType.emailAddress,
          textController: widget.email,
          required: true,
        ),
        const SizedBox(height: 15),

        //password
        Obx(
          () => TextInputWidget(
            title: 'Password',
            hint: 'Enter Password ',
            textController: widget.password,
            hidePass: Get.find<SignUpController>().passwordLoading.value,
            trailingWidget: PasswordsVisibilityWidget(),
            required: true,
          ),
        ),
        const SizedBox(height: 15),

        //mobile number
        TextInputWidget(
          title: 'Mobile Number',
          hint: 'Enter Mobile Numbe',
          keyboard: TextInputType.number,
          textController: widget.phone,
          required: true,
        ),
        const SizedBox(height: 15),

        //age
        TextInputWidget(
          title: 'Age',
          hint: 'Enter Age',
          keyboard: TextInputType.number,
          textController: widget.age,
          required: true,
        ),
        const SizedBox(height: 15),

        //address
        Obx(
          () => (Get.find<SignUpController>().gettinglocation.value)
              ? Loading()
              : TextInputWidget(
                  title: 'Address',
                  hint: 'Enter Address',
                  textController: widget.address,
                  readOnly: true,
                  required: true,
                  trailingWidget: ImageIcon(
                    AssetImage('assets/icons/location.png'),
                    size: 30,
                    color: Colors.black,
                  ),
                ),
        ),
        Obx(
          () => (Get.find<SignUpController>().gettinglocation.value)
              ? SizedBox.shrink()
              : const SizedBox(height: 15),
        ),

        //city
        Obx(
          () => (Get.find<SignUpController>().gettinglocation.value)
              ? SizedBox.shrink()
              : TextInputWidget(
                  title: 'City',
                  hint: 'Enter City',
                  readOnly: true,
                  textController: widget.city,
                  required: true,
                ),
        ),
        Obx(
          () => (Get.find<SignUpController>().gettinglocation.value)
              ? SizedBox.shrink()
              : const SizedBox(height: 15),
        ),

        //state
        Obx(
          () => (Get.find<SignUpController>().gettinglocation.value)
              ? SizedBox.shrink()
              : TextInputWidget(
                  title: 'State',
                  hint: 'Enter State',
                  readOnly: true,
                  textController: widget.state,
                  required: true,
                ),
        ),
        Obx(
          () => (Get.find<SignUpController>().gettinglocation.value)
              ? SizedBox.shrink()
              : const SizedBox(height: 15),
        ),

        //pincode
        Obx(
          () => (Get.find<SignUpController>().gettinglocation.value)
              ? SizedBox.shrink()
              : TextInputWidget(
                  title: 'Pincode',
                  hint: 'Enter Pincode',
                  readOnly: true,
                  textController: widget.pinCode,
                  required: true,
                ),
        ),
        Obx(
          () => (Get.find<SignUpController>().gettinglocation.value)
              ? SizedBox.shrink()
              : const SizedBox(height: 15),
        ),
      ],
    );
  }
}
