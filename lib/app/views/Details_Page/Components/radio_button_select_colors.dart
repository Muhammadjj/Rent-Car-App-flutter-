import '../../../../Export/export.dart';

class RadioButtonSelectCarColor extends StatelessWidget {
  const RadioButtonSelectCarColor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: CustomColors.kBlack,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: CustomColors.kWhite,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        const CustomSizedBox(widthRatio: 0.023),
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: CustomColors.kWhite,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: CustomColors.kRed,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        const CustomSizedBox(widthRatio: 0.023),
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: CustomColors.kBlack,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: CustomColors.kBlue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        const CustomSizedBox(widthRatio: 0.023),
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: CustomColors.kBlack,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: CustomColors.kGreen,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
