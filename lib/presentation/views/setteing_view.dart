import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:scan_canser_detection/controllers/auth/auth_cubit.dart';
import 'package:scan_canser_detection/core/extentions/extentions.dart';
import 'package:scan_canser_detection/core/helper/cach_data.dart';
import 'package:scan_canser_detection/core/utils/router/app_router.dart';

import '../../core/widgets/responsive_padding.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _pushNotifications = true;
  bool _emailNotifications = false;
  bool _darkMode = false;
  bool _dataSharing = true;
  String _name = "John Doe";
  String _email = "john@cancerdetection.com";

  void _showEditProfileSheet() {
    final nameController = TextEditingController(text: _name);
    final emailController = TextEditingController(text: _email);

    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _name = nameController.text;
                  _email = emailController.text;
                });
                Navigator.pop(context);
              },
              child: const Text('Save Changes'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _confirmLogout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<AuthCubit>().signOut();
              // CacheData.clearData(clearData: true);
              GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
            },
            child: const Text('Log Out'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ResponsivePadding(
          child: Column(
            children: [
              ProfileSection(
                name: _name,
                email: _email,
                imageUrl:
                    "https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659652_640.png",
                onEditPressed: _showEditProfileSheet,
              ),
              SectionCard(
                children: [
                  const SectionTitle(title: "Notifications"),
                  SettingsSwitch(
                    title: "Push Notifications",
                    icon: Icons.notifications,
                    value: _pushNotifications,
                    onChanged: (value) =>
                        setState(() => _pushNotifications = value),
                  ),
                  SettingsSwitch(
                    title: "Email Notifications",
                    icon: Icons.email,
                    value: _emailNotifications,
                    onChanged: (value) =>
                        setState(() => _emailNotifications = value),
                  ),
                ],
              ),
              SectionCard(
                children: [
                  const SectionTitle(title: "App Preferences"),
                  SettingsNavigationItem(
                    title: "App Language",
                    icon: Icons.language,
                    value: "English",
                    onTap: () {
                      // Add language selection logic
                    },
                  ),
                ],
              ),
              SectionCard(
                children: [
                  const SectionTitle(title: "Privacy & Security"),
                  SettingsSwitch(
                    title: "Data Sharing",
                    icon: Icons.security,
                    value: _dataSharing,
                    onChanged: (value) => setState(() => _dataSharing = value),
                  ),
                  SettingsNavigationItem(
                    title: "Privacy Policy",
                    icon: Icons.privacy_tip,
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kPrivacyandpolicy);
                    },
                  ),
                  SettingsNavigationItem(
                    title: "Teams Members",
                    icon: Icons.description,
                    onTap: () {
                  GoRouter.of(context).push(AppRouter.kTeamsView);
                    },
                  ),
                ],
              ),
              LogoutButton(onPressed: _confirmLogout),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  final String name;
  final String email;
  final String imageUrl;
  final VoidCallback onEditPressed;

  const ProfileSection({
    super.key,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(imageUrl),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    email,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: onEditPressed,
            ),
          ],
        ),
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final List<Widget> children;
  const SectionCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: children,
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}

class SettingsSwitch extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool value;
  final Function(bool)? onChanged;

  const SettingsSwitch({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      secondary: Icon(icon),
      value: value,
      onChanged: onChanged,
    );
  }
}

class SettingsNavigationItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? value;
  final VoidCallback? onTap;

  const SettingsNavigationItem({
    super.key,
    required this.title,
    required this.icon,
    this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (value != null)
            Text(
              value!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          const Icon(Icons.chevron_right),
        ],
      ),
      onTap: onTap,
    );
  }
}

class LogoutButton extends StatelessWidget {
  final VoidCallback onPressed;
  const LogoutButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: context.theme.colorScheme.error,
            foregroundColor: context.theme.colorScheme.onError,
          ),
          onPressed: onPressed,
          child: const Text("Log Out"),
        ),
      ),
    );
  }
}
