import 'package:flutter/material.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;

        final bool isMobile = width < 600;
        final bool isTablet = width >= 600 && width < 900;

        final double horizontalPadding = isMobile
            ? 15
            : isTablet
                ? 25
                : 30;

        final double titleSize = isMobile
            ? 24
            : isTablet
                ? 27
                : 30;

        final double mainTextSize = isMobile
            ? 19
            : isTablet
                ? 21
                : 23;

        final double insuranceTitleSize = isMobile ? 18 : 20;

        final double insuranceTextSize = isMobile
            ? 20
            : isTablet
                ? 22
                : 25;

        return Container(
          width: double.infinity,
          child: ClipPath(
            clipper: BendClipper(),
            child: Container(
              width: double.infinity,
              color: const Color.fromARGB(
                255,
                233,
                238,
                227,
              ),
              padding: EdgeInsets.only(
                left: horizontalPadding,
                right: horizontalPadding,
                top: 35,
                bottom: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // =================================================
                  // TITLE
                  // =================================================

                  Text(
                    "Experience the smarter way to pay",
                    style: TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.w600,
                      height: 1.15,
                      shadows: const [
                        Shadow(
                          color: Color.fromARGB(
                            255,
                            113,
                            110,
                            110,
                          ),
                          offset: Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // =================================================
                  // POSTPAID + BADGE
                  // =================================================

                  isMobile
                      ? Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Postpaid +",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 8),
                            _buildTrustedBadge(
                              width: width,
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            const Text(
                              "Postpaid +",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(width: 10),
                            _buildTrustedBadge(
                              width: width,
                            ),
                          ],
                        ),

                  const SizedBox(height: 15),

                  // =================================================
                  // DESCRIPTION
                  // =================================================

                  Text(
                    "Buy now, pay later for all spends once a month",
                    style: TextStyle(
                      fontSize: mainTextSize,
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // =================================================
                  // BUY NOW IMAGE
                  // =================================================

                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      horizontal: isMobile ? 0 : 10,
                    ),
                    child: AspectRatio(
                      aspectRatio: isMobile ? 1.4 : 2.3,
                      child: Image.asset(
                        'assets/img/buynow.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // =================================================
                  // THREE FEATURES
                  // =================================================

                  isMobile
                      ? _buildMobileFeatures()
                      : _buildDesktopFeatures(
                          width: width,
                        ),

                  // =================================================
                  // DIVIDER
                  // =================================================

                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      bottom: 30,
                    ),
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey,
                  ),

                  // =================================================
                  // INSURANCE
                  // =================================================

                  Text(
                    "Insurance",
                    style: TextStyle(
                      fontSize: insuranceTitleSize,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    "Effective insurance for all your risks",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: insuranceTextSize,
                      height: 1.2,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // =================================================
                  // INSURANCE IMAGES
                  // =================================================

                  _buildInsuranceImages(
                    width: width,
                    isMobile: isMobile,
                  ),

                  // =================================================
                  // EXPLORE MORE
                  // =================================================

                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                      top: 25,
                    ),
                    child: const Text(
                      "Explore more on the Ola app",
                      style: TextStyle(
                        color: Color.fromARGB(
                          255,
                          64,
                          138,
                          66,
                        ),
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // ===============================================================
  // TRUSTED BADGE
  // ===============================================================

  Widget _buildTrustedBadge({
    required double width,
  }) {
    final bool isSmall = width < 400;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 8 : 12,
        vertical: 6,
      ),
      decoration: const BoxDecoration(
        color: Color.fromARGB(
          255,
          195,
          221,
          196,
        ),
      ),
      child: Text(
        "Trusted by 40 lakh+ users",
        style: TextStyle(
          color: const Color.fromARGB(
            255,
            71,
            161,
            74,
          ),
          fontWeight: FontWeight.bold,
          fontSize: isSmall ? 12 : 14,
        ),
      ),
    );
  }

  // ===============================================================
  // MOBILE FEATURES
  // ===============================================================

  Widget _buildMobileFeatures() {
    return Column(
      children: [
        _buildFeatureItem(
          image: 'assets/img/1.png',
          text: "Buy now, pay after 30 days",
        ),

        const SizedBox(height: 20),

        _buildFeatureItem(
          image: 'assets/img/2.png',
          text: "Shop across 20,000 apps",
        ),

        const SizedBox(height: 20),

        _buildFeatureItem(
          image: 'assets/img/3.png',
          text: "Credit limit upto ₹100,000",
        ),
      ],
    );
  }

  // ===============================================================
  // DESKTOP FEATURES
  // ===============================================================

  Widget _buildDesktopFeatures({
    required double width,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _buildFeatureItem(
            image: 'assets/img/1.png',
            text: "Buy now, pay after 30 days",
          ),
        ),

        const SizedBox(width: 15),

        Expanded(
          child: _buildFeatureItem(
            image: 'assets/img/2.png',
            text: "Shop across 20,000 apps",
          ),
        ),

        const SizedBox(width: 15),

        Expanded(
          child: _buildFeatureItem(
            image: 'assets/img/3.png',
            text: "Credit limit upto ₹100,000",
          ),
        ),
      ],
    );
  }

  // ===============================================================
  // FEATURE ITEM
  // ===============================================================

  Widget _buildFeatureItem({
    required String image,
    required String text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          image,
          width: 55,
          height: 55,
          fit: BoxFit.contain,
        ),

        const SizedBox(height: 8),

        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            height: 1.3,
          ),
        ),
      ],
    );
  }

  // ===============================================================
  // INSURANCE IMAGES
  // ===============================================================

  Widget _buildInsuranceImages({
    required double width,
    required bool isMobile,
  }) {
    if (isMobile) {
      return Column(
        children: [
          Image.asset(
            'assets/img/ride.png',
            width: double.infinity,
            height: 150,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 10),

          Image.asset(
            'assets/img/insurance.png',
            width: double.infinity,
            height: 150,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 10),

          Image.asset(
            'assets/img/daily.png',
            width: double.infinity,
            height: 150,
            fit: BoxFit.contain,
          ),
        ],
      );
    }

    return Row(
      children: [
        Expanded(
          child: Image.asset(
            'assets/img/ride.png',
            height: width < 900 ? 150 : 180,
            fit: BoxFit.contain,
          ),
        ),

        Expanded(
          child: Image.asset(
            'assets/img/insurance.png',
            height: width < 900 ? 150 : 180,
            fit: BoxFit.contain,
          ),
        ),

        Expanded(
          child: Image.asset(
            'assets/img/daily.png',
            height: width < 900 ? 150 : 180,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}

// ===============================================================
// BEND CLIPPER
// ===============================================================

class BendClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // TOP LEFT
    path.moveTo(0, 40);

    // TOP SLANTED
    path.lineTo(40, 0);

    // TOP RIGHT
    path.lineTo(size.width, 0);

    // RIGHT SIDE
    path.lineTo(
      size.width,
      size.height - 40,
    );

    // BOTTOM SLANTED
    path.lineTo(
      size.width - 40,
      size.height,
    );

    // BOTTOM LEFT
    path.lineTo(0, size.height);

    // CLOSE
    path.close();

    return path;
  }

  @override
  bool shouldReclip(
    CustomClipper<Path> oldClipper,
  ) {
    return false;
  }
}