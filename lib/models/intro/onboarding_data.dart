import 'package:app_base_flutter/configs/global_images.dart';

class OnBoarding {
  String title;
  String subtitle;
  String image;

  OnBoarding({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
    title: 'Discover Experienced Doctor',
    subtitle:
        'With the help of our intelligent algorithms, now locate the best doctors around your vicinity at total ease.',
    image: GlobalImages.intro1,
  ),
  OnBoarding(
    title: 'Effortless Appointment Booking',
    subtitle:
        'Find experienced specialist doctors woth expert ratings and review and book your appointments hassle-free.',
    image: GlobalImages.intro2,
  ),
  OnBoarding(
      title: 'Learn About Your Doctor',
      subtitle:
          'Find best and experienced nurses and caretakers with expert rating and review.',
      image: GlobalImages.intro3),
];
