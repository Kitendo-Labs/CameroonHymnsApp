import 'dart:async';

import 'package:cameroon_hymn/src/home/view/widgets/coming_soon_audio.dart';
import 'package:cameroon_hymn/src/theme/app_theme.dart';
import 'package:cameroon_hymn/src/utils/app_color_extention.dart';
import 'package:cameroon_hymn/src/utils/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayButton extends ConsumerStatefulWidget {
  const PlayButton({
    super.key,
    required this.appColors,
  });

  final AppColorsExtension appColors;

  @override
  ConsumerState<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends ConsumerState<PlayButton> {
  Timer? _timer;
  int _start = 10;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          ref.watch(showPlayer.notifier).update((state) => true);
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColor = context.theme.appColors;
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 450),
      bottom: ref.watch(homeBottomSize) -
          (ref.watch(showPlayer) && _start <= 1
              ? (ref.watch(homeBottomSize) / 2) + 16
              : 0),
      right: 14,
      child: GestureDetector(
        onTap: () {
          // if (_start == 0) {
          //   setState(() {
          //     _start = 10;
          //   });
          // }
          // startTimer();
          showAudioComingSoon(appColor, context);
        },
        child: SizedBox(
          height: !ref.watch(showPlayer) ? 58 : 48,
          width: !ref.watch(showPlayer) ? 58 : 48,
          child: Stack(
            alignment: Alignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  // if (_start == 0) {
                  //   setState(() {
                  //     _start = 10;
                  //   });
                  // }
                  // startTimer();
                },
                shape: const CircleBorder(),
                backgroundColor: widget.appColors.accent,
                foregroundColor: widget.appColors.onAccent,
                elevation: ref.watch(showPlayer) ? 0 : null,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: !ref.watch(showPlayer) ? 4.0 : 0),
                  child: Icon(
                    !ref.watch(showPlayer)
                        ? CupertinoIcons.play_arrow
                        : CupertinoIcons.pause,
                    size: 34,
                  ),
                ),
              ),
              if (!ref.watch(showPlayer) && _start > 0)
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 54,
                    width: 54,
                    child: CircularProgressIndicator(
                      strokeWidth: 6,
                      value: (10 - _start) / 10,
                      color: widget.appColors.accentSecondary,
                      strokeCap: StrokeCap.round,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
