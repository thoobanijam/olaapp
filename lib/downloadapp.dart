import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Downloadapp extends StatefulWidget {
  const Downloadapp({super.key});

  @override
  State<Downloadapp> createState() => _DownloadappState();
}

class _DownloadappState extends State<Downloadapp> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;

        // Responsive breakpoints
        final bool isMobile = width < 600;
        final bool isTablet = width >= 600 && width < 1000;

        // Responsive values
        final double horizontalPadding = isMobile
            ? 20
            : isTablet
                ? 30
                : 50;

        final double titleSize = isMobile
            ? 30
            : isTablet
                ? 36
                : 43;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 30,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ==================================================
              // TITLE
              // ==================================================

              Text(
                "Download our apps\nto get the best experience",
                style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -1,
                ),
              ),

              const SizedBox(height: 30),

              // ==================================================
              // APP CARDS
              // ==================================================

              if (isMobile)

                // ================= MOBILE =================
                Column(
                  children: [

                    _buildAppCard(
                      icon: 'assets/img/olacab.png',
                      title: "Ola",
                      description:
                          "Book cabs, buy insurance, access Ola Money and much more",
                    ),

                    const SizedBox(height: 20),

                    _buildAppCard(
                      icon: 'assets/img/olacab.png',
                      title: "Ola Driver",
                      description:
                          "Book rides, see your earnings and incentives",
                    ),
                  ],
                )

              else

                // ================= TABLET / DESKTOP =================
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Expanded(
                      child: _buildAppCard(
                        icon: 'assets/img/olacab.png',
                        title: "Ola",
                        description:
                            "Book cabs, buy insurance, access Ola Money and much more",
                      ),
                    ),

                    const SizedBox(width: 30),

                    Expanded(
                      child: _buildAppCard(
                        icon: 'assets/img/olacab.png',
                        title: "Ola Driver",
                        description:
                            "Book rides, see your earnings and incentives",
                      ),
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  // ==========================================================
  // APP CARD
  // ==========================================================

  Widget _buildAppCard({
    required String icon,
    required String title,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      height: 300,

      padding: const EdgeInsets.all(20),

      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 226, 231, 228),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ==================================================
          // APP ICON
          // ==================================================

          Container(
            margin: const EdgeInsets.only(
              left: 10,
              top: 10,
            ),

            child: Image.asset(
              icon,
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
          ),

          const Spacer(),

          // ==================================================
          // TITLE + ARROW
          // ==================================================

          Row(
            children: [

              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              const Icon(
                Icons.arrow_forward,
                size: 22,
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ==================================================
          // DESCRIPTION
          // ==================================================

          Text(
            description,
            style: const TextStyle(
              fontSize: 15,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}