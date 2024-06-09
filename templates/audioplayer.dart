class AudioPlayerWidget extends StatefulWidget {
  const AudioPlayerWidget({
    super.key,
  });

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  var stream;

  @override
  void initState() {
    assetAudio();

    stream = audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });
    audioPlayer.onPlayerComplete.listen((event) {
      Get.to(const PremiumPage());
    });
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });
    audioPlayer.onPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
    super.initState();
  }

  Future<void> assetAudio() async {
    try {
      audioPlayer.setReleaseMode(ReleaseMode.stop);
      final player = AudioCache();
      final url = await player.load("audio/audio.mp3");
      final audioPath = url.path;
      audioPlayer.setSourceDeviceFile(audioPath);
    } catch (e) {
      print("Ошибка загрузки аудио: $e");
    }
  }

  @override
  void dispose() {
    audioPlayer.stop();
    stream.cancel();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SliderTheme(
          data: SliderThemeData(
            inactiveTrackColor: colorBorder,
            inactiveTickMarkColor: colorBorder,
            trackHeight: 2.5,
            thumbShape: CustomThumbShape(
              thumbRadius: 7.0,
              shadowSpreadRadius: 8.0,
              shadowColor: colorButton,
            ),
            /* const RoundSliderThumbShape(enabledThumbRadius: 6,), */
          ),
          child: Slider(
            activeColor: colorButton,
            thumbColor: colorButton,
            overlayColor: MaterialStatePropertyAll(colorButton.withOpacity(.2)),
            min: 0,
            max: duration.inSeconds.toDouble(),
            value: position.inSeconds.toDouble(),
            onChanged: (value) async {
              if (value == duration.inSeconds.toDouble()) {
                Get.to(const PremiumPage());
              }
              final position = Duration(seconds: value.toInt());
              await audioPlayer.seek(position);

              await audioPlayer.resume();
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: colorButton, width: 1),
              boxShadow: [
                BoxShadow(
                  blurRadius: 29,
                  color: colorButton,
                  spreadRadius: .0,
                )
              ]),
          child: CircleAvatar(
            radius: 29,
            backgroundColor: colorButton.withOpacity(.4),
            child: IconButton(
              splashColor: colorButton.withOpacity(0.3),
              color: colorWhite,
              onPressed: () async {
                isPlaying
                    ? await audioPlayer.pause()
                    : await audioPlayer.resume();
                if (isPlaying) {
                  Get.to(const PremiumPage());
                }
              },
              icon: isPlaying
                  ? SvgPicture.asset('assets/icons/bi_pause.svg')
                  : SvgPicture.asset('assets/icons/bi_play.svg'),
              iconSize: 30,
            ),
          ),
        )
      ],
    );
  }
}
