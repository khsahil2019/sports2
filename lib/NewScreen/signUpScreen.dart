// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sports2/NewScreen/signinScreen.dart';
// import 'package:sports2/helper/theme.dart';

// import '../AuthScreen/signIn.dart';

// class SignUpScreen extends StatefulWidget {
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _obscureText = true;
//   final lightGrey = Colors.grey[300]!;
//   final socialIconList = [
//     'assets/img/google_logo.png',
//     'assets/img/facebook_logo.png',
//     'assets/img/twitter_logo.png',
//   ];
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white, // Dark white background
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text(
//               'Sign Up to Create Account',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 20.0,
//                 // fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//         backgroundColor: Colors.white, // Orange app bar
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 50,
//               ),
//               Text(
//                 'Email', // Heading for Email field
//                 style: TextStyle(
//                   fontSize: 16.0,

//                   color: Colors.black, // Set the color for the heading text
//                 ),
//               ),
//               SizedBox(height: 8),
//               Material(
//                 elevation: 5.0,
//                 shadowColor: Colors.grey,
//                 borderRadius: BorderRadius.circular(15.0),
//                 child: TextFormField(
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                     hintText: 'Enter your email',
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.orange,
//                         width: 2.0,
//                       ),
//                       borderRadius: BorderRadius.circular(15.0),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: AppColors.orange,
//                         width: 2.0,
//                       ),
//                       borderRadius: BorderRadius.circular(15.0),
//                     ),
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//                   ),
//                 ),
//               ),

//               SizedBox(height: 20),
//               Text(
//                 'Password',
//                 style: TextStyle(
//                   fontSize: 16.0,
//                   color: Colors.black,
//                 ),
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Material(
//                 elevation: 5.0,
//                 shadowColor: Colors.grey,
//                 borderRadius: BorderRadius.circular(15.0),
//                 child: TextFormField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//                     hintText: 'Enter your password',
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: AppColors.orange, // Border color when focused
//                         width: 2.0,
//                       ),
//                       borderRadius: BorderRadius.circular(15.0),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.orange, // Border color when not focused
//                         width: 2.0,
//                       ),
//                       borderRadius: BorderRadius.circular(15.0),
//                     ),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _obscureText ? Icons.visibility : Icons.visibility_off,
//                         color: Colors.grey, // Icon color
//                       ),
//                       onPressed: () {
//                         // Toggle password visibility
//                         setState(() {
//                           _obscureText = !_obscureText;
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//               ),

//               SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       'By creating an account, I accept the terms & conditions',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ), // Text for the checkbox
//                 ],
//               ),

//               SizedBox(
//                 height: 40,
//               ),

//               GestureDetector(
//                 onTap: () {
//                   // Your logic here
//                 },
//                 child: Container(
//                   height: 50,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black54,
//                         offset: Offset(0, 4),
//                         blurRadius: 10.0,
//                       ),
//                     ],
//                   ),
//                   child: Material(
//                     color: AppColors.orange,
//                     borderRadius: BorderRadius.circular(8.0),
//                     elevation: 10.0,
//                     child: Center(
//                       child: Text(
//                         'Create an account',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18.0,
//                           // fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//               SizedBox(
//                 height: 30,
//               ),

//               Row(
//                 children: [
//                   Expanded(
//                     child: Material(
//                       elevation:
//                           2, // Adjust the elevation for the highlight effect
//                       child: Container(
//                         height: 1,
//                         color: Colors.grey, // Color of the line
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     child: Text(
//                       'or continue with',
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Material(
//                       elevation:
//                           2, // Adjust the elevation for the highlight effect
//                       child: Container(
//                         height: 1,
//                         color: Colors.grey, // Color of the line
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: List.generate(
//                   3,
//                   (index) => Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Transform(
//                       transform: Matrix4.identity()
//                         ..setEntry(3, 2, 0.01) // Depth
//                         ..rotateX(0.1) // X-Axis rotation
//                         ..rotateY(0.1),
//                       child: CircleAvatar(
//                         backgroundColor: lightGrey,
//                         radius: 25,
//                         child: Image.asset(
//                           socialIconList[index],
//                           width: 30,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Already have an account ?',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 12.0,
//                       // fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Get.to(() => SignInScreen());
//                     },
//                     child: Text(
//                       ' Sign in',
//                       style: TextStyle(
//                         color: AppColors.orange, //
//                         fontSize: 14.0,
//                         // fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ), // Add space
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
