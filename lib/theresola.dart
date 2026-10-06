import 'package:flutter/material.dart';

class TheresOla extends StatefulWidget {
  const TheresOla({super.key});

  @override
  State<TheresOla> createState() => _TheresOlaState();
}

class _TheresOlaState extends State<TheresOla> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        children: [

          // ---------------- TITLE ----------------

          Text(
            "There's an Ola ride for everyone",
            style: TextStyle(
              fontSize: 27,
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

          // ---------------- For any budjet ----------------

          Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              children: [

                Image.asset(
                  'assets/img/autocar.png',
                  width: 120,
                  height: 120,
                  color: const Color.fromARGB(
                    197,
                    228,
                    236,
                    214,
                  ),
                  colorBlendMode: BlendMode.multiply,
                ),

                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        const Text(
                          "For any budget",
                          style: TextStyle(
                            color: Color.fromARGB(255, 2, 48, 3),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),

                        

                        SizedBox(
                          width: 400,
                          child: const Text(
                            "From Bikes and Autos to Prime Sedans and Prime SUVs, you will find a ride in your budget at your convenience any time.",
                            style: TextStyle(
                              color: Color.fromARGB(255, 73, 71, 71),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ---------------- for any distance ----------------

          Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              children: [

                Image.asset(
                  'assets/img/foranydistance.png',
                  width: 120,
                  height: 120,
                  color: const Color.fromARGB(
                    197,
                    228,
                    236,
                    214,
                  ),
                  colorBlendMode: BlendMode.multiply,
                ),

                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        const Text(
                          "For any distance",
                          style: TextStyle(
                            color: Color.fromARGB(255, 2, 48, 3),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),

                       

                        SizedBox(
                          child: const Text(
                            "Book rides within the city with Daily, or take a trip to your favourite destinations outside the city with Outstation.",
                           style: TextStyle(
                              color: Color.fromARGB(255, 73, 71, 71),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ---------------- 12 CR+ ----------------

          Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              children: [

                Image.asset(
                  'assets/img/bold.webp',
                  width: 120,
                  height: 120,
                  color: const Color.fromARGB(
                    197,
                    228,
                    236,
                    214,
                  ),
                  colorBlendMode: BlendMode.multiply,
                ),

                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        const Text(
                          "For any duration",
                          style: TextStyle(
                            color: Color.fromARGB(255, 2, 48, 3),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),

                      

                        SizedBox(
                          width: 400,
                          child: const Text(
                            "Easily plan a day out without having to worry about conveyance with an hour-based package from Rental.",
                          style: TextStyle(
                                color: Color.fromARGB(255, 73, 71, 71),
                                fontSize: 14,
                              ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}