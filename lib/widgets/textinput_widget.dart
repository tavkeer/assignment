import 'package:tavkeer_assignment/exports.dart';

class TextInputWidget extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController textController;
  final Widget? trailingWidget;
  final TextInputType? keyboard;
  final bool? hidePass;
  const TextInputWidget(
      {super.key,
      required this.title,
      required this.hint,
      required this.textController,
      this.trailingWidget,
      this.keyboard,
      this.hidePass});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF121212),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: textController,
          keyboardType: keyboard,
          obscureText: hidePass ?? false,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 20, top: 15, bottom: 15),
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: const BorderSide(
                color: Color(0x25121212),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: const BorderSide(
                color: Color(0x25121212),
              ),
            ),
            hintStyle: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            hintText: hint,
            suffixIcon: trailingWidget,
          ),
        ),
      ],
    );
  }
}
