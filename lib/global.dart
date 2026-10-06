import 'package:flutter/material.dart';

class Global extends StatefulWidget {
  const Global({super.key});

  @override
  State<Global> createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        // Responsive values
        double titleSize = screenWidth < 400 ? 22 : 27;
        double numberSize = screenWidth < 400 ? 18 : 20;
        double descriptionSize = screenWidth < 400 ? 14 : 18;

        double imageSize = screenWidth < 400 ? 65 : 90;

        double containerPadding = screenWidth < 400 ? 10 : 20;

        return Container(
          width: double.infinity,
          margin: EdgeInsets.all(
            screenWidth < 400 ? 10 : 15,
          ),
          child: Column(
            children: [

              // ---------------- TITLE ----------------
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth < 400 ? 5 : 15,
                ),
                child: Text(
                  "Global mobility ecosystem driving communities forward",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: titleSize,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 24, 44, 24),
                    shadows: const [
                      Shadow(
                        color: Color.fromARGB(255, 71, 132, 92),
                        offset: Offset(2, 3),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // ---------------- 250+ ----------------
              _buildGlobalItem(
                screenWidth: screenWidth,
                image: 'assets/img/citiy cover.webp',
                number: '250+',
                title: 'Cities covered',
                description:
                    'Across India, Australia, New Zealand and the UK',
                imageSize: imageSize,
                numberSize: numberSize,
                descriptionSize: descriptionSize,
                containerPadding: containerPadding,
              ),

              // ---------------- 55 Cr+ ----------------
              _buildGlobalItem(
                screenWidth: screenWidth,
                image: 'assets/img/barchat.webp',
                number: '55 Cr+',
                title: 'Yearly rides',
                description:
                    'Booked by our customers every year',
                imageSize: imageSize,
                numberSize: numberSize,
                descriptionSize: descriptionSize,
                containerPadding: containerPadding,
              ),

              // ---------------- 12 Cr+ ----------------
              _buildGlobalItem(
                screenWidth: screenWidth,
                image: 'assets/img/bold.webp',
                number: '12 Cr+',
                title: 'Kilometers on S1',
                description:
                    'Distance Covered on Ola S1 scooters within a year of launch',
                imageSize: imageSize,
                numberSize: numberSize,
                descriptionSize: descriptionSize,
                containerPadding: containerPadding,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGlobalItem({
    required double screenWidth,
    required String image,
    required String number,
    required String title,
    required String description,
    required double imageSize,
    required double numberSize,
    required double descriptionSize,
    required double containerPadding,
  }) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: screenWidth < 400 ? 8 : 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          // ---------------- IMAGE ----------------
          SizedBox(
            width: imageSize,
            height: imageSize,
            child: Image.asset(
              image,
              width: imageSize,
              height: imageSize,
              fit: BoxFit.contain,
              color: const Color.fromARGB(
                197,
                228,
                236,
                214,
              ),
              colorBlendMode: BlendMode.multiply,
            ),
          ),

          // ---------------- TEXT ----------------
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: screenWidth < 400 ? 12 : 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Number
                  Text(
                    number,
                    style: TextStyle(
                      color: const Color.fromARGB(
                        255,
                        2,
                        48,
                        3,
                      ),
                      fontWeight: FontWeight.bold,
                      fontSize: numberSize,
                    ),
                  ),

                  // Title
                  Text(
                    title,
                    style: TextStyle(
                      color: const Color.fromARGB(
                        255,
                        2,
                        48,
                        3,
                      ),
                      fontWeight: FontWeight.w600,
                      fontSize: numberSize,
                    ),
                  ),

                  const SizedBox(height: 5),

                  // Description
                  Text(
                    description,
                    style: TextStyle(
                      color: const Color.fromARGB(
                        255,
                        93,
                        91,
                        91,
                      ),
                      fontSize: descriptionSize,
                      height: 1.3,
                    ),
                    maxLines: screenWidth < 400 ? 4 : 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}