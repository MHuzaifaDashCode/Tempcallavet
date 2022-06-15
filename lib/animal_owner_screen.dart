import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tempcallavet/Account/account_screen.dart';
import 'package:tempcallavet/Providers/user_provider.dart';
import 'package:tempcallavet/Screens/login/login_screen.dart';
import 'package:tempcallavet/constants.dart';
import 'package:tempcallavet/model/user_model.dart';
import 'package:provider/provider.dart';
import 'common_widget/category_card.dart';



class AnimalOwner extends StatefulWidget {
  var id;

  AnimalOwner({this.id});
  

  
  @override
  State<AnimalOwner> createState() => _AnimalOwnerState();
}

class _AnimalOwnerState extends State<AnimalOwner> {

  /// Obj of UserProvider Class


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: AnimalOwnerNavHomeScreen(),
    );
  }
}


class AnimalOwnerNavHomeScreen extends StatefulWidget{

  const AnimalOwnerNavHomeScreen({Key? key}) : super(key: key);
 
  @override
  State<AnimalOwnerNavHomeScreen> createState() => _AnimalOwnerNavHomeScreenState();
}

class _AnimalOwnerNavHomeScreenState extends State<AnimalOwnerNavHomeScreen> {



  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // User? user = FirebaseAuth.instance.currentUser;
  // UserModel loggedInUser = UserModel();
  // var roleHome;
  // var emaill;
  // var idAnimal;
  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseFirestore.instance
  //       .collection("users") //.where('uid', isEqualTo: user!.uid)
  //       .doc(user!.uid)
  //       .get()
  //       .then((value) {
  //     this.loggedInUser = UserModel.fromMap(value.data());
  //   }).whenComplete(() {
  //     CircularProgressIndicator();
  //     setState(() {
  //       emaill = loggedInUser.email.toString();
  //       roleHome = loggedInUser.role.toString();
  //       idAnimal = loggedInUser.uid.toString();
  //     });
  //   });
  // }


  GlobalKey<CurvedNavigationBarState> _navkey = GlobalKey();


  var pagesAll = [AnimalHomeScreen(), AccountScreen()];


  
  int myIndex = 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(

        bottomNavigationBar: CurvedNavigationBar(

        key: _navkey,
        color: kShadowColor,
        buttonBackgroundColor: kPrimaryColor,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        height: 60,
        items: [

      Icon((myIndex == 0) ? Icons.home_outlined : Icons.home),
      Icon((myIndex == 1) ? Icons.perm_identity: Icons.perm_contact_cal_outlined),


        ],


        onTap: (index){
          setState(() {
            myIndex = index;
          });

        },      
      ),
    body: pagesAll[myIndex],
    );
  }
}

class AnimalHomeScreen extends StatefulWidget {
  @override
  State<AnimalHomeScreen> createState() => _AnimalHomeScreenState();
}

class _AnimalHomeScreenState extends State<AnimalHomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset("assets/images/menu.png"),
                    ),
                  ),
                  Text(
                    "WELCOME \nANIMAL OWNER\n\n\n\n\n\n",

                  ),
                 
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Make Appointment",
                          img: "assets/images/schedule2.png",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Track The vet",
                          img: "assets/images/track2.png",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Payment Method",
                          img: "assets/images/payment-method2.png",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Animal Detail",
                          img: "assets/images/animal detail2.png",
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}




class UserDetails {
  final String providerDetails;
  final String userName;
  final String userEmail;
  final String userRole;
  final List<ProviderDetails> providerData;
  UserDetails(this.providerDetails, this.userName, this.userEmail,
      this.userRole, this.providerData);
}

class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}




// class AnimalOwner extends StatefulWidget {
//   String id;
//   AnimalOwner({required this.id});
//   @override
//   _AnimalOwnerState createState() => _AnimalOwnerState(id: id);
// }

// class _AnimalOwnerState extends State<AnimalOwner> {
//   String id;
//   var roleAnimalOwner;
//   var emaill;
//   UserModel loggedInUser = UserModel();

//   _AnimalOwnerState({required this.id});
//   @override
//   void initState() {
//     super.initState();
//     FirebaseFirestore.instance
//         .collection("users") //.where('uid', isEqualTo: user!.uid)
//         .doc(id)
//         .get()
//         .then((value) {
//       this.loggedInUser = UserModel.fromMap(value.data());
//     }).whenComplete(() {
//       CircularProgressIndicator();
//       setState(() {
//         emaill = loggedInUser.email.toString();
//         roleAnimalOwner = loggedInUser.role.toString();
//         id = loggedInUser.uid.toString();
//       });
//     });
//   }

//   @override
//   final Stream<QuerySnapshot> _usersStream =
//       FirebaseFirestore.instance.collection('posts').snapshots();
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Vet",
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               logout(context);
//             },
//             icon: Icon(Icons.logout),
//           ),
//         ],
//       ),
//       body: StreamBuilder(
//         stream: _usersStream,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text("something is wrong");
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           return Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: ListView.builder(
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (_, index) {
//                 return GestureDetector(
//                   onTap: () {},
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 4,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                           left: 3,
//                           right: 3,
//                         ),
//                         child: ListTile(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             side: BorderSide(
//                               color: Colors.black,
//                             ),
//                           ),
//                           title: Text(
//                             snapshot.data!.docChanges[index].doc['title'],
//                             style: TextStyle(
//                               fontSize: 20,
//                             ),
//                           ),
//                           contentPadding: EdgeInsets.symmetric(
//                             vertical: 12,
//                             horizontal: 16,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Future<void> logout(BuildContext context) async {
//     CircularProgressIndicator();
//     await FirebaseAuth.instance.signOut();

//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(
//         builder: (context) => LoginScreen(),
//       ),
//     );
//   }
// }































// class Vet extends StatefulWidget {
//   String id;
//   Vet({required this.id});
//   @override
//   _VetState createState() => _VetState(id: id);
// }

// class _VetState extends State<Vet> {
//   String id;
//   var roleStudent;
//   var emaill;
//   UserModel loggedInUser = UserModel();

//   _VetState({required this.id});
//   @override
//   void initState() {
//     super.initState();
//     FirebaseFirestore.instance
//         .collection("users") //.where('uid', isEqualTo: user!.uid)
//         .doc(id)
//         .get()
//         .then((value) {
//       this.loggedInUser = UserModel.fromMap(value.data());
//     }).whenComplete(() {
//       CircularProgressIndicator();
//       setState(() {
//         emaill = loggedInUser.email.toString();
//         roleStudent = loggedInUser.role.toString();
//         id = loggedInUser.uid.toString();
//       });
//     });
//   }

//   @override
//   final Stream<QuerySnapshot> _usersStream =
//       FirebaseFirestore.instance.collection('posts').snapshots();
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Vet",
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               logout(context);
//             },
//             icon: Icon(Icons.logout),
//           ),
//         ],
//       ),
//       body: StreamBuilder(
//         stream: _usersStream,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text("something is wrong");
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           return Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: ListView.builder(
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (_, index) {
//                 return GestureDetector(
//                   onTap: () {},
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 4,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                           left: 3,
//                           right: 3,
//                         ),
//                         child: ListTile(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             side: BorderSide(
//                               color: Colors.black,
//                             ),
//                           ),
//                           title: Text(
//                             snapshot.data!.docChanges[index].doc['title'],
//                             style: TextStyle(
//                               fontSize: 20,
//                             ),
//                           ),
//                           contentPadding: EdgeInsets.symmetric(
//                             vertical: 12,
//                             horizontal: 16,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }


// }



// class AnimalOwner extends StatefulWidget {
//   String id;
//   AnimalOwner({required this.id});
//   @override
//   _AnimalOwnerState createState() => _AnimalOwnerState(id: id);
// }

// class _AnimalOwnerState extends State<AnimalOwner> {
//   String id;
//   var roleAnimalOwner;
//   var emaill;
//   UserModel loggedInUser = UserModel();

//   _AnimalOwnerState({required this.id});
//   @override
//   void initState() {
//     super.initState();
//     FirebaseFirestore.instance
//         .collection("users") //.where('uid', isEqualTo: user!.uid)
//         .doc(id)
//         .get()
//         .then((value) {
//       this.loggedInUser = UserModel.fromMap(value.data());
//     }).whenComplete(() {
//       CircularProgressIndicator();
//       setState(() {
//         emaill = loggedInUser.email.toString();
//         roleAnimalOwner = loggedInUser.role.toString();
//         id = loggedInUser.uid.toString();
//       });
//     });
//   }

//   @override
//   final Stream<QuerySnapshot> _usersStream =
//       FirebaseFirestore.instance.collection('posts').snapshots();
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Vet",
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               logout(context);
//             },
//             icon: Icon(Icons.logout),
//           ),
//         ],
//       ),
//       body: StreamBuilder(
//         stream: _usersStream,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text("something is wrong");
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           return Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: ListView.builder(
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (_, index) {
//                 return GestureDetector(
//                   onTap: () {},
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 4,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                           left: 3,
//                           right: 3,
//                         ),
//                         child: ListTile(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             side: BorderSide(
//                               color: Colors.black,
//                             ),
//                           ),
//                           title: Text(
//                             snapshot.data!.docChanges[index].doc['title'],
//                             style: TextStyle(
//                               fontSize: 20,
//                             ),
//                           ),
//                           contentPadding: EdgeInsets.symmetric(
//                             vertical: 12,
//                             horizontal: 16,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Future<void> logout(BuildContext context) async {
//     CircularProgressIndicator();
//     await FirebaseAuth.instance.signOut();

//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(
//         builder: (context) => LoginScreen(),
//       ),
//     );
//   }
// }
