import 'package:flutter/services.dart';
import 'Export/export.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // set this PreferredOrientations .
  Future.wait([
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp])
  ]).then((value) {
    runApp(const RentCar());
  });
}

class RentCar extends StatelessWidget {
  const RentCar({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rent A Car',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
