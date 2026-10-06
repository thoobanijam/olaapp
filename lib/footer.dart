import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  bool isIndia = false;

  final Color textColor = const Color.fromARGB(255, 64, 62, 62);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;

        final bool isMobile = width < 600;
        final bool isTablet = width >= 600 && width < 1000;

        final double horizontalPadding = isMobile
            ? 20
            : isTablet
                ? 30
                : 50;

        return Container(
          width: double.infinity,
          color: const Color.fromARGB(255, 236, 239, 240),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // =====================================================
              // TOP FOOTER
              // =====================================================

              if (isMobile)

                // ================= MOBILE =================
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    _buildLogoSection(),

                    const SizedBox(height: 35),

                    _buildFooterColumn(
                      title: "Book a cab",
                      items: [
                        "Driver with us",
                        "Outstation",
                        "Rental",
                        "Ola Money",
                        "Corporate",
                      ],
                    ),

                    const SizedBox(height: 30),

                    _buildFooterColumn(
                      title: "About Us",
                      items: [
                        "Contact us",
                        "Support",
                        "Careers",
                        "Media Centre",
                      ],
                    ),

                    const SizedBox(height: 30),

                    _buildFooterColumn(
                      title: "Ola S1",
                      items: [
                        "Futurefactory",
                        "Electric",
                        "Investor Relations",
                      ],
                    ),
                  ],
                )

              else if (isTablet)

                // ================= TABLET =================
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    _buildLogoSection(),

                    const SizedBox(height: 40),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Expanded(
                          child: _buildFooterColumn(
                            title: "Book a cab",
                            items: [
                              "Driver with us",
                              "Outstation",
                              "Rental",
                              "Ola Money",
                              "Corporate",
                            ],
                          ),
                        ),

                        Expanded(
                          child: _buildFooterColumn(
                            title: "About Us",
                            items: [
                              "Contact us",
                              "Support",
                              "Careers",
                              "Media Centre",
                            ],
                          ),
                        ),

                        Expanded(
                          child: _buildFooterColumn(
                            title: "Ola S1",
                            items: [
                              "Futurefactory",
                              "Electric",
                              "Investor Relations",
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )

              else

                // ================= DESKTOP =================
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // LOGO
                    Expanded(
                      flex: 2,
                      child: _buildLogoSection(),
                    ),

                    // BOOK A CAB
                    Expanded(
                      child: _buildFooterColumn(
                        title: "Book a cab",
                        items: [
                          "Driver with us",
                          "Outstation",
                          "Rental",
                          "Ola Money",
                          "Corporate",
                        ],
                      ),
                    ),

                    // ABOUT US
                    Expanded(
                      child: _buildFooterColumn(
                        title: "About Us",
                        items: [
                          "Contact us",
                          "Support",
                          "Careers",
                          "Media Centre",
                        ],
                      ),
                    ),

                    // OLA S1
                    Expanded(
                      child: _buildFooterColumn(
                        title: "Ola S1",
                        items: [
                          "Futurefactory",
                          "Electric",
                          "Investor Relations",
                        ],
                      ),
                    ),
                  ],
                ),

              const SizedBox(height: 40),

              // =====================================================
              // DIVIDER
              // =====================================================

              const Divider(
                thickness: 1,
                color: Color.fromARGB(255, 209, 205, 205),
              ),

              const SizedBox(height: 20),

              // =====================================================
              // BOTTOM FOOTER
              // =====================================================

              if (isMobile)
                _buildMobileBottom()

              else
                _buildDesktopBottom(
                  isTablet: isTablet,
                ),
            ],
          ),
        );
      },
    );
  }

  // ===============================================================
  // LOGO + SOCIAL MEDIA
  // ===============================================================

  Widget _buildLogoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Image.asset(
          'assets/img/olalogo.png',
          width: 80,
          height: 80,
          fit: BoxFit.contain,
        ),

        const SizedBox(height: 20),

        Row(
          children: [

            Image.asset(
              'assets/img/insta.png',
              width: 40,
              height: 40,
            ),

            const SizedBox(width: 20),

            Image.asset(
              'assets/img/utube.png',
              width: 30,
              height: 30,
            ),

            const SizedBox(width: 20),

            Image.asset(
              'assets/img/twitter.png',
              width: 30,
              height: 30,
            ),
          ],
        ),
      ],
    );
  }

  // ===============================================================
  // FOOTER COLUMN
  // ===============================================================

  Widget _buildFooterColumn({
    required String title,
    required List<String> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          title,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),

        const SizedBox(height: 12),

        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              item,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ===============================================================
  // MOBILE BOTTOM
  // ===============================================================

  Widget _buildMobileBottom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // COPYRIGHT
        const Text(
          "Copyright © 2024 Ola Electric Mobility Pvt Ltd. "
          "All Rights Reserved.",
          style: TextStyle(
            fontSize: 10,
          ),
        ),

        const SizedBox(height: 20),

        // NOTICES
        const Text(
          "Notices",
          style: TextStyle(
            fontSize: 14,
          ),
        ),

        const SizedBox(height: 15),

        // PRIVACY
        const Text(
          "Privacy Policy",
          style: TextStyle(
            fontSize: 14,
            decoration: TextDecoration.underline,
          ),
        ),

        const SizedBox(height: 15),

        // TERMS
        const Text(
          "Terms of Service",
          style: TextStyle(
            fontSize: 14,
            decoration: TextDecoration.underline,
          ),
        ),

        const SizedBox(height: 20),

        // COUNTRY
        _buildCountrySelector(),
      ],
    );
  }

  // ===============================================================
  // TABLET / DESKTOP BOTTOM
  // ===============================================================

  Widget _buildDesktopBottom({
    required bool isTablet,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        // COPYRIGHT
        Expanded(
          child: const Text(
            "Copyright © 2024 Ola Electric Mobility Pvt Ltd. "
            "All Rights Reserved.",
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ),

        const SizedBox(width: 20),

        // NOTICES
        const Text(
          "Notices",
          style: TextStyle(
            fontSize: 14,
          ),
        ),

        const SizedBox(width: 25),

        // PRIVACY
        const Text(
          "Privacy Policy",
          style: TextStyle(
            fontSize: 14,
            decoration: TextDecoration.underline,
          ),
        ),

        const SizedBox(width: 25),

        // TERMS
        const Text(
          "Terms of Service",
          style: TextStyle(
            fontSize: 14,
            decoration: TextDecoration.underline,
          ),
        ),

        const SizedBox(width: 25),

        // COUNTRY
        _buildCountrySelector(),
      ],
    );
  }

  // ===============================================================
  // COUNTRY SELECTOR
  // ===============================================================

  Widget _buildCountrySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            const Text(
              "India",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),

            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                setState(() {
                  isIndia = !isIndia;
                });
              },
              icon: const Icon(
                Icons.keyboard_arrow_down,
                size: 22,
              ),
            ),
          ],
        ),

        // =========================================================
        // COUNTRY DROPDOWN
        // =========================================================

        if (isIndia)
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: 100,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color.fromARGB(
                  255,
                  220,
                  242,
                  250,
                ),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "AU",
                  style: TextStyle(
                    color: Color.fromARGB(
                      255,
                      96,
                      94,
                      94,
                    ),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  "UK",
                  style: TextStyle(
                    color: Color.fromARGB(
                      255,
                      96,
                      94,
                      94,
                    ),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  "NZ",
                  style: TextStyle(
                    color: Color.fromARGB(
                      255,
                      96,
                      94,
                      94,
                    ),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}