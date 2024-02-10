import '../../Export/export.dart';

class CarCategory extends StatelessWidget {
  const CarCategory({
    super.key,
    required this.icon,
    required this.label,
    required this.iconColor,
  });
  final String icon;
  final Color iconColor;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
        color: const Color(0xff252420),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade800,
            blurRadius: 0,
            spreadRadius: 0,
            offset: const Offset(-2, -3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(
                icon,
                height: 30,
                color: iconColor,
                fit: BoxFit.fill,
              ),
            ),
            const CustomSizedBox(heightRatio: 0.010),
            Expanded(
              child: AutoSizeText(
                label,
                presetFontSizes: const [13, 10, 8, 5],
                style: GoogleFonts.inter(
                  color: CustomColors.kWhite,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
