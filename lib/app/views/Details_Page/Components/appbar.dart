import '../../../../Export/export.dart';

class DetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailAppBar({
    super.key,
    required this.mqWidth,
    required this.mqHeight,
  });
  final double mqWidth;
  final double mqHeight;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColors.kGreyColor,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(mqWidth, mqHeight * 0.07);
}
