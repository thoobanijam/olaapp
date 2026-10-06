import 'package:flutter/material.dart';

class MakingDifference extends StatefulWidget {
  const MakingDifference({super.key});

  @override
  State<MakingDifference> createState() => _MakingDifferenceState();
}

class _MakingDifferenceState extends State<MakingDifference> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;

        final bool isMobile = width < 600;
        final bool isTablet = width >= 600 && width < 1000;

        final double titleSize = isMobile
            ? 25
            : isTablet
                ? 28
                : 30;

        final double descriptionSize = isMobile
            ? 14
            : 17;

        final double numberSize = isMobile
            ? 22
            : 25;

        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromARGB(
              235,
              244,
              245,
              243,
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 15 : 30,
            vertical: isMobile ? 25 : 35,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // ==================================================
              // TITLE
              // ==================================================

              Text(
                "Making a difference",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: titleSize,
                  shadows: [
                    Shadow(
                      color: const Color.fromARGB(
                        255,
                        47,
                        46,
                        46,
                      ).withOpacity(0.5),
                      blurRadius: 5,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: isMobile ? 15 : 20,
              ),

              // ==================================================
              // DESCRIPTION + STATISTICS
              // ==================================================

              if (isMobile)
                _buildMobileStatistics(
                  descriptionSize: descriptionSize,
                  numberSize: numberSize,
                )
              else
                _buildDesktopStatistics(
                  descriptionSize: descriptionSize,
                  numberSize: numberSize,
                ),

              SizedBox(
                height: isMobile ? 25 : 35,
              ),

              // ==================================================
              // IMAGES
              // ==================================================

              if (isMobile)
                _buildMobileImages()
              else
                _buildDesktopImages(
                  width: width,
                  isTablet: isTablet,
                ),

              // ==================================================
              // MORE ABOUT OLA FOUNDATION
              // ==================================================

              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: isMobile ? 20 : 25,
                  bottom: 10,
                ),
                alignment: Alignment.centerLeft,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        "More about ola Foundation",
                        style: TextStyle(
                          color: Color.fromARGB(
                            255,
                            7,
                            159,
                            9,
                          ),
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: Color.fromARGB(
                          255,
                          7,
                          159,
                          9,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ==============================================================
  // MOBILE STATISTICS
  // ==============================================================

  Widget _buildMobileStatistics({
    required double descriptionSize,
    required double numberSize,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // DESCRIPTION
        Text(
          "Ola Foundation, the social welfare arm of Ola, is an outcome of a belief based on real interactions, research, and extensive study on the far-reaching impact of enabling and equipping people.",
          style: TextStyle(
            color: const Color.fromARGB(
              255,
              107,
              105,
              105,
            ),
            fontWeight: FontWeight.w500,
            fontSize: descriptionSize,
            height: 1.4,
          ),
        ),

        const SizedBox(height: 20),

        // 1 LAKH
        _buildStatistic(
          number: "1 Lakh +",
          description:
              "Families impacted in FY 2020-21",
          numberSize: numberSize,
          descriptionSize: descriptionSize,
        ),

        const SizedBox(height: 20),

        // 93 LAKH
        _buildStatistic(
          number: "93 Lakh +",
          description:
              "Meals enabled across India in FY 2020-21",
          numberSize: numberSize,
          descriptionSize: descriptionSize,
        ),
      ],
    );
  }

  // ==============================================================
  // DESKTOP STATISTICS
  // ==============================================================

  Widget _buildDesktopStatistics({
    required double descriptionSize,
    required double numberSize,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // DESCRIPTION
        Expanded(
          flex: 2,
          child: Text(
            "Ola Foundation, the social welfare arm of Ola, is an outcome of a belief based on real interactions, research, and extensive study on the far-reaching impact of enabling and equipping people.",
            style: TextStyle(
              color: const Color.fromARGB(
                255,
                107,
                105,
                105,
              ),
              fontWeight: FontWeight.w500,
              fontSize: descriptionSize,
              height: 1.4,
            ),
          ),
        ),

        const SizedBox(width: 30),

        // 1 LAKH
        Expanded(
          child: _buildStatistic(
            number: "1 Lakh +",
            description:
                "Families impacted in FY 2020-21",
            numberSize: numberSize,
            descriptionSize: descriptionSize,
          ),
        ),

        const SizedBox(width: 30),

        // 93 LAKH
        Expanded(
          child: _buildStatistic(
            number: "93 Lakh +",
            description:
                "Meals enabled across India in FY 2020-21",
            numberSize: numberSize,
            descriptionSize: descriptionSize,
          ),
        ),
      ],
    );
  }

  // ==============================================================
  // STATISTIC ITEM
  // ==============================================================

  Widget _buildStatistic({
    required String number,
    required String description,
    required double numberSize,
    required double descriptionSize,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          number,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: numberSize,
          ),
        ),

        const SizedBox(height: 5),

        Text(
          description,
          style: TextStyle(
            color: const Color.fromARGB(
              255,
              107,
              105,
              105,
            ),
            fontWeight: FontWeight.w500,
            fontSize: descriptionSize,
            height: 1.3,
          ),
        ),
      ],
    );
  }

  // ==============================================================
  // MOBILE IMAGES
  // ==============================================================

  Widget _buildMobileImages() {
    return Column(
      children: [

        // WOMEN
        SizedBox(
          width: double.infinity,
          height: 220,
          child: Image.asset(
            'assets/img/womens.png',
            fit: BoxFit.contain,
          ),
        ),

        const SizedBox(height: 15),

        // DONATING
        SizedBox(
          width: double.infinity,
          height: 220,
          child: Image.asset(
            'assets/img/donating.png',
            fit: BoxFit.contain,
          ),
        ),

        const SizedBox(height: 15),

        // MOTHER + SON
        SizedBox(
          width: double.infinity,
          height: 300,
          child: Image.asset(
            'assets/img/mother-son.png',
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }

  // ==============================================================
  // TABLET + DESKTOP IMAGES
  // ==============================================================

  Widget _buildDesktopImages({
    required double width,
    required bool isTablet,
  }) {
    final double imageHeight = isTablet ? 220 : 280;
    final double rightImageHeight = isTablet ? 400 : 500;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // LEFT SIDE
        Expanded(
          child: Column(
            children: [

              SizedBox(
                height: imageHeight,
                child: Image.asset(
                  'assets/img/womens.png',
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                height: imageHeight,
                child: Image.asset(
                  'assets/img/donating.png',
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          width: isTablet ? 15 : 30,
        ),

        // RIGHT SIDE
        Expanded(
          child: SizedBox(
            height: rightImageHeight,
            child: Image.asset(
              'assets/img/mother-son.png',
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}