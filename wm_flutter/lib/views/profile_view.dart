import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wm_flutter/core/spc_core.dart';
import 'package:wm_flutter/core/styles/color_styles.dart';
import 'package:wm_flutter/views/menu_view.dart';
import 'package:wm_flutter/views/delivery_addresses_view.dart';
import 'package:wm_flutter/views/edit_profile_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _sessionManager = SpcCore.sessionManager;

  String get _userName => _sessionManager.signedInUser?.userName ?? 'Guest User';
  String get _email => _sessionManager.signedInUser?.email ?? 'No Email';
  String get _referralCode => _sessionManager.signedInUser?.userName?.toUpperCase() ?? 'N/A';

  // QR Code contains the referral code for easy sharing
  String get _qrData => 'wemultiply://referral/$_referralCode';

  // Stats
  int _referralsCount = 0;
  double _totalEarnings = 0.0;
  int _ordersCount = 0;
  bool _isLoadingStats = true;

  @override
  void initState() {
    super.initState();
    _loadStats();
  }

  Future<void> _loadStats() async {
    if (!mounted) return;
    setState(() => _isLoadingStats = true);

    try {
      final userId = SpcCore.userId;
      if (userId != null) {
        // First get the user from our users table
        final user = await SpcCore.client.user.getOrCreateUser(userId);
        if (user?.id != null) {
          final stats = await SpcCore.client.user.getUserStats(user!.id!);
          if (mounted) {
            setState(() {
              _referralsCount = stats['referrals'] as int? ?? 0;
              _totalEarnings = (stats['earnings'] as num?)?.toDouble() ?? 0.0;
              _ordersCount = stats['orders'] as int? ?? 0;
            });
          }
        }
      }
    } catch (e) {
      debugPrint('Error loading stats: $e');
    } finally {
      if (mounted) {
        setState(() => _isLoadingStats = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
        backgroundColor: AppColors.forest,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              // Navigate to settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header with gradient
            _buildProfileHeader(theme),

            // QR Code Section
            _buildQRCodeSection(theme),

            // Stats Section
            _buildStatsSection(theme),

            // Menu Options
            _buildMenuOptions(theme),

            // Sign Out Button
            _buildSignOutButton(theme),

            SizedBox(height: 4.h),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(ThemeData theme) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.forest, AppColors.forestMid, AppColors.emerald],
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      child: Column(
        children: [
          SizedBox(height: 2.h),
          // Profile Avatar
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
            ),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Text(
                _userName.isNotEmpty ? _userName[0].toUpperCase() : 'G',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: AppColors.darkGreen),
              ),
            ),
          ),
          SizedBox(height: 1.5.h),
          // Name
          Text(
            _userName,
            style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 0.5.h),
          // Email
          Text(_email, style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white.withValues(alpha: 0.9))),
          SizedBox(height: 1.h),
          // Member Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 18),
                const SizedBox(width: 6),
                Text(
                  'Active Member',
                  style: theme.textTheme.bodySmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(height: 3.h),
        ],
      ),
    );
  }

  Widget _buildQRCodeSection(ThemeData theme) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 15, offset: const Offset(0, 5))],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('My Referral QR Code', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              IconButton(
                icon: const Icon(Icons.share_outlined, color: AppColors.darkGreen),
                onPressed: _shareQRCode,
              ),
            ],
          ),
          SizedBox(height: 2.h),
          // QR Code
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
            ),
            child: SizedBox(
              width: 200,
              height: 200,
              child: PrettyQrView.data(
                data: _qrData,
                decoration: const PrettyQrDecoration(
                  shape: PrettyQrSmoothSymbol(color: AppColors.darkGreen),
                  image: PrettyQrDecorationImage(
                    image: AssetImage('assets/pngs/logo3.png'),
                    position: PrettyQrDecorationImagePosition.embedded,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 2.h),
          // Referral Code
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Code: ', style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.darkGreen)),
                Text(
                  _referralCode,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkGreen,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: _copyReferralCode,
                  child: const Icon(Icons.copy, size: 20, color: AppColors.darkGreen),
                ),
              ],
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            'Share your code to earn rewards!',
            style: theme.textTheme.bodySmall?.copyWith(color: AppColors.primaryTextInfo),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection(ThemeData theme) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        children: [
          _buildStatCard(
            theme,
            icon: Icons.people_outline,
            value: _isLoadingStats ? '...' : '$_referralsCount',
            label: 'Referrals',
            color: AppColors.darkBlue,
          ),
          SizedBox(width: 3.w),
          _buildStatCard(
            theme,
            icon: Icons.account_balance_wallet_outlined,
            value: _isLoadingStats ? '...' : '₱${_totalEarnings.toStringAsFixed(2)}',
            label: 'Earnings',
            color: AppColors.darkGreen,
          ),
          SizedBox(width: 3.w),
          _buildStatCard(
            theme,
            icon: Icons.shopping_bag_outlined,
            value: _isLoadingStats ? '...' : '$_ordersCount',
            label: 'Orders',
            color: AppColors.lightBlue,
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    ThemeData theme, {
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 2)),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: color.withValues(alpha: 0.1), shape: BoxShape.circle),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: color),
            ),
            const SizedBox(height: 2),
            Text(label, style: theme.textTheme.bodySmall?.copyWith(color: AppColors.primaryTextInfo)),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuOptions(ThemeData theme) {
    return Container(
      margin: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 2))],
      ),
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.person_outline,
            title: 'Edit Profile',
            subtitle: 'Update your name and details',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const EditProfileView()));
            },
          ),
          _buildMenuDivider(),
          _buildMenuItem(
            icon: Icons.location_on_outlined,
            title: 'Delivery Addresses',
            subtitle: 'Manage your delivery addresses',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const DeliveryAddressesView()));
            },
          ),
          _buildMenuDivider(),
          _buildMenuItem(
            icon: Icons.account_tree_outlined,
            title: 'My Network',
            subtitle: 'View your downlines',
            onTap: () {},
          ),
          _buildMenuDivider(),
          _buildMenuItem(icon: Icons.history, title: 'Transaction History', onTap: () {}),
          _buildMenuDivider(),
          _buildMenuItem(icon: Icons.payment, title: 'Payment Methods', onTap: () {}),
          _buildMenuDivider(),
          _buildMenuItem(icon: Icons.help_outline, title: 'Help & Support', onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(10)),
        child: Icon(icon, color: AppColors.darkGreen, size: 22),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: subtitle != null
          ? Text(subtitle, style: TextStyle(color: AppColors.primaryTextInfo, fontSize: 12))
          : null,
      trailing: const Icon(Icons.chevron_right, color: AppColors.primaryTextInfo),
      onTap: onTap,
    );
  }

  Widget _buildMenuDivider() {
    return Divider(height: 1, indent: 70, endIndent: 20, color: Colors.grey.withValues(alpha: 0.2));
  }

  Widget _buildSignOutButton(ThemeData theme) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: _signOut,
        icon: const Icon(Icons.logout, color: AppColors.dangerColor),
        label: const Text('Sign Out', style: TextStyle(color: AppColors.dangerColor)),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          side: const BorderSide(color: AppColors.dangerColor),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  void _copyReferralCode() {
    Clipboard.setData(ClipboardData(text: _referralCode));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Referral code copied!'),
        backgroundColor: AppColors.darkGreen,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _shareQRCode() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Share feature coming soon!'),
        backgroundColor: AppColors.darkGreen,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _signOut() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              _sessionManager.signOutDevice();
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const MenuView()),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.dangerColor),
            child: const Text('Sign Out', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
