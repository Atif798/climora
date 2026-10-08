import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/theme/app_theme.dart';
import 'weather_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;

  final List<OnboardingData> _pages = const [
    OnboardingData(
      icon: Icons.search_rounded,
      title: 'Search Any City',
      description:
      'Get instant weather updates for any city in the world. Just type and go.',
      accentColor: AppTheme.onboardingSlide1Accent,
      gradientColors: [
        AppTheme.onboardingSlide1Start,
        AppTheme.onboardingSlide1End,
      ],
    ),
    OnboardingData(
      icon: Icons.wb_sunny_rounded,
      title: 'Live Weather Data',
      description:
      'Real-time temperature, humidity, wind speed, and 5-day forecasts at your fingertips.',
      accentColor: AppTheme.onboardingSlide2Accent,
      gradientColors: [
        AppTheme.onboardingSlide2Start,
        AppTheme.onboardingSlide2End,
      ],
    ),
    OnboardingData(
      icon: Icons.favorite_rounded,
      title: 'Made For You',
      description:
      'Save your favorite cities, switch units anytime, and enjoy a beautiful weather experience.',
      accentColor: AppTheme.onboardingSlide3Accent,
      gradientColors: [
        AppTheme.onboardingSlide3Start,
        AppTheme.onboardingSlide3End,
      ],
    ),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  // NEXT / SKIP / GET STARTED

  void nextPage() {
    if (currentPage < _pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      finishOnboarding();
    }
  }

  Future<void> finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_complete', true);

    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const WeatherScreen(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentData = _pages[currentPage];
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: currentData.gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // TOP BAR
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Brand
                    Row(
                      children: [
                        Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: AppTheme.onPrimaryColor.withValues(alpha: 0.20),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppTheme.onPrimaryColor.withValues(alpha: 0.30),
                            ),
                          ),
                          child: const Icon(
                            Icons.cloud_rounded,
                            color: AppTheme.onPrimaryColor,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Climora',
                          style: textTheme.titleMedium?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.onPrimaryColor,
                          ),
                        ),
                      ],
                    ),

                    // Skip button
                    if (currentPage < _pages.length - 1)
                      TextButton(
                        onPressed: finishOnboarding,
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor:
                          AppTheme.onPrimaryColor.withValues(alpha: 0.18),
                        ),
                        child: Text(
                          'Skip',
                          style: textTheme.labelLarge?.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.onPrimaryColor,
                          ),
                        ),
                      )
                    else
                      const SizedBox(width: 60),
                  ],
                ),
              ),

              // PAGE VIEW
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: _pages.length,
                  onPageChanged: (index) {
                    setState(() => currentPage = index);
                  },
                  itemBuilder: (context, index) {
                    return OnboardingPage(data: _pages[index]);
                  },
                ),
              ),

              // BOTTOM — Dots + Button
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
                child: Column(
                  children: [
                    // Dots
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _pages.length,
                            (index) => buildDot(index),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Next / Get Started button
                    GestureDetector(
                      onTap: nextPage,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 56,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppTheme.onPrimaryColor,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.15),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                currentPage == _pages.length - 1
                                    ? 'Get Started'
                                    : 'Next',
                                style: textTheme.labelLarge?.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: currentData.accentColor,
                                  letterSpacing: 0.3,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                currentPage == _pages.length - 1
                                    ? Icons.check_rounded
                                    : Icons.arrow_forward_rounded,
                                color: currentData.accentColor,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // DOT INDICATOR

  Widget buildDot(int index) {
    final isActive = index == currentPage;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 28 : 8,
      decoration: BoxDecoration(
        color: isActive
            ? AppTheme.onPrimaryColor
            : AppTheme.onPrimaryColor.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

// ONBOARDING PAGE — Single slide

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;

  const OnboardingPage({required this.data});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 220,
            width: 220,
            decoration: BoxDecoration(
              color: AppTheme.onPrimaryColor.withValues(alpha: 0.18),
              shape: BoxShape.circle,
              border: Border.all(
                color: AppTheme.onPrimaryColor.withValues(alpha: 0.30),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.10),
                  blurRadius: 40,
                  offset: const Offset(0, 20),
                ),
              ],
            ),
            child: Center(
              child: Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  color: AppTheme.onPrimaryColor.withValues(alpha: 0.25),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppTheme.onPrimaryColor.withValues(alpha: 0.40),
                    width: 2,
                  ),
                ),
                child: Icon(
                  data.icon,
                  size: 68,
                  color: AppTheme.onPrimaryColor,
                ),
              ),
            ),
          ),

          const SizedBox(height: 56),

          // Title
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: textTheme.displayMedium?.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: AppTheme.onPrimaryColor,
              letterSpacing: -0.5,
              height: 1.15,
            ),
          ),

          const SizedBox(height: 16),

          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              data.description,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppTheme.onPrimaryColor.withValues(alpha: 0.85),
                height: 1.55,
                letterSpacing: 0.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ONBOARDING DATA MODEL

class OnboardingData {
  final IconData icon;
  final String title;
  final String description;
  final Color accentColor;
  final List<Color> gradientColors;

  const OnboardingData({
    required this.icon,
    required this.title,
    required this.description,
    required this.accentColor,
    required this.gradientColors,
  });
}