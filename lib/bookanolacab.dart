import 'package:flutter/material.dart';
import 'loginpage.dart';

class Bookanolacab extends StatefulWidget {
  final String pickupLocation;
  final String destinationLocation;

  const Bookanolacab({
    super.key,
    this.pickupLocation = '',
    this.destinationLocation = '',
  });

  @override
  State<Bookanolacab> createState() => _BookanolacabState();
}

class _BookanolacabState extends State<Bookanolacab> {
  bool isMenu = false;

  bool isDailyride = true;
  bool isOutstation = false;
  bool isRental = false;

  bool isNow = false;

  String selectedWhen = "Now";
  String selectedCarType = "";

  final TextEditingController fromController =
      TextEditingController();

  final TextEditingController toController =
      TextEditingController();

  @override
  void initState() {
    super.initState();

    fromController.text = widget.pickupLocation;
    toController.text = widget.destinationLocation;
  }

  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
        255,
        229,
        233,
        234,
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          final double screenWidth = constraints.maxWidth;
          final double screenHeight = constraints.maxHeight;

          final bool isMobile = screenWidth < 600;

          final bool isTablet =
              screenWidth >= 600 && screenWidth < 1000;

          final double menuWidth =
              isMobile ? screenWidth * 0.82 : 300;

          return Stack(
            children: [

              // =====================================================
              // MAIN CONTENT
              // =====================================================

              if (isMobile)

                // ================= MOBILE =================

                Column(
                  children: [

                    Expanded(
                      child: _buildBookingPanel(
                        isMobile: true,
                      ),
                    ),

                    SizedBox(
                      width: screenWidth,
                      height: 250,
                      child: _buildRideImage(),
                    ),
                  ],
                )

              else

                // ================= TABLET / DESKTOP =================

                Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.stretch,

                  children: [

                    // LEFT BOOKING AREA
                    SizedBox(
                      width: isTablet
                          ? screenWidth * 0.55
                          : screenWidth * 0.50,

                      height: screenHeight,

                      child: _buildBookingPanel(
                        isMobile: false,
                      ),
                    ),

                    // RIGHT IMAGE
                    Expanded(
                      child: _buildRideImage(),
                    ),
                  ],
                ),

              // =====================================================
              // DARK OVERLAY
              // =====================================================

              if (isMenu)
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMenu = false;
                      });
                    },

                    child: Container(
                      color: Colors.black.withOpacity(0.45),
                    ),
                  ),
                ),

              // =====================================================
              // SLIDING MENU
              // =====================================================

              AnimatedPositioned(
                duration:
                    const Duration(milliseconds: 350),

                curve: Curves.easeInOut,

                left: isMenu ? 0 : -menuWidth,

                top: 0,
                bottom: 0,

                child: SafeArea(
                  child: Material(
                    elevation: 15,

                    child: SizedBox(
                      width: menuWidth,

                      child: Container(
                        color: Colors.white,

                        child: _buildSideMenu(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // ===============================================================
  // BOOKING PANEL
  // ===============================================================

  Widget _buildBookingPanel({
    required bool isMobile,
  }) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
        255,
        229,
        233,
        234,
      ),

      // ===========================================================
      // REAL APP BAR
      // ===========================================================

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),

        child: AppBar(
          backgroundColor: const Color.fromARGB(
            255,
            240,
            241,
            242,
          ),

          elevation: 2,

          automaticallyImplyLeading: false,

          // =======================================================
          // MENU
          // =======================================================

          leading: SizedBox(
            width: 55,

            child: IconButton(
              padding: EdgeInsets.zero,

              onPressed: () {
                setState(() {
                  isMenu = true;
                });
              },

              icon: const Icon(
                Icons.menu,

                color: Color.fromARGB(
                  255,
                  80,
                  80,
                  80,
                ),

                size: 28,
              ),
            ),
          ),

          // =======================================================
          // LOGO
          // =======================================================

          centerTitle: true,

          title: SizedBox(
            height: 45,

            child: Image.asset(
              'assets/img/bookolaimg.webp',

              width: isMobile ? 85 : 100,

              height: 45,

              fit: BoxFit.contain,
            ),
          ),

          // =======================================================
          // LOGIN
          // =======================================================

          actions: [

            Padding(
              padding: EdgeInsets.only(
                right: isMobile ? 4 : 12,
              ),

              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (context) =>
                          Loginpage(),
                    ),
                  );
                },

                child: Text(
                  "LOG IN",

                  style: TextStyle(
                    color: Colors.black,

                    fontSize:
                        isMobile ? 12 : 14,

                    fontWeight:
                        FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // ===========================================================
      // BOOKING CONTENT
      // ===========================================================

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 8 : 10,

            vertical: 15,
          ),

          child: Column(
            children: [

              // =====================================================
              // RIDE TABS
              // =====================================================

              _buildRideTabs(
                isMobile: isMobile,
              ),

              const SizedBox(height: 10),

              // =====================================================
              // DAILY
              // =====================================================

              if (isDailyride)

                _buildDailyRide(
                  isMobile: isMobile,
                )

              // =====================================================
              // OUTSTATION
              // =====================================================

              else if (isOutstation)

                _buildOutstation(
                  isMobile: isMobile,
                )

              // =====================================================
              // RENTAL
              // =====================================================

              else if (isRental)

                _buildRental(
                  isMobile: isMobile,
                ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ===============================================================
  // RIDE TABS
  // ===============================================================

  Widget _buildRideTabs({
    required bool isMobile,
  }) {
    return Container(
      margin: EdgeInsets.only(
        top: isMobile ? 5 : 10,
      ),

      decoration: BoxDecoration(
       
      ),

      child: Row(
        children: [

          Expanded(
            child: _rideTab(
              title: "DAILY RIDES",

              selected: isDailyride,

              isMobile: isMobile,

              onTap: () {
                setState(() {
                  isDailyride = true;
                  isOutstation = false;
                  isRental = false;
                });
              },
            ),
          ),

          const SizedBox(width: 4),

          Expanded(
            child: _rideTab(
              title: "OUTSTATION",

              selected: isOutstation,

              isMobile: isMobile,

              onTap: () {
                setState(() {
                  isDailyride = false;
                  isOutstation = true;
                  isRental = false;
                });
              },
            ),
          ),

          const SizedBox(width: 4),

          Expanded(
            child: _rideTab(
              title: "RENTALS",

              selected: isRental,

              isMobile: isMobile,

              onTap: () {
                setState(() {
                  isDailyride = false;
                  isOutstation = false;
                  isRental = true;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  // ===============================================================
  // SINGLE RIDE TAB
  // ===============================================================

  Widget _rideTab({
    required String title,
    required bool selected,
    required bool isMobile,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: double.infinity,

        padding: EdgeInsets.symmetric(
          vertical: isMobile ? 9 : 10,

          horizontal: 3,
        ),

        alignment: Alignment.center,

        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(20),

          color: selected
              ? const Color.fromARGB(
                  255,
                  215,
                  228,
                  97,
                )
              : Colors.grey.shade200,
        ),

        child: FittedBox(
          fit: BoxFit.scaleDown,

          child: Text(
            title,

            style: TextStyle(
              fontWeight:
                  FontWeight.w700,

              fontSize:
                  isMobile ? 11 : 13,
            ),
          ),
        ),
      ),
    );
  }

  // ===============================================================
  // DAILY RIDE
  // ===============================================================

  Widget _buildDailyRide({
    required bool isMobile,
  }) {
    return Column(
      children: [

        _buildTextField(
          controller: fromController,

          prefix: "FROM",

          hintText:
              "Enter pickup location",
        ),

        const SizedBox(height: 5),

        _buildTextField(
          controller: toController,

          prefix: "TO",

          hintText:
              "Search locality or landmark",
        ),

        const SizedBox(height: 5),

        _buildWhenSelector(
          isMobile: isMobile,
        ),

        if (isNow)
          _buildWhenDropdown(
            isMobile: isMobile,
          ),

        const SizedBox(height: 15),

        Container(
          width: double.infinity,

          alignment:
              Alignment.centerLeft,

          margin: EdgeInsets.symmetric(
            horizontal:
                isMobile ? 5 : 15,
          ),

          child: Text(
            "AVAILABLE RIDES",

            style: TextStyle(
              fontWeight:
                  FontWeight.w600,

              fontSize:
                  isMobile ? 14 : 16,
            ),
          ),
        ),

        const SizedBox(height: 8),

        _buildAvailableRides(
          isMobile: isMobile,
        ),

        const SizedBox(height: 5),

        SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    onPressed: selectedCarType.isEmpty
        ? null
        : () {
            print("Selected car: $selectedCarType");
          },
    child: const Text(
      "CONFIRM BOOKING",
    ),
  ),
),

const SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15,

            horizontal:
                isMobile ? 10 : 20,
          ),

          child: Text(
            "Please log in to check exact prices.",

            textAlign: TextAlign.center,

            style: TextStyle(
              fontSize:
                  isMobile ? 12 : 14,
            ),
          ),
        ),
      ],
    );
  }

  // ===============================================================
  // TEXT FIELD
  // ===============================================================

  Widget _buildTextField({
    required TextEditingController controller,
    required String prefix,
    required String hintText,
  }) {
    return TextField(
      controller: controller,

      maxLines: 1,

      textInputAction:
          TextInputAction.next,

      decoration: InputDecoration(
        filled: true,

        fillColor: const Color.fromARGB(
          245,
          205,
          207,
          207,
        ),

        prefixText: "$prefix   ",

        prefixStyle: const TextStyle(
          color: Colors.grey,

          fontSize: 14,

          fontWeight:
              FontWeight.w500,
        ),

        hintText: hintText,

        hintStyle: const TextStyle(
          color: Colors.grey,

          fontSize: 14,
        ),

        contentPadding:
            const EdgeInsets.symmetric(
          horizontal: 15,

          vertical: 15,
        ),

        border: InputBorder.none,

        enabledBorder:
            InputBorder.none,

        focusedBorder:
            InputBorder.none,
      ),
    );
  }

  // ===============================================================
  // WHEN
  // ===============================================================

  Widget _buildWhenSelector({
    required bool isMobile,
  }) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.only(
        left: 15,
        right: 5,
      ),

      decoration: BoxDecoration(
        color: const Color.fromARGB(
          245,
          205,
          207,
          207,
        ),

        borderRadius:
            BorderRadius.circular(5),
      ),

      child: Row(
        children: [

          Expanded(
            child: RichText(
              maxLines: 1,

              overflow:
                  TextOverflow.ellipsis,

              text: TextSpan(
                children: [

                  TextSpan(
                    text: "WHEN   ",

                    style: TextStyle(
                      color: Colors.grey,

                      fontSize:
                          isMobile ? 14 : 16,
                    ),
                  ),

                  TextSpan(
                    text: selectedWhen,

                    style: TextStyle(
                      color: Colors.black,

                      fontSize:
                          isMobile ? 14 : 16,

                      fontWeight:
                          FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),

          IconButton(
            padding: EdgeInsets.zero,

            constraints:
                const BoxConstraints(
              minWidth: 40,
              minHeight: 40,
            ),

            onPressed: () {
              setState(() {
                isNow = !isNow;
              });
            },

            icon: const Icon(
              Icons.keyboard_arrow_down,

              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // ===============================================================
  // WHEN DROPDOWN
  // ===============================================================

  Widget _buildWhenDropdown({
    required bool isMobile,
  }) {
    return Container(
      width: double.infinity,

      margin: EdgeInsets.only(
        top: 5,

        left: isMobile ? 5 : 20,

        right: isMobile ? 5 : 20,
      ),

      decoration: BoxDecoration(
        color: Colors.white,

        border: Border.all(
          color: Colors.black38,
        ),
      ),

      child: Column(
        children: [

          _buildWhenOption(
            title: "Now",

            isMobile: isMobile,
          ),

          _buildWhenOption(
            title: "Schedule for later",

            isMobile: isMobile,
          ),
        ],
      ),
    );
  }

  // ===============================================================
  // WHEN OPTION
  // ===============================================================

  Widget _buildWhenOption({
    required String title,
    required bool isMobile,
  }) {
    final bool selected =
        selectedWhen == title;

    return InkWell(
      onTap: () {
        setState(() {
          selectedWhen = title;

          isNow = false;
        });
      },

      child: Container(
        width: double.infinity,

        padding: EdgeInsets.symmetric(
          horizontal: 10,

          vertical:
              isMobile ? 12 : 14,
        ),

        color: selected
            ? const Color.fromARGB(
                255,
                120,
                117,
                117,
              )
            : Colors.white,

        child: Text(
          title,

          style: TextStyle(
            color: selected
                ? Colors.white
                : Colors.black,

            fontSize:
                isMobile ? 14 : 16,
          ),
        ),
      ),
    );
  }

  // ===============================================================
  // AVAILABLE RIDES
  // ===============================================================

  Widget _buildAvailableRides({
    required bool isMobile,
  }) {
    return Container(
      width: double.infinity,

      margin: EdgeInsets.symmetric(
        horizontal:
            isMobile ? 5 : 15,
      ),

      decoration: BoxDecoration(
        color: Colors.white,

        border: Border.all(
          color: Colors.grey,
        ),
      ),

      child: Column(
        children: [

          _buildRideItem(
            title: "Auto",

            description:
                "Get an auto at your doorstep",

            isMobile: isMobile,
          ),

          const Divider(height: 1),

          _buildRideItem(
            title: "Mini",

            description:
                "Comfy hatchbacks at pocket-friendly fares",

            isMobile: isMobile,
          ),

          const Divider(height: 1),

          _buildRideItem(
            title: "Bike",

            description:
                "Zip through traffic at affordable fares",

            isMobile: isMobile,
          ),

          const Divider(height: 1),

          _buildRideItem(
            title: "Prime Sedan",

            description:
                "Sedans with free wifi and top drivers",

            isMobile: isMobile,
          ),

          const Divider(height: 1),

          _buildRideItem(
            title: "Prime SUV",

            description:
                "SUV with free and top drivers",

            isMobile: isMobile,
          ),
        ],
      ),
    );
  }

  // ===============================================================
  // RIDE ITEM
  // ===============================================================

  Widget _buildRideItem({
    required String title,
    required String description,
    required bool isMobile,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedCarType=title;
        });
      },

      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal:
              isMobile ? 8 : 10,

          vertical:
              isMobile ? 10 : 12,
        ),

        child: Row(
          children: [

            SizedBox(
              width:
                  isMobile ? 38 : 45,

              height:
                  isMobile ? 38 : 45,

              child: Image.asset(
                'assets/img/auto.png',

                fit: BoxFit.contain,
              ),
            ),

            SizedBox(
              width:
                  isMobile ? 8 : 15,
            ),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    title,

                    maxLines: 1,

                    overflow:
                        TextOverflow.ellipsis,

                    style: TextStyle(
                      fontWeight:
                          FontWeight.w700,

                      fontSize:
                          isMobile ? 14 : 15,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    description,

                    maxLines: 2,

                    overflow:
                        TextOverflow.ellipsis,

                    style: TextStyle(
                      color: Colors.grey,

                      fontSize:
                          isMobile ? 11 : 13,
                    ),
                  ),
                ],
              ),
            ),

            Icon(
              Icons.keyboard_arrow_right,

              color: Colors.grey,

              size:
                  isMobile ? 22 : 25,
            ),
          ],
        ),
      ),
    );
  }

  // ===============================================================
  // OUTSTATION
  // ===============================================================

  Widget _buildOutstation({
    required bool isMobile,
  }) {
    return Column(
      children: [

        _buildTextField(
          controller: fromController,

          prefix: "FROM",

          hintText:
              "Enter pickup location",
        ),

        const SizedBox(height: 5),

        _buildTextField(
          controller: toController,

          prefix: "TO",

          hintText:
              "Enter city, hotel or address",
        ),
      ],
    );
  }

  // ===============================================================
  // RENTAL
  // ===============================================================

  Widget _buildRental({
    required bool isMobile,
  }) {
    return Column(
      children: [

        _buildTextField(
          controller: fromController,

          prefix: "FROM",

          hintText:
              "Enter pickup location",
        ),

        const SizedBox(height: 5),

        _buildTextField(
          controller: toController,

          prefix: "PACKAGE",

          hintText:
              "Select a package",
        ),
      ],
    );
  }

  // ===============================================================
  // RIDE IMAGE
  // ===============================================================

  Widget _buildRideImage() {
    String imagePath;

    if (isDailyride) {
      imagePath =
          'assets/img/manbookola.png';
    } else if (isOutstation) {
      imagePath =
          'assets/img/outstation.png';
    } else {
      imagePath =
          'assets/img/rental.png';
    }

    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: Colors.grey.shade300,
      ),

      child: Image.asset(
        imagePath,

        width: double.infinity,

        height: double.infinity,

        fit: BoxFit.cover,
      ),
    );
  }

  // ===============================================================
  // SIDE MENU
  // ===============================================================

  Widget _buildSideMenu() {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [

        Padding(
          padding:
              const EdgeInsets.all(10),

          child: Align(
            alignment:
                Alignment.topRight,

            child: IconButton(
              onPressed: () {
                setState(() {
                  isMenu = false;
                });
              },

              icon: const Icon(
                Icons.close,

                size: 25,
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),

        _buildSideMenuItem(
          icon: Icons.directions_car,

          title: "Book your ride",
        ),

        _buildSideMenuItem(
          icon: Icons.currency_rupee,

          title: "Rate card",
        ),

        _buildSideMenuItem(
          icon: Icons.support,

          title: "Support",
        ),

        const Spacer(),

        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },

          child: Container(
            margin:
                const EdgeInsets.all(20),

            width: 60,

            height: 35,

            alignment:
                Alignment.center,

            decoration: BoxDecoration(
              color:
                  Colors.grey.shade400,

              borderRadius:
                  BorderRadius.circular(5),
            ),

            child: const Text(
              "BACK",

              style: TextStyle(
                fontSize: 13,

                fontWeight:
                    FontWeight.w700,

                color: Color.fromARGB(
                  255,
                  66,
                  65,
                  65,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),
      ],
    );
  }

  // ===============================================================
  // SIDE MENU ITEM
  // ===============================================================

  Widget _buildSideMenuItem({
    required IconData icon,
    required String title,
  }) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 15,

        vertical: 8,
      ),

      child: Row(
        children: [

          Icon(
            icon,

            color: Colors.black54,
          ),

          const SizedBox(width: 20),

          Expanded(
            child: Text(
              title,

              style: const TextStyle(
                color: Color.fromARGB(
                  255,
                  91,
                  89,
                  89,
                ),

                fontWeight:
                    FontWeight.w500,

                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}