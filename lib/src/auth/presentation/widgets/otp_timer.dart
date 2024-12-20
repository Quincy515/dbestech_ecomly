import 'dart:async';

import 'package:dbestech_ecomly/core/extensions/text_extension.dart';
import 'package:dbestech_ecomly/core/res/styles/colours.dart';
import 'package:dbestech_ecomly/core/res/styles/text.dart';
import 'package:dbestech_ecomly/src/auth/presentation/app/adapter/auth_adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpTimer extends ConsumerStatefulWidget {
  const OtpTimer({super.key, required this.email, required this.familyKey});

  final String email;
  final GlobalKey familyKey;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OtpTimerState();
}

class _OtpTimerState extends ConsumerState<OtpTimer> {
  int _mainDuration = 60;

  // Timer duration in seconds
  int _duration = 60;
  int increment = 10;

  // Timer
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Start the timer
    _startTimer();

    ref.listenManual(authAdapterProvider(widget.familyKey), (previous, next) {
      if (next is OTPSent) {
        _startTimer();
        setState(() {
          canResend = false;
        });
      }
    });
  }

  bool canResend = false;

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    // Set the timer to expire after the duration
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _duration--;
      });
      if (_duration == 0) {
        // Increase the duration by 10 seconds after each request
        if (_mainDuration > 60) increment *= 2;

        _mainDuration += increment;
        _duration = _mainDuration;
        // Cancel the timer
        timer.cancel();

        setState(() {
          canResend = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the number of minutes and seconds
    final minutes = _duration ~/ 60;
    final seconds = _duration.remainder(60);

    final authState = ref.read(authAdapterProvider(widget.familyKey));

    return Center(
      child: switch (canResend) {
        true => switch (authState) {
            AuthLoading _ => const SizedBox.shrink(),
            _ => TextButton(
                onPressed: () {
                  ref
                      .read(authAdapterProvider(widget.familyKey).notifier)
                      .forgetPassword(
                        email: widget.email,
                      );
                },
                child: Text(
                  'Resend Code',
                  style: TextStyles.headingMedium4.primary,
                ),
              ),
          },
        _ => RichText(
            text: TextSpan(
              text: 'Resend code in ',
              style: TextStyles.headingMedium4.grey,
              children: [
                TextSpan(
                  text: '$minutes:${seconds.toString().padLeft(2, '0')}',
                  style: const TextStyle(
                    color: Colours.lightThemePrimaryColour,
                  ),
                ),
                const TextSpan(text: ' seconds'),
              ],
            ),
          ),
      },
    );
  }
}
