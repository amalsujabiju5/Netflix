// import 'package:amazon/core/constants.dart';
// import 'package:amazon/presentation/widgets/app_bar_widget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class SearchIdleWidget extends StatelessWidget {
//   const SearchIdleWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(50),
//         child: AppBarWidget(title: "Find"),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             kheight,
//             Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: CupertinoTextField(
//                       padding: const EdgeInsets.all(13),
//                       placeholder: 'Actor, title, or genre',
//                       placeholderStyle: TextStyle(color: Colors.grey),
//                       prefix: const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Icon(
//                           CupertinoIcons.search,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       clearButtonMode: OverlayVisibilityMode.editing,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 15),
//             Row(
//               children: const [
//                 Padding(padding: EdgeInsets.all(10)),
//                 Text(
//                   "Genres",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 23,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),

//             // Buttons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   width: 150,
//                   height: 57,
//                   decoration:
//                       BoxDecoration(borderRadius: BorderRadius.circular(1)),
//                   child: MaterialButton(
//                     padding: const EdgeInsets.only(left: 2),
//                     onPressed: () {},
//                     color: Color.fromARGB(255, 64, 72, 75),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: const Text(
//                       "Action and Adventure",
//                       style: TextStyle(
//                           color: Colors.white, fontStyle: FontStyle.italic),
//                     ),
//                   ),
//                 ),

//                 // Add spacing between buttons
//                 Container(
//                   width: 150,
//                   height: 57,
//                   decoration:
//                       BoxDecoration(borderRadius: BorderRadius.circular(1)),
//                   child: MaterialButton(
//                     padding: const EdgeInsets.only(left: 2),
//                     onPressed: () {},
//                     color: Color.fromARGB(255, 64, 72, 75),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: const Text(
//                       "Anime",
//                       style: TextStyle(
//                           color: Colors.white, fontStyle: FontStyle.italic),
//                     ),
//                   ),
//                 ),

//                 ///second row
//               ],
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   width: 150,
//                   height: 57,
//                   decoration:
//                       BoxDecoration(borderRadius: BorderRadius.circular(1)),
//                   child: MaterialButton(
//                     padding: const EdgeInsets.only(left: 2),
//                     onPressed: () {},
//                     color: Color.fromARGB(255, 64, 72, 75),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: const Text(
//                       "Comedy",
//                       style: TextStyle(
//                           color: Colors.white, fontStyle: FontStyle.italic),
//                     ),
//                   ),
//                 ),

//                 // Add spacing between buttons
//                 Container(
//                   width: 150,
//                   height: 57,
//                   decoration:
//                       BoxDecoration(borderRadius: BorderRadius.circular(1)),
//                   child: MaterialButton(
//                     padding: const EdgeInsets.only(left: 2),
//                     onPressed: () {},
//                     color: Color.fromARGB(255, 64, 72, 75),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: const Text(
//                       "Documentary",
//                       style: TextStyle(
//                           color: Colors.white, fontStyle: FontStyle.italic),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 15),
//             // third row
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   width: 150,
//                   height: 57,
//                   decoration:
//                       BoxDecoration(borderRadius: BorderRadius.circular(1)),
//                   child: MaterialButton(
//                     padding: const EdgeInsets.only(left: 2),
//                     onPressed: () {},
//                     color: Color.fromARGB(255, 64, 72, 75),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: const Text(
//                       "Drama",
//                       style: TextStyle(
//                           color: Colors.white, fontStyle: FontStyle.italic),
//                     ),
//                   ),
//                 ),

//                 // Add spacing between buttons
//                 Container(
//                   width: 150,
//                   height: 57,
//                   decoration:
//                       BoxDecoration(borderRadius: BorderRadius.circular(1)),
//                   child: MaterialButton(
//                     padding: const EdgeInsets.only(left: 2),
//                     onPressed: () {},
//                     color: Color.fromARGB(255, 64, 72, 75),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: const Text(
//                       "Fantasy",
//                       style: TextStyle(
//                           color: Colors.white, fontStyle: FontStyle.italic),
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             //fourth row
//             const SizedBox(height: 15),
//             // third row
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   width: 150,
//                   height: 57,
//                   decoration:
//                       BoxDecoration(borderRadius: BorderRadius.circular(1)),
//                   child: MaterialButton(
//                     padding: const EdgeInsets.only(left: 2),
//                     onPressed: () {},
//                     color: Color.fromARGB(255, 64, 72, 75),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: const Text(
//                       "Horror",
//                       style: TextStyle(
//                           color: Colors.white, fontStyle: FontStyle.italic),
//                     ),
//                   ),
//                 ),

//                 // Add spacing between buttons
//                 Container(
//                   width: 150,
//                   height: 57,
//                   decoration:
//                       BoxDecoration(borderRadius: BorderRadius.circular(1)),
//                   child: MaterialButton(
//                     padding: const EdgeInsets.only(left: 2),
//                     onPressed: () {},
//                     color: Color.fromARGB(255, 64, 72, 75),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: const Text(
//                       "International",
//                       style: TextStyle(
//                           color: Colors.white, fontStyle: FontStyle.italic),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
