import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:scan_canser_detection/controllers/auth/auth_cubit.dart';
import 'package:scan_canser_detection/core/constants/app_cach_data.dart';
import 'package:scan_canser_detection/core/constants/constans.dart';
import 'package:scan_canser_detection/core/extentions/extentions.dart';
import 'package:scan_canser_detection/core/helper/cach_data.dart';
import 'package:scan_canser_detection/core/localization/app_localizations.dart';
import 'package:scan_canser_detection/core/localization/language/language_cubit.dart';
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
  bool darkMode = false;
  bool _dataSharing = true;
  String _name = CacheData.getData(key: AppCacheData.userName);
  String _email = CacheData.getData(key: AppCacheData.email);

  void _showLanguageSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context).translate('select_language')),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('العربية'),
              onTap: () {
                context
                    .read<LanguageCubit>()
                    .changeLanguage(const Locale('ar'));
                Navigator.pop(context);
              },
              trailing: context.read<LanguageCubit>().state.languageCode == 'ar'
                  ? const Icon(Icons.check, color: Colors.deepOrange)
                  : null,
            ),
            ListTile(
              title: const Text('English'),
              onTap: () {
                context
                    .read<LanguageCubit>()
                    .changeLanguage(const Locale('en'));
                Navigator.pop(context);
              },
              trailing: context.read<LanguageCubit>().state.languageCode == 'en'
                  ? const Icon(Icons.check, color: Colors.deepOrange)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

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
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).translate('name'),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).translate('email'),
                border: const OutlineInputBorder(),
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
              child:
                  Text(AppLocalizations.of(context).translate('save_changes')),
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
        title: Text(AppLocalizations.of(context).translate('logout')),
        content:
            Text(AppLocalizations.of(context).translate('logout_confirmation')),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context).translate('cancel')),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<AuthCubit>().signOut();
              // CacheData.clearData(clearData: true);
              GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
            },
            child: Text(AppLocalizations.of(context).translate('logout')),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LanguageCubit>().state;
    final isArabic = locale.languageCode == 'ar';

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('settings')),
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
                  SectionTitle(
                      title: AppLocalizations.of(context)
                          .translate('notifications')),
                  SettingsSwitch(
                    title: AppLocalizations.of(context)
                        .translate('push_notifications'),
                    icon: Icons.notifications,
                    value: _pushNotifications,
                    onChanged: (value) =>
                        setState(() => _pushNotifications = value),
                  ),
                  SettingsSwitch(
                    title: AppLocalizations.of(context)
                        .translate('email_notifications'),
                    icon: Icons.email,
                    value: _emailNotifications,
                    onChanged: (value) =>
                        setState(() => _emailNotifications = value),
                  ),
                ],
              ),
              SectionCard(
                children: [
                  SectionTitle(
                      title: AppLocalizations.of(context)
                          .translate('app_preferences')),
                  SettingsNavigationItem(
                    title:
                        AppLocalizations.of(context).translate('app_language'),
                    icon: Icons.language,
                    value: context.read<LanguageCubit>().languageName,
                    onTap: () {
                      _showLanguageSelectionDialog(context);
                    },
                  ),
                ],
              ),
              SectionCard(
                children: [
                  SectionTitle(
                      title: AppLocalizations.of(context).translate('account')),
                  SettingsSwitch(
                    title:
                        AppLocalizations.of(context).translate('data_sharing'),
                    icon: Icons.security,
                    value: _dataSharing,
                    onChanged: (value) => setState(() => _dataSharing = value),
                  ),
                  SettingsNavigationItem(
                    title: AppLocalizations.of(context)
                        .translate('privacy_policy'),
                    icon: Icons.privacy_tip,
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kPrivacyandpolicy);
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
    final locale = context.watch<LanguageCubit>().state;
    final isArabic = locale.languageCode == 'ar';

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Align(
        alignment: isArabic ? Alignment.centerRight : Alignment.centerLeft,
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
    final locale = context.watch<LanguageCubit>().state;
    final isArabic = locale.languageCode == 'ar';

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
          Icon(isArabic ? Icons.chevron_left : Icons.chevron_right),
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
          child: Text(AppLocalizations.of(context).translate('logout')),
        ),
      ),
    );
  }
}
