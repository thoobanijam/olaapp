
import 'package:flutter/material.dart';

class Scooty extends StatefulWidget {
  const Scooty({super.key});

  @override
  State<Scooty> createState() => _ScootyState();
}

class _ScootyState extends State<Scooty> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive sizes
    final double imageWidth = screenWidth < 400 ? 110 : 150;
    final double titleSize = screenWidth < 400 ? 16 : 20;
    final double descriptionSize = screenWidth < 400 ? 11 : 13;

    return Container(
      width: double.infinity,
      height: screenWidth < 400 ? 140 : 160,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        
        image: const DecorationImage(
          image: AssetImage(
            'assets/img/background image.jpg',
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // =========================
          // SCOOTY IMAGE
          // =========================
          SizedBox(
            width: imageWidth,
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Image.asset(
                'assets/img/scooty.png',
                width: imageWidth,
                height: imageWidth,
                fit: BoxFit.contain,
                color: const Color.fromARGB(199, 155, 186, 102),
                colorBlendMode: BlendMode.multiply,
              ),
            ),
          ),

          // =========================
          // TEXT
          // =========================
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Introducing the all-new S1X+",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 19, 40, 20),
                      fontSize: titleSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Flexible(
                    child: Text(
                      "Check the all new design, Gorgeous from every angle! "
                      "Grab the all new S1X+ at ₹89,999* only and make it your today!",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: descriptionSize,
                        height: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // =========================
          // ARROW
          // =========================
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
              ),
              style: IconButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(149, 4, 64, 7),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

