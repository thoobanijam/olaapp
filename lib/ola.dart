import 'package:flutter/material.dart';

class Ola extends StatefulWidget {
  const Ola({super.key});

  @override
  State<Ola> createState() => _OlaState();
}

class _OlaState extends State<Ola> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;

        final bool isMobile = width < 600;
        final bool isTablet = width >= 600 && width < 1000;

        final double headingSize = isMobile
            ? 25
            : isTablet
                ? 30
                : 37;

        final double collaborationSize = isMobile
            ? 17
            : isTablet
                ? 19
                : 22;

        final double benefitSize = isMobile
            ? 18
            : isTablet
                ? 20
                : 23;

        final double exploreSize = isMobile
            ? 17
            : isTablet
                ? 19
                : 22;

        return Container(
          width: double.infinity,
          margin: EdgeInsets.all(
            isMobile ? 15 : 40,
          ),
          child: isMobile
              ? _buildMobileLayout(
                  headingSize: headingSize,
                  collaborationSize: collaborationSize,
                  benefitSize: benefitSize,
                  exploreSize: exploreSize,
                )
              : _buildDesktopLayout(
                  headingSize: headingSize,
                  collaborationSize: collaborationSize,
                  benefitSize: benefitSize,
                  exploreSize: exploreSize,
                  isTablet: isTablet,
                ),
        );
      },
    );
  }

  // ==============================================================
  // MOBILE LAYOUT
  // ==============================================================

  Widget _buildMobileLayout({
    required double headingSize,
    required double collaborationSize,
    required double benefitSize,
    required double exploreSize,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // ========================================================
        // IMAGE
        // ========================================================

        SizedBox(
          width: double.infinity,
          height: 300,
          child: Image.asset(
            'assets/img/ola.webp',
            fit: BoxFit.contain,
          ),
        ),

        const SizedBox(height: 10),

        // ========================================================
        // COPYRIGHT
        // ========================================================

        const Text(
          "Powered by Ola Stores Technologies Private Limited",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(
              255,
              137,
              135,
              135,
            ),
            fontSize: 12,
          ),
        ),

        const SizedBox(height: 25),

        // ========================================================
        // HEADING
        // ========================================================

        Text(
          "One Platform, Endless Options. Your one-stop solution for Food, Grocery, Fashion, Gift Cards & Electronics.",
          style: TextStyle(
            fontSize: headingSize,
            fontWeight: FontWeight.w700,
            height: 1.15,
          ),
        ),

        const SizedBox(height: 15),

        // ========================================================
        // ONDC
        // ========================================================

        Text(
          "In collaboration with ONDC",
          style: TextStyle(
            fontSize: collaborationSize,
          ),
        ),

        const SizedBox(height: 15),

        // ========================================================
        // BENEFITS
        // ========================================================

        Text(
          "Unlock exclusive benefits of up to 50% off across leading brands.",
          style: TextStyle(
            fontSize: benefitSize,
            fontWeight: FontWeight.w700,
            height: 1.3,
          ),
        ),

        const SizedBox(height: 20),

        // ========================================================
        // EXPLORE
        // ========================================================

        _buildExploreButton(
          fontSize: exploreSize,
        ),
      ],
    );
  }

  // ==============================================================
  // TABLET + DESKTOP LAYOUT
  // ==============================================================

  Widget _buildDesktopLayout({
    required double headingSize,
    required double collaborationSize,
    required double benefitSize,
    required double exploreSize,
    required bool isTablet,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        // ========================================================
        // LEFT SIDE
        // ========================================================

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: isTablet ? 350 : 450,
                child: Image.asset(
                  'assets/img/ola.webp',
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Powered by Ola Stores Technologies Private Limited",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(
                    255,
                    137,
                    135,
                    135,
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          width: isTablet ? 20 : 25,
        ),

        // ========================================================
        // RIGHT SIDE
        // ========================================================

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                "One Platform, Endless Options. Your one-stop solution for Food, Grocery, Fashion, Gift Cards & Electronics.",
                style: TextStyle(
                  fontSize: headingSize,
                  fontWeight: FontWeight.w700,
                  height: 1.15,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                "In collaboration with ONDC",
                style: TextStyle(
                  fontSize: collaborationSize,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                "Unlock exclusive benefits of up to 50% off across leading brands.",
                style: TextStyle(
                  fontSize: benefitSize,
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                ),
              ),

              const SizedBox(height: 20),

              _buildExploreButton(
                fontSize: exploreSize,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ==============================================================
  // EXPLORE BUTTON
  // ==============================================================

  Widget _buildExploreButton({
    required double fontSize,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () {
          print("Clicked");
        },
        borderRadius: BorderRadius.circular(5),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Explore more on the OLA App",
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(
                    255,
                    7,
                    159,
                    9,
                  ),
                ),
              ),

              const SizedBox(width: 8),

              const Icon(
                Icons.arrow_forward,
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
    );
  }
}