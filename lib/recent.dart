import 'package:flutter/material.dart';

class Recent extends StatefulWidget {
  const Recent({super.key});

  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  final Color green = const Color.fromARGB(255, 7, 159, 9);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;

        // Responsive breakpoints
        bool isMobile = width < 600;
        bool isTablet = width >= 600 && width < 1000;

        // Responsive values
        double horizontalPadding = isMobile
            ? 16
            : isTablet
                ? 30
                : 50;

        double titleSize = isMobile
            ? 26
            : isTablet
                ? 30
                : 35;

        double imageSize = isMobile
            ? width - (horizontalPadding * 2)
            : isTablet
                ? (width - (horizontalPadding * 2) - 20) / 2
                : (width - (horizontalPadding * 2) - 50) / 3;

        // Make sure image doesn't become too large
        if (!isMobile && imageSize > 300) {
          imageSize = 300;
        }

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 20,
          ),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 239, 236, 236),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ---------------- TITLE ----------------
              Text(
                "Recent from our blogs",
                style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 25),

              // ---------------- BLOG CARDS ----------------
              if (isMobile)

                // ================= MOBILE =================
                Column(
                  children: [
                    _buildBlogCard(
                      image: 'assets/img/pli-agreement.png',
                      title: "Ola Signs PLI agreement",
                      imageSize: imageSize,
                    ),

                    const SizedBox(height: 30),

                    _buildBlogCard(
                      image: 'assets/img/ola-to-invest.png',
                      title: "Ola to invest",
                      imageSize: imageSize,
                    ),

                    const SizedBox(height: 30),

                    _buildBlogCard(
                      image: 'assets/img/indigenous-cell.png',
                      title: "India's first indigenous cell",
                      imageSize: imageSize,
                    ),
                  ],
                )

              else

                // ================= TABLET / DESKTOP =================
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // First blog
                    Expanded(
                      child: _buildBlogCard(
                        image: 'assets/img/pli-agreement.png',
                        title: "Ola Signs PLI agreement",
                        imageSize: imageSize,
                      ),
                    ),

                    const SizedBox(width: 25),

                    // Second blog
                    Expanded(
                      child: _buildBlogCard(
                        image: 'assets/img/ola-to-invest.png',
                        title: "Ola to invest",
                        imageSize: imageSize,
                      ),
                    ),

                    const SizedBox(width: 25),

                    // Third blog
                    Expanded(
                      child: _buildBlogCard(
                        image: 'assets/img/indigenous-cell.png',
                        title: "India's first indigenous cell",
                        imageSize: imageSize,
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

  // =========================================================
  // BLOG CARD
  // =========================================================

  Widget _buildBlogCard({
    required String image,
    required String title,
    required double imageSize,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // ---------------- IMAGE ----------------
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.asset(
            image,

            width: imageSize,
            height: imageSize,

            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(height: 10),

        // ---------------- TITLE ----------------
        Text(
          title,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w700,
            letterSpacing: -1,
          ),
        ),

        const SizedBox(height: 8),

        // ---------------- KNOW MORE ----------------
        MouseRegion(
          cursor: SystemMouseCursors.click,

          child: InkWell(
            onTap: () {
              print("Clicked: $title");
            },

            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                Text(
                  "Know more",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: green,
                  ),
                ),

                const SizedBox(width: 8),

                Icon(
                  Icons.arrow_forward,
                  color: green,
                  size: 22,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}