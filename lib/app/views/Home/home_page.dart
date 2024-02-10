import '../../../Export/export.dart';
import 'Components/app_bar.dart';
import 'Components/custom_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  /// Current Index .
  int _selectedIndex = 0;

  /// TabController
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  Widget _tabItem(Widget child, String label, {bool isSelected = false}) {
    return AnimatedContainer(
        margin: const EdgeInsets.all(8),
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 500),
        decoration: !isSelected
            ? null
            : BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black,
              ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            child,
            AutoSizeText(label,
                presetFontSizes: const [8, 5, 4],
                style: const TextStyle(fontSize: 8)),
          ],
        ));
  }

  // Define BottomBar _labels
  final List<String> _labels = ['Home', 'maps', 'camera'];
  //  Define Icons .
  List<Widget> icons = const [
    Icon(Icons.home_outlined),
    Icon(Icons.explore_outlined),
    Icon(Icons.camera_alt_outlined)
  ];

  void currentHandleIndex(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mqHeight = MediaQuery.sizeOf(context).height;
    var mqWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
        backgroundColor: CustomColors.kGreyColor,
        // ! App Bar Section
        appBar: HomePageAppBar(
          mqHeight: mqHeight,
          mqWidth: mqWidth,
        ),
        // ! bottomNavigationBar
        bottomNavigationBar: Container(
          height: mqHeight * 0.13,
          padding: const EdgeInsets.all(12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60.0),
            child: Container(
              color: Colors.teal.withOpacity(0.2),
              child: TabBar(
                  onTap: currentHandleIndex,
                  labelColor: CustomColors.kWhite,
                  unselectedLabelColor: CustomColors.kBlueGrey,
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide.none,
                  ),
                  tabs: [
                    for (int i = 0; i < icons.length; i++)
                      _tabItem(
                        icons[i],
                        _labels[i],
                        isSelected: i == _selectedIndex,
                      ),
                  ],
                  controller: _tabController),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomSizedBox(heightRatio: 0.01),
          // ! Search Text Field .
          customTextFieldSections(mqHeight, mqWidth),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            // ! Car Different Category
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CarCategory(
                  icon: ImagePath.car,
                  iconColor: Colors.orange,
                  label: 'Buy car',
                ),
                CarCategory(
                  icon: ImagePath.carRental,
                  iconColor: Colors.blueAccent,
                  label: 'Rent car',
                ),
                CarCategory(
                  icon: ImagePath.carSell,
                  iconColor: Colors.greenAccent,
                  label: 'Sell car',
                ),
              ],
            ),
          ),
          const CustomSizedBox(heightRatio: 0.02),
          // ! brandSearchAndViewAll
          brandSearchAndViewAll(mqHeight, context),
          const CustomSizedBox(heightRatio: 0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: mqHeight * 0.8,
              width: mqWidth,
              decoration: BoxDecoration(
                color: CustomColors.kGreyColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.kGreyShade800,
                    blurRadius: 0,
                    spreadRadius: 0,
                    offset: const Offset(-2, -3),
                  ),
                ],
                border: Border.all(color: CustomColors.kGreyShade800, width: 1),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Row(
                      children: [
                        AutoSizeText(
                          'Most popular cars',
                          presetFontSizes: const [18, 12, 5, 22],
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        AutoSizeText(
                          'View all',
                          presetFontSizes: const [15, 12, 5, 20],
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CustomSizedBox(heightRatio: 0.02),
                  GridView.builder(
                    itemCount: carList.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final car = carList[index];
                      return CarCard(car: car);
                    },
                  ),
                ],
              ),
            ),
          ),
          const CustomSizedBox(heightRatio: 0.02),
        ])));
  }

  //  Brand Search And View All
  Padding brandSearchAndViewAll(double mqHeight, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: mqHeight * 0.2,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: CustomColors.kGreyColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: CustomColors.kGreyShade800,
              blurRadius: 0,
              spreadRadius: 0,
              offset: const Offset(-2, -3),
            ),
          ],
          border: Border.all(color: CustomColors.kGreyShade800, width: 1),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Row(
                children: [
                  AutoSizeText(
                    'Search by brand',
                    presetFontSizes: const [18, 14, 9, 20],
                    style: GoogleFonts.inter(
                      color: CustomColors.kWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  AutoSizeText(
                    'View all',
                    presetFontSizes: const [15, 10, 5, 20],
                    style: GoogleFonts.inter(
                      color: CustomColors.kWhite,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const CustomSizedBox(heightRatio: 0.02),
            SizedBox(
              height: mqHeight * 0.1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        height: 70,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/logos/brand${index + 1}.png',
                            height: 45,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Search Text Field .
  Row customTextFieldSections(double mqHeight, double mqWidth) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomSizedBox(
            heightRatio: 0.07,
            widthRatio: 0.7,

            /// ! Search TextField .
            child: Expanded(
              child: CustomTextField(
                controller: searchController,
                suffix: IconButton(
                  color: CustomColors.kWhite,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: mqHeight * 0.07,
            width: mqWidth * 0.16,
            decoration: BoxDecoration(
              color: CustomColors.kTeal,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Image.asset(
                ImagePath.filter1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
