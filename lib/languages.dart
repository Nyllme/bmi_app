import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'mn_MN': {
          'Weight in Kg': 'Килограм жин',
          'Height in Meter': 'Метр өндөр',
          'Calculate': 'Тооцоолох',
          'Demo': 'Translated Demo',
          "Underweight = <18.5 \n": "Жин багатай = <18.5 \n",
          "Normal weight = 18.5-24.9 \n": "Хэвийн = 18.5-24.9 \n",
          "Overweight = 25-29.9\n": "Илүүдэл жинтэй = 25-29.9\n",
          "Obesity = BMI of 30 or greater":
              "Таргалалттай = 30 эсвэл түүнээс илүү",
          "Language mode:  ": "Хэлний горим:  ",
        },
        'en_US': {
          'Weight in Kg': 'Weight in kg',
          'Height in Meter': 'Height in Meter',
          'Calculate': 'Calculate',
          'Demo': 'Translated Demo',
          "Underweight = <18.5 \n": "Underweight = <18.5 \n",
          "Normal weight = 18.5-24.9 \n": "Normal weight = 18.5-24.9 \n",
          "Overweight = 25-29.9\n": "Overweight = 25-29.9\n",
          "Obesity = BMI of 30 or greater": "Obesity = BMI of 30 or greater",
          "Language mode:  ": "Language mode:  ",
        },
      };
}
