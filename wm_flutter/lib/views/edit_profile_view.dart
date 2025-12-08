import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wm_client/wm_client.dart';
import 'package:wm_flutter/core/spc_core.dart';
import 'package:wm_flutter/core/styles/color_styles.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _middleNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneController;

  User? _user;
  bool _isLoading = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _middleNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _phoneController = TextEditingController();
    _loadUserProfile();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _loadUserProfile() async {
    setState(() => _isLoading = true);
    try {
      final userInfoId = SpcCore.sessionManager.signedInUser?.id;
      if (userInfoId != null) {
        final user = await SpcCore.client.user.getUserByAuthId(userInfoId);
        if (user != null) {
          setState(() {
            _user = user;
            _firstNameController.text = user.firstName;
            _middleNameController.text = user.middleName;
            _lastNameController.text = user.lastName;
            _phoneController.text = user.phone ?? '';
          });
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error loading profile: $e')));
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);
    try {
      if (_user?.id != null) {
        await SpcCore.client.user.updateProfile(
          userId: _user!.id!,
          firstName: _firstNameController.text.trim(),
          middleName: _middleNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
        );

        // Update phone if changed
        if (_phoneController.text.trim() != (_user?.phone ?? '')) {
          await SpcCore.client.user.updatePhone(
            userId: _user!.id!,
            phone: _phoneController.text.trim(),
          );
        }

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Profile updated successfully!'),
              backgroundColor: AppColors.darkGreen,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
          Navigator.pop(
            context,
            true,
          ); // Return true to indicate profile was updated
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error saving profile: $e')));
      }
    } finally {
      setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
        backgroundColor: AppColors.darkGreen,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(children: [_buildProfileHeader(), _buildForm()]),
            ),
    );
  }

  Widget _buildProfileHeader() {
    final initials = _getInitials();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 4.h),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.darkGreen, AppColors.lightGreen],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
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
                    initials,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkGreen,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 20,
                    color: AppColors.darkGreen,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1.5.h),
          Text(
            SpcCore.email ?? 'No Email',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  String _getInitials() {
    final first = _firstNameController.text.isNotEmpty
        ? _firstNameController.text[0].toUpperCase()
        : '';
    final last = _lastNameController.text.isNotEmpty
        ? _lastNameController.text[0].toUpperCase()
        : '';
    return '$first$last'.isEmpty ? 'U' : '$first$last';
  }

  Widget _buildForm() {
    return Container(
      margin: EdgeInsets.all(5.w),
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Personal Information',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 0.5.h),
            Text(
              'Update your name and contact details',
              style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
            ),
            SizedBox(height: 3.h),
            _buildTextField(
              controller: _firstNameController,
              label: 'First Name',
              icon: Icons.person_outline,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'First name is required';
                }
                return null;
              },
            ),
            SizedBox(height: 2.h),
            _buildTextField(
              controller: _middleNameController,
              label: 'Middle Name',
              icon: Icons.person_outline,
              hintText: 'Optional',
            ),
            SizedBox(height: 2.h),
            _buildTextField(
              controller: _lastNameController,
              label: 'Last Name',
              icon: Icons.person_outline,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Last name is required';
                }
                return null;
              },
            ),
            SizedBox(height: 2.h),
            _buildTextField(
              controller: _phoneController,
              label: 'Phone Number',
              icon: Icons.phone_outlined,
              hintText: 'Optional',
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 4.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isSaving ? null : _saveProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkGreen,
                  padding: EdgeInsets.symmetric(vertical: 1.8.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: _isSaving
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        'Save Changes',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
            SizedBox(height: 2.h),
            // Email info (read-only)
            Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.grey[600], size: 20),
                  SizedBox(width: 3.w),
                  Expanded(
                    child: Text(
                      'Email address cannot be changed. Contact support if you need to update it.',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? hintText,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: (_) => setState(() {}), // Update initials as user types
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        prefixIcon: Icon(icon, color: Colors.grey[600]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.darkGreen, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
    );
  }
}
