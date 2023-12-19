import 'package:tavkeer_assignment/exports.dart';

class OtpDigitHolder extends StatelessWidget {
  const OtpDigitHolder({
    super.key,
    required this.controller,
    this.onchanged,
  });
  final TextEditingController controller;
  final void Function()? onchanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: TextFormField(
        // onSaved: (newvalue) => onsave!(newvalue),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
            controller.text = value;
          } else if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }

          onchanged?.call();
        },
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFF8F8F8F),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFF8F8F8F),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        textAlign: TextAlign.center,
      ),
    );
  }
}
