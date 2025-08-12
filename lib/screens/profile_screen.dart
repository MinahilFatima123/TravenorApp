import 'package:flutter/material.dart';
import '../screens/edit_screen.dart';
import 'package:travelapp/widgets/custom_appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/signin_screen.dart';
import '../screens/bookmark_screen.dart';
import '../models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}



class _ProfileScreenState extends State<ProfileScreen> {
  String? userName;
  String? userEmail;


  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    print('Current user UID: $user');
    if (user != null) {
      setState(() {
        userName = AppData.name ?? '';
        userEmail = AppData.email ?? '';
      });
    }

  }

  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();


    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: const Text(
            'Are you sure you want to log out from your account?',
            style: TextStyle(fontSize: 16),
          ),
          actionsPadding: const EdgeInsets.only(right: 12, bottom: 8),
          actionsAlignment: MainAxisAlignment.end,
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey[700],
              ),
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text(
                'Yes',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );

    // If user pressed "Yes"
    if (shouldLogout == true) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);




      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const SignInScreen()),
            (route) => false,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profile',
        showBackButton: false,
        actions: [
          // Existing edit icon
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfileScreen(),
                ),
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/png/Ellipse 674.png',
                  width: 44,
                  height: 44,
                  color: Colors.grey.shade100,
                ),
                Image.asset('assets/png/Edit.png', width: 24, height: 24),
              ],
            ),
          ),

          const SizedBox(width: 8), // Space between icons

          // Logout button
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            onPressed: () => _logout(context),
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage('assets/png/profile_image.png'),
              ),
            ),

            SizedBox(height: screenHeight * 0.0099),

              Text(
                userName ?? '',

                style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.0049),
            Text(
              userEmail ?? '',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),



            SizedBox(height: screenHeight * 0.0369),
            Container(
              width: 335,
              height: 78,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Reward Points',
                          style: Theme.of(context).textTheme.displaySmall!
                              .copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        SizedBox(height: screenHeight * 0.0123),

                        Text(
                          '360',
                          style: Theme.of(context).textTheme.displaySmall!
                              .copyWith(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ),

                  Container(width: 1, height: 78, color: Colors.grey.shade300),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Travel Trips',
                          style: Theme.of(context).textTheme.displaySmall!
                              .copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        SizedBox(height: screenHeight * 0.0123),

                        Text(
                          '238',
                          style: Theme.of(context).textTheme.displaySmall!
                              .copyWith(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ),

                  Container(width: 1, height: 78, color: Colors.grey.shade300),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Bucket List',
                          style: Theme.of(context).textTheme.displaySmall!
                              .copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        SizedBox(height: screenHeight * 0.0123),

                        Text(
                          '473',
                          style: Theme.of(context).textTheme.displaySmall!
                              .copyWith(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.0370),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset('assets/png/profile_home.png'),
                    ),
                    title: Text(
                      'Profile',
                      style: Theme.of(
                        context,
                      ).textTheme.displaySmall!.copyWith(fontSize: 16),
                    ),
                    trailing: Icon(Icons.chevron_right, color: Colors.grey),
                    onTap: () {},
                  ),
                  Divider(height: 1, color: Colors.grey[200]),
                  ListTile(
                    leading: SizedBox(
                      width: 20,
                      height: 20,
                      child: Image.asset(
                        'assets/png/bookmark.png',
                        color: Colors.grey,
                      ),
                    ),
                    title: Text(
                      'Bookmarked',
                      style: Theme.of(
                        context,
                      ).textTheme.displaySmall!.copyWith(fontSize: 16),
                    ),
                    trailing: Icon(Icons.chevron_right, color: Colors.grey),
                    onTap: () {   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BookmarkedPlacesScreen(),
                      ),
                    );},
                  ),
                  Divider(height: 1, color: Colors.grey[200]),
                  ListTile(
                    leading: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset('assets/png/trip_profile.png'),
                    ),
                    title: Text(
                      'Previous Trips',
                      style: Theme.of(
                        context,
                      ).textTheme.displaySmall!.copyWith(fontSize: 16),
                    ),
                    trailing: Icon(Icons.chevron_right, color: Colors.grey),
                    onTap: () {},
                  ),
                  Divider(height: 1, color: Colors.grey[200]),
                  ListTile(
                    leading: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset('assets/png/Settings.png'),
                    ),
                    title: Text(
                      'Settings',
                      style: Theme.of(
                        context,
                      ).textTheme.displaySmall!.copyWith(fontSize: 16),
                    ),
                    trailing: Icon(Icons.chevron_right, color: Colors.grey),
                    onTap: () {},
                  ),
                  Divider(height: 1, color: Colors.grey[200]),
                  ListTile(
                    leading: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset('assets/png/Version_profile.png'),
                    ),
                    title: Text(
                      'Version',
                      style: Theme.of(
                        context,
                      ).textTheme.displaySmall!.copyWith(fontSize: 16),
                    ),

                    trailing: Icon(Icons.chevron_right, color: Colors.grey),
                    onTap: () {},
                  ),
                  Divider(height: 1, color: Colors.grey[200]),



                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
