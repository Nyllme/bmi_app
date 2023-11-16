import 'package:bmi_app/languages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Body mass index app',
      translations: Languages(),
      locale: Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // builder: (context, child) {
      //   return MediaQuery(
      //     data: MediaQuery.of(context).copyWith(textScaler: 1.0),
      //     child: child!,
      //   );
      // },
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Colors.orange, borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                TextButton(
                    onPressed: () => Get.updateLocale(const Locale('mn', 'MN')),
                    child: Text("🇲🇳")),
                TextButton(
                    onPressed: () => Get.updateLocale(const Locale('en', 'US')),
                    child: Text("🇺🇸"))
              ],
            ),
            TextFormField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Weight in Kg".tr),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Height in meter"),
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
                onPressed: () {
                  try {
                    if (weightController.text == "" ||
                        heightController.text == "") {
                      print("input empty error");
                    } else {
                      double height = double.parse(heightController.text);
                      double heightSquared = height * height;
                      double weight = double.parse(weightController.text);
                      double result = weight / heightSquared;
                      _dialogBuilder(context, result.toStringAsFixed(1));
                    }
                  } catch (e) {
                    Get.snackbar("Error happened", "Please check input");
                  }
                  // _dialogBuilder(context);
                },
                child: Text("Calculate".tr)),
            SizedBox(
              height: 20,
            ),
            Text("Underweight = <18.5 \n".tr +
                "Normal weight = 18.5-24.9 \n".tr +
                "Overweight = 25-29.9\n".tr +
                "Obesity = BMI of 30 or greater".tr),
          ],
        ),
      ),
    ));
  }
}

Future<void> _dialogBuilder(BuildContext context, String bmi) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Basic dialog title'),
        content: Text(
          "Your BMI is $bmi}",
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Got it'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
