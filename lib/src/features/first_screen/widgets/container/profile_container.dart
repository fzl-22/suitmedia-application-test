import 'dart:ui';
import 'package:flutter/material.dart';

/// ProfileContainer Class
///
/// The `ProfileContainer` feature-specific widget of a profile container
/// with glass effect based on [CircularProgressIndicator].
class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 30,
            sigmaY: 30,
          ),
          child: Container(
            width: 116,
            height: 116,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 58,
              backgroundColor: Colors.transparent,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              child: const Icon(
                Icons.person_add_alt_1,
                size: 36,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
