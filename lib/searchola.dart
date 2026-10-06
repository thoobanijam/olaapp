import 'package:flutter/material.dart';
import 'package:ola_app_1/bookanolacab.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchOla extends StatefulWidget {
  const SearchOla({super.key});

  @override
  State<SearchOla> createState() => _SearchOlaState();
}

class _SearchOlaState extends State<SearchOla> {

 
int selectedTap = 0;
final TextEditingController dailypickupController =
    TextEditingController();

final TextEditingController dailydestinationController =
    TextEditingController();

final TextEditingController rentalpickupController =
    TextEditingController();

final TextEditingController rentaldestinationController =
    TextEditingController();

    final TextEditingController outstandingpickupController =
    TextEditingController();

final TextEditingController outstandingdestinationController =
    TextEditingController();

Future<void> saveRide({
  required String pickup,
  required String destination,
  required String rideType,
}) async {
  try {
    await FirebaseFirestore.instance.collection('rides').add({
      'pickup': pickup,
      'destination': destination,
      'rideType': rideType,
      'createdAt': FieldValue.serverTimestamp(),
    });

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Ride saved successfully'),
      ),
    );
  } catch (e) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error saving ride: $e'),
      ),
    );
  }
}
 

   @override
  void dispose() {
    dailypickupController.dispose();
    dailydestinationController.dispose();
    rentalpickupController.dispose();
    rentaldestinationController.dispose();
    outstandingpickupController.dispose();
    outstandingdestinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

    
        Container(
          
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 237, 232, 232),
            
          ),
         child:   Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  
                  GestureDetector(
          onTap: () {
        setState(() {
          selectedTap=0;
        });
          },
          child: Column(
              mainAxisSize: MainAxisSize.min,
            children: [
              Text("Daily",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              color: selectedTap == 0 
              ? Colors.black 
              : const Color.fromARGB(255, 73, 71, 71),
              
              ),
              ),
               if (selectedTap == 0) ...[
      

        Container(
          margin: EdgeInsets.only(
            top:5,
          ),
          width: 60,
          height: 2,
          color: Colors.black,
        ),
      ],
            ],
          ),
        
        ),
        
        GestureDetector(
          onTap: () {
        setState(() {
          selectedTap = 1;
        });
          },
          child: 
          Column(
            children: [
              Text("Rental",style: TextStyle(fontWeight: FontWeight.bold,
              color: selectedTap == 1 ? Colors.black
              :const Color.fromARGB(255, 73, 71, 71)),
              ),
               if (selectedTap == 1) ...[
      

        Container(
          margin: EdgeInsets.only(
            top:5,
          ),
          width: 60,
          height: 2,
          color: Colors.black,
         
        ),
               ],
            
            ],
          )),
        GestureDetector(
          onTap: () {
        setState(() {
          selectedTap = 2;
        });
          },
          child: Column(
            children: [
              Text("Outstation",style: TextStyle(fontWeight: FontWeight.bold,color: selectedTap == 2 ? Colors.black 
              : const Color.fromARGB(255, 73, 71, 71),
              ),
              ),
               if (selectedTap == 2) ...[
      

        Container(
          margin: EdgeInsets.only(
            top:5,
          ),
          width: 90,
          height: 2,
          color: Colors.black,
        ),
               ],
            ],
          ),
          ),
        
            ],
          ),
),
              if(selectedTap == 0)
              
              Column(
                children: [
                    Container(
              margin: EdgeInsets.only(
                top: 10
              ),
              child: Row(
                         
                children: [
                  //dots
                 Container(
                  margin: EdgeInsets.only(
                      left: 20,
                      right: 15,
                  ),
                
                  child: Column(
                    children: [
                      //circle green dots
                    Container(
                      width: 10,
                      height: 10,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                  color: Colors.green,
                    ),
                    ),
                    //vertical line
                    Container(
              width: 1,
              height: 45,
              color: Colors.grey,
                    ),
                //------------red dotts---------------
                Container(
                      width: 10,
                      height: 10,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                  color: Colors.red,
                    ),
                    ),
                    ],
                  ),
                 ),
              
                 //current location
                Flexible(
  child: Column(
    children: [

      Container(
        padding: const EdgeInsets.only(
          right: 20,
        top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: dailypickupController,
             decoration: InputDecoration(
              hintText:  "Current Location",
             border: InputBorder.none           
                         ),
              
            ),

            const SizedBox(height: 15),

            const Divider(),

            const SizedBox(height: 15),

           TextField(
              controller: dailydestinationController,
             decoration: InputDecoration(
              hintText:  "Enter Location",
              border: InputBorder.none
             ),
              
            ),
          ],
        ),
      ),

     

    ],
  ),
  
),
                ],
            
              ),
              
           
            ),
            GestureDetector(
              onTap: () async {

  await saveRide(
    pickup: dailypickupController.text,
    destination: dailydestinationController.text,
    rideType: 'Daily',
  );

  if (!mounted) return;

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Bookanolacab(
        pickupLocation: dailypickupController.text,
        destinationLocation: dailydestinationController.text,
      ),
    ),
  );
},              child:Align(
  alignment: Alignment.centerLeft,
  child: SizedBox(
    width: 350,
    height: 100,
    child: Stack(
      children: [
        // BLACK CONTAINER
        Positioned(
          left: 20,
          top: 15,
          child: Container(
            width: 300,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.85),
              border: Border(
                left: BorderSide(
                  color: Colors.green,
                  width: 3,
                ),
                bottom: BorderSide(
                  color: Colors.green,
                  width: 3,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                     children: [
                      TextSpan(
                         text: "SEARCH ",
                        style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                     
                      ),
                      TextSpan(
                        text: "OLA CABS",
                        style: TextStyle(
                        color: const Color.fromARGB(255, 102, 223, 106),
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      )
                     ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ),
        ),

        // OLA CABS ON TOP, BUT FAINT
        Positioned(
          left: 40,
          top: 12,
          child: Center(
            child: Text(
              "OLA CABS",
              style: TextStyle(
                color: Colors.white.withOpacity(0.10),
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  ),
),
       
            )
        ],
              ),
           
           if(selectedTap == 1)
                 Column(
                children: [
                    Container(
              margin: EdgeInsets.only(
                top: 10
              ),
              child: Row(
                         
                children: [
                  //dots
                 Container(
                  margin: EdgeInsets.only(
                      left: 20,
                      right: 15,
                  ),
                
                  child: Column(
                    children: [
                      //circle green dots
                    Container(
                      width: 10,
                      height: 10,
                  margin: EdgeInsets.all(10),
                  
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                  color: Colors.green,
                    ),
                    ),
                    //vertical line
                    Container(
              width: 1,
              height: 45,
              color: Colors.grey,
                    ),
                //------------red dotts---------------
                Container(
                      width: 10,
                      height: 10,
                  margin: EdgeInsets.all(10),
                  
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                  color: Colors.red,
                    ),
                    ),
                    ],
                  ),
                 ),
              
                 //current location
                Expanded(
  child: Column(
    children: [

      Container(
        padding: const EdgeInsets.only(
          right: 20,
        top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
            controller:rentalpickupController,
             decoration: InputDecoration(
              hintText: "Current Location",
              border: InputBorder.none
             ),
             
            ),

            const SizedBox(height: 15),

            const Divider(),

            const SizedBox(height: 15),

            Row(
              children: [
                Icon(Icons.access_time,
                color:Color.fromARGB(255, 80, 78, 78),
                size:20,

                ),
                SizedBox(width: 8,),

                Expanded(
                  child: TextField(
                    controller: rentaldestinationController,
                               decoration: InputDecoration(
                                hintText: "Select Package",
                               ), 
                               
                              ),
                ),
              ],
            ),
          ],
        ),
      ),

     

    ],
  ),
  
),
                ],
            
              ),
              
           
            ),
        GestureDetector(
         onTap: () async {

  await saveRide(
    pickup: rentalpickupController.text,
    destination: rentaldestinationController.text,
    rideType: 'Rental',
  );

  if (!mounted) return;

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Bookanolacab(
        pickupLocation: rentalpickupController.text,
        destinationLocation: rentaldestinationController.text,
      ),
    ),
  );
},          child: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 350,
              height: 100,
              child: Stack(
                children: [
          // BLACK CONTAINER
          Positioned(
            left: 20,
            top: 15,
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.85),
                border: Border(
                  left: BorderSide(
                    color: Colors.green,
                    width: 3,
                  ),
                  bottom: BorderSide(
                    color: Colors.green,
                    width: 3,
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                       children: [
                        TextSpan(
                           text: "SEARCH ",
                          style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                       
                        ),
                        TextSpan(
                          text: "RENTAL CABS",
                          style: TextStyle(
                          color: const Color.fromARGB(255, 102, 223, 106),
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                        )
                       ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_right_alt,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // OLA CABS ON TOP, BUT FAINT
          Positioned(
            left: 40,
            top: 12,
            child: Center(
              child: Text(
                "OLA CABS",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.10),
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
                ],
              ),
            ),
          ),
        ),
         ],
              ),
        
        
         if(selectedTap == 2)
            Column(
                children: [
                    Container(
              margin: EdgeInsets.only(
                top: 10
              ),
              child: Row(
                         
                children: [
                  //dots
                 Container(
                  margin: EdgeInsets.only(
                      left: 20,
                      right: 15,
                  ),
                
                  child: Column(
                    children: [
                      //circle green dots
                    Container(
                      width: 10,
                      height: 10,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                  color: Colors.green,
                    ),
                    ),
                    //vertical line
                    Container(
              width: 1,
              height: 45,
              color: Colors.grey,
                    ),
                //------------red dotts---------------
                Container(
                      width: 10,
                      height: 10,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                  color: Colors.red,
                    ),
                    ),
                    ],
                  ),
                 ),
              
                 //current location
                Flexible(
  child: Column(
    children: [

      Container(
        padding: const EdgeInsets.only(
          right: 20,
        top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller:outstandingpickupController,
          decoration: InputDecoration(
            hintText:     "Current Location",
            border: InputBorder.none
          ),
             
            ),

            const SizedBox(height: 15),

            const Divider(),

            const SizedBox(height: 15),

            TextField(
              controller:outstandingdestinationController,
             decoration: InputDecoration(
              hintText: "Enter Location",
             ),
            ),
          ],
        ),
      ),

     

    ],
  ),
  
),
                ],
            
              ),
              
           
            ),
            GestureDetector(
         onTap: () async {

  await saveRide(
    pickup: outstandingpickupController.text,
    destination: outstandingdestinationController.text,
    rideType: 'Outstation',
  );

  if (!mounted) return;

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Bookanolacab(
        pickupLocation: outstandingpickupController.text,
        destinationLocation: outstandingdestinationController.text,
      ),
    ),
  );
},        child:Align(
  alignment: Alignment.centerLeft,
  child: SizedBox(
    width: 350,
    height: 100,
    child: Stack(
      children: [
        // BLACK CONTAINER
        Positioned(
          left: 20,
          top: 15,
          child: Container(
            width: 300,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.85),
              border: Border(
                left: BorderSide(
                  color: Colors.green,
                  width: 3,
                ),
                bottom: BorderSide(
                  color: Colors.green,
                  width: 3,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                     children: [
                      TextSpan(
                         text: "SEARCH ",
                        style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                     
                      ),
                      TextSpan(
                        text: "OUTSTATION CABS",
                        style: TextStyle(
                        color: const Color.fromARGB(255, 102, 223, 106),
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      )
                     ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ),
        ),

        // OLA CABS ON TOP, BUT FAINT
        Positioned(
          left: 40,
          top: 12,
          child: Center(
            child: Text(
              "OLA CABS",
              style: TextStyle(
                color: Colors.white.withOpacity(0.10),
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  ),
),
            ),
         ],
              ),
           
           
         
        
        
      ],
    );
  
  }
}