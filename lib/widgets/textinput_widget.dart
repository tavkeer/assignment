import 'package:tavkeer_assignment/exports.dart';

class TextInputWidget extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController textController;
  final Widget? trailingWidget;
  final TextInputType? keyboard;
  final bool? hidePass;
  final bool? required;
  final bool? readOnly;
  final void Function()? ontap;

  const TextInputWidget({
    super.key,
    required this.title,
    required this.hint,
    required this.textController,
    this.trailingWidget,
    this.keyboard,
    this.hidePass,
    this.required,
    this.readOnly,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF121212),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (required ?? false)
                const Text(
                  ' *',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          onTap: ontap,
          controller: textController,
          keyboardType: keyboard,
          readOnly: readOnly ?? false,
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
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            hintStyle: const TextStyle(
              color: Color(0xFF8F8F8F),
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
