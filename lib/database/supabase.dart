// import 'package:flutter/material.dart';


// Class _SupabaseTestScreenState extends State<SupabaseTestScreen> {
//   String _message = "Testing Supabase...";

//   @override
//   void initState() {
//     super.initState();
//     _testSupabase();
//   }

//   Future<void> _testSupabase() async {
//     try {
//       // Try signing up a new user to test connection
//       final AuthResponse response = await Supabase.instance.client.auth.signUp(
//         email: 'testuser@example.com', // Test email
//         password: 'password123', // Test password
//       );

//       if (response.user != null) {
//         // Sign-up success
//         setState(() {
//           _message = "Supabase Initialized and Sign-Up Successful!";
//         });
//       } else if (response.error != null) {
//         // Supabase returned an error
//         setState(() {
//           _message = "Supabase Error: ${response.error!.message}";
//         });
//       }
//     } catch (error) {
//       // Handle any other exceptions
//       setState(() {
//         _message = "Supabase Initialization Failed: $error";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Supabase Test"),
//       ),
//       body: Center(
//         child: Text(_message),
//       ),
//     );
//   }
// }

// extension on AuthResponse {
//   get error => null;
// }
