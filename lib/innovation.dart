import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Innovation extends StatefulWidget {
  const Innovation({super.key});

  @override
  State<Innovation> createState() => _InnovationState();
}

class _InnovationState extends State<Innovation> {
  late VideoPlayerController controller1;
  late VideoPlayerController controller2;

  int currentVideo = 1;

  @override
  void initState() {
    super.initState();

    controller1 = VideoPlayerController.asset(
      'assets/videos/innovation1.mp4',
    );

    controller2 = VideoPlayerController.asset(
      'assets/videos/makinginnocation.mp4',
    );

    _initializeVideos();
  }

  Future<void> _initializeVideos() async {
    try {
      await controller1.initialize();
      await controller2.initialize();

      if (!mounted) return;

      setState(() {});

      controller1.play();

      controller1.addListener(_controller1Listener);
      controller2.addListener(_controller2Listener);
    } catch (error) {
      debugPrint("Video error: $error");
    }
  }

  void _controller1Listener() {
    if (!controller1.value.isInitialized) return;

    if (controller1.value.position >= controller1.value.duration &&
        controller1.value.duration != Duration.zero) {
      controller2.seekTo(Duration.zero);
      controller2.play();

      if (mounted) {
        setState(() {
          currentVideo = 2;
        });
      }
    }
  }

  void _controller2Listener() {
    if (!controller2.value.isInitialized) return;

    if (controller2.value.position >= controller2.value.duration &&
        controller2.value.duration != Duration.zero) {
      controller1.seekTo(Duration.zero);
      controller1.play();

      if (mounted) {
        setState(() {
          currentVideo = 1;
        });
      }
    }
  }

  @override
  void dispose() {
    controller1.removeListener(_controller1Listener);
    controller2.removeListener(_controller2Listener);

    controller1.dispose();
    controller2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;

        // Responsive breakpoints
        final bool isMobile = width < 600;
        final bool isTablet = width >= 600 && width < 900;

        final double videoWidth;
        final double videoHeight;

        if (isMobile) {
          videoWidth = width - 30;
          videoHeight = 300;
        } else if (isTablet) {
          videoWidth = width * 0.42;
          videoHeight = 350;
        } else {
          videoWidth = 350;
          videoHeight = 380;
        }

        final double titleSize = isMobile
            ? 24
            : isTablet
                ? 27
                : 30;

        return Container(
          width: double.infinity,
          margin: EdgeInsets.all(
            isMobile ? 10 : 20,
          ),
          child: isMobile
              ? _buildMobileLayout(
                  width: width,
                  videoWidth: videoWidth,
                  videoHeight: videoHeight,
                  titleSize: titleSize,
                )
              : _buildDesktopLayout(
                  width: width,
                  videoWidth: videoWidth,
                  videoHeight: videoHeight,
                  titleSize: titleSize,
                ),
        );
      },
    );
  }

  // ============================================================
  // MOBILE
  // ============================================================

  Widget _buildMobileLayout({
    required double width,
    required double videoWidth,
    required double videoHeight,
    required double titleSize,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // VIDEO
        _buildVideo(
          width: videoWidth,
          height: videoHeight,
        ),

        const SizedBox(height: 25),

        // TITLE
        _buildTitle(
          titleSize: titleSize,
        ),

        const SizedBox(height: 20),

        // RIDER
        _buildInnovationItem(
          controller: controller1,
          title: "For Riders",
          description:
              "We constantly experiment to come up with industry-first features for our riders that eventually become a norm.",
          isMobile: true,
        ),

        const SizedBox(height: 25),

        // DRIVER
        _buildInnovationItem(
          controller: controller2,
          title: "For Drivers",
          description:
              "Our drivers get real time stats to help optimize their rides better and earn more, straight from the app.",
          isMobile: true,
        ),
      ],
    );
  }

  // ============================================================
  // TABLET + DESKTOP
  // ============================================================

  Widget _buildDesktopLayout({
    required double width,
    required double videoWidth,
    required double videoHeight,
    required double titleSize,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // VIDEO
        _buildVideo(
          width: videoWidth,
          height: videoHeight,
        ),

        SizedBox(
          width: width < 900 ? 20 : 30,
        ),

        // RIGHT SIDE
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(
                titleSize: titleSize,
              ),

              const SizedBox(height: 20),

              _buildInnovationItem(
                controller: controller1,
                title: "For Riders",
                description:
                    "We constantly experiment to come up with industry-first features for our riders that eventually become a norm.",
                isMobile: false,
              ),

              const SizedBox(height: 25),

              _buildInnovationItem(
                controller: controller2,
                title: "For Drivers",
                description:
                    "Our drivers get real time stats to help optimize their rides better and earn more, straight from the app.",
                isMobile: false,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // VIDEO
  // ============================================================

  Widget _buildVideo({
    required double width,
    required double height,
  }) {
    if (!controller1.value.isInitialized ||
        !controller2.value.isInitialized) {
      return SizedBox(
        width: width,
        height: height,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: width,
        height: height,
        child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: currentVideo == 1
                ? controller1.value.size.width
                : controller2.value.size.width,
            height: currentVideo == 1
                ? controller1.value.size.height
                : controller2.value.size.height,
            child: VideoPlayer(
              currentVideo == 1
                  ? controller1
                  : controller2,
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // TITLE
  // ============================================================

  Widget _buildTitle({
    required double titleSize,
  }) {
    return Text(
      "Making innovations since 2011",
      style: TextStyle(
        fontSize: titleSize,
        fontWeight: FontWeight.w600,
        letterSpacing: -1.5,
        height: 1.1,
        shadows: const [
          Shadow(
            offset: Offset(2, 3),
            blurRadius: 5,
            color: Color.fromARGB(
              255,
              125,
              114,
              114,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // RIDER / DRIVER ITEM
  // ============================================================

  Widget _buildInnovationItem({
    required VideoPlayerController controller,
    required String title,
    required String description,
    required bool isMobile,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // PROGRESS BAR
        Container(
          margin: EdgeInsets.only(
            top: isMobile ? 5 : 10,
          ),
          child: SizedBox(
            width: isMobile ? 8 : 10,
            height: isMobile ? 80 : 100,
            child: RotatedBox(
              quarterTurns: 1,
              child: VideoProgressIndicator(
                controller,
                allowScrubbing: true,
                colors: const VideoProgressColors(
                  playedColor: Colors.green,
                  bufferedColor: Colors.grey,
                  backgroundColor: Colors.grey,
                ),
              ),
            ),
          ),
        ),

        SizedBox(
          width: isMobile ? 12 : 20,
        ),

        // TEXT
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: isMobile ? 17 : 18,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                description,
                style: TextStyle(
                  fontSize: isMobile ? 13 : 14,
                  height: 1.4,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}