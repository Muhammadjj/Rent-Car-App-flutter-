import '../../../../Export/export.dart';

class CustomTextField extends StatelessWidget {
  final InputDecoration? decoration;
  final InputBorder? border;
  final Widget? suffix;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    this.decoration,
    this.border,
    this.suffix,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: FocusNode(),
      controller: controller,
      decoration: decoration ??
          InputDecoration(
            hintText: 'Search for a car',
            hintStyle: TextStyle(color: CustomColors.kWhite54),
            prefixIcon: Icon(Icons.search, color: CustomColors.kWhite54),
            suffixIcon: suffix,
            filled: true,
            fillColor: CustomColors.kBlack,
            border: border ??
                const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide.none,
                ),
            // enabled: true,
            focusedBorder: border ??
                const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide.none,
                ),
          ),
    );
  }
}
