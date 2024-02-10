import '../../../Export/export.dart';
import '../../components/Widget/custom_alert_dialog.dart';
import '../../dummy_data/feature_data.dart';
import 'Components/appbar.dart';
import 'Components/radio_button_select_colors.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.car});
  final CarModel car;
  @override
  Widget build(BuildContext context) {
    var mqHeight = MediaQuery.sizeOf(context).height;
    var mqWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: CustomColors.kGreyColor,
      // ! AppBar Sections.
      appBar: DetailAppBar(mqHeight: mqHeight, mqWidth: mqWidth),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ! Image Section With Access this Hero Tags.
                  car.id == 1 ? _carSlideInRightSide() : _carSlideInLeftSide(),
                  Center(
                    child: AutoSizeText(
                      car.name,
                      presetFontSizes: const [30, 25, 20, 15],
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const CustomSizedBox(heightRatio: 0.02),
                  // ! Radio Button Select Car Color
                  const RadioButtonSelectCarColor(),
                  const CustomSizedBox(heightRatio: 0.02),
                  // ! _Car Over View And More Feature
                  _carOverViewAndMoreFeature(mqHeight, mqWidth),
                  const CustomSizedBox(heightRatio: 0.02),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: mqHeight * 0.15,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: CustomColors.kDarkGrey,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors.kGreyShade800,
                            blurRadius: 0,
                            spreadRadius: 0,
                            offset: const Offset(-1, -2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 0,
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: AutoSizeText('Owner',
                                        presetFontSizes: const [16, 12, 8, 5],
                                        style: GoogleFonts.inter(
                                          color: CustomColors.kWhite54,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ),
                                const CustomSizedBox(heightRatio: 0.017),
                                Expanded(
                                  flex: 0,
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: AutoSizeText('Jawad Jani',
                                        presetFontSizes: const [20, 15, 10, 5],
                                        style: GoogleFonts.inter(
                                          color: CustomColors.kWhite,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Expanded(
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: CustomColors.kBlack,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.call,
                                    color: CustomColors.kGreen,
                                  ),
                                ),
                              ),
                            ),
                            const CustomSizedBox(heightRatio: 0.02),
                            Expanded(
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: CustomColors.kBlack,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.message,
                                    color: CustomColors.kYellow,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                '${String.fromCharCodes(Runes('\u0024'))}220/day',
                presetFontSizes: const [30, 25, 20, 15],
                style: GoogleFonts.inter(
                  color: CustomColors.kWhite,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      // ** Call This Alert Dialog
                      return const CustomAlertDialog();
                    },
                  );
                },
                child: Container(
                  height: mqHeight * 0.065,
                  width: mqWidth * 0.35,
                  decoration: BoxDecoration(
                    color: CustomColors.kTeal,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: AutoSizeText(
                        'Rent this car',
                        presetFontSizes: const [18, 15, 12, 8],
                        style: GoogleFonts.inter(
                          color: CustomColors.kBlack,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // _Car Over View And More Feature
  Padding _carOverViewAndMoreFeature(double mqHeight, double mqWidth) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: mqHeight * 0.68,
        width: mqWidth,
        decoration: BoxDecoration(
          color: CustomColors.kDarkGrey,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: CustomColors.kWhite12, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 0,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: AutoSizeText('overview'.toUpperCase(),
                      presetFontSizes: const [16, 12, 8, 5],
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              const CustomSizedBox(heightRatio: 0.02),
              Expanded(
                flex: 3,
                child: Text(
                  car.description,
                  style: GoogleFonts.inter(
                    color: Colors.white54,
                    fontSize: 14,
                  ),
                ),
              ),
              const CustomSizedBox(heightRatio: 0.02),
              Expanded(
                flex: 0,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('FEATURES',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              Expanded(
                flex: 1,
                child: GridView.builder(
                  itemCount: features.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 0,
                    childAspectRatio: 1.9,
                  ),
                  itemBuilder: (context, index) {
                    return FeatureRow(
                      icon: features[index].icon,
                      iconColor: features[index].iconColor,
                      label: features[index].title,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // _Car Slide In Left Side
  SlideInLeft _carSlideInLeftSide() {
    return SlideInLeft(
      duration: const Duration(milliseconds: 800),
      child: Hero(
        tag: car.id,
        child: Image(
          image: AssetImage(car.id == 1 ? ImagePath.detailImg : car.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  //  _Car Slide In Right Side
  SlideInRight _carSlideInRightSide() {
    return SlideInRight(
      duration: const Duration(milliseconds: 800),
      child: Hero(
        tag: car.id,
        child: Image(
          image: AssetImage(car.id == 1 ? ImagePath.detailImg : car.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
