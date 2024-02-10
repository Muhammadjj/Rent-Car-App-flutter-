import '../../../../Export/export.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({
    super.key,
    required this.mqHeight,
    required this.mqWidth,
  });
  final double mqHeight;
  final double mqWidth;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff282723),
      title: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              Text(
                'Tushar',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white38, width: 1),
          ),
          child: const Center(
            child: Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 10)
      ],
    );
  }

  @override
  Size get preferredSize => Size(mqWidth, mqHeight * 0.07);
}
