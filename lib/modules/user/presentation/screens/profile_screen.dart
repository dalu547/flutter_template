import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/app_di.dart';
import '../../../authentication/domain/entities/login_entity.dart';
import '../viewmodels/profile_state.dart';
import '../viewmodels/profile_viewmodel.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final profileCubit = instance<ProfileViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')), // Dynamic Title
      body: BlocProvider(
        create: (context) => profileCubit..fetchUserProfile(),
        child: BlocBuilder<ProfileViewModel, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              return _buildProfile(state.user);
            } else if (state is ProfileError) {
              return Center(child: Text(state.error.message));
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildProfile(LoginEntity user) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(user.image),
              ),
            ),
            SizedBox(height: 16),

            // User's Name
            Text(
              "${user.firstName} ${user.lastName}",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            // Username
            Text(
              "@${user.username}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),

            SizedBox(height: 16),

            // Profile Details in a Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildProfileRow(Icons.email, "Email", user.email),
                    _buildProfileRow(Icons.person, "Gender", user.gender),
                    _buildProfileRow(
                        Icons.account_circle, "Username", user.username),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// Helper function to create profile rows
  Widget _buildProfileRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          SizedBox(width: 10),
          Expanded(
            flex: 2, // Allows flexible space for the title
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            flex: 3, // Ensures the value doesn't overflow
            child: Text(
              value,
              style: TextStyle(fontSize: 16, color: Colors.black87),
              overflow: TextOverflow.ellipsis, // Prevents overflow
              softWrap: true, // Allows wrapping if needed
              maxLines: 1, // Keeps text in a single line
            ),
          ),
        ],
      ),
    );
  }
}
