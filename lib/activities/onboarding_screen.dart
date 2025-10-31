import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _index = 0; // Текущая страница.

  void _next() {
    if (_index < 2) {
      setState(() => _index += 1);
    } else {
      _finish();
    }
  }

  void _skip() {
    _finish();
  }

  void _finish() {
    Navigator.of(context).pushReplacementNamed('/onboardingScreen');
  }

  Widget _buildPage(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Иллюстрация.
            SvgPicture.asset('assets/illustrations/firstIllustration.svg'),

            // Отступ между иллюстрацией и точками.
            SizedBox(height: 115),

            // Индикатор страниц.
            _dots(),

            // Отступ между точками и блоком текста.
            SizedBox(height: 40),

            SizedBox(
              width: 263,
              child: Column(
                children: [
                  Text('Confidence in your words',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(8, 14, 30, 100),
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.1
                      )
                  ),
                  SizedBox(height: 8),
                  Text(
                      'With conversation-based learning, you’ll be talking from lesson one.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(8, 14, 30, 89).withValues(alpha: 0.6),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.1,
                      )
                  ),
                ],
              )
            )
          ],
        );
      case 1:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.laptop, size: 120, color: Colors.orange),
            SizedBox(height: 20),
            Text('Take your time to learn',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            SizedBox(height: 12),
            Text(
              'Develop a habit of learning and make it a part of your daily routine.',
              textAlign: TextAlign.center,
            ),
          ],
        );
      default:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.school, size: 120, color: Colors.teal),
            SizedBox(height: 20),
            Text('The lessons you need to learn',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            SizedBox(height: 12),
            Text(
              'Using a variety of learning styles to learn and retain.',
              textAlign: TextAlign.center,
            ),
          ],
        );
    }
  }

  Widget _dots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (i) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: _index == i ? Color.fromRGBO(247, 100, 0, 100) : Color.fromRGBO(8, 14, 30, 100).withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: _buildPage(_index),
                ),
              ),
            ),

            Column(
              children: [
                SizedBox(
                  width: 327,
                  height: 56,
                  child: FilledButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(91, 123, 254, 100),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                    ),
                    onPressed: _next,
                    child: Text(_index == 2 ? 'Get started' : 'Next'),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: _skip,
                  child:
                  const Text('Skip onboarding', style: TextStyle(color: Colors.black54)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}