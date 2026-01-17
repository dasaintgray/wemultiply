import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wm_client/wm_client.dart';
import 'package:wm_flutter/core/spc_core.dart';
import 'package:wm_flutter/core/styles/color_styles.dart';

class DeliveryAddressesView extends StatefulWidget {
  const DeliveryAddressesView({super.key});

  @override
  State<DeliveryAddressesView> createState() => _DeliveryAddressesViewState();
}

class _DeliveryAddressesViewState extends State<DeliveryAddressesView> {
  List<Addresses> _addresses = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAddresses();
  }

  Future<void> _loadAddresses() async {
    setState(() => _isLoading = true);
    try {
      final userInfoId = SpcCore.userId;
      if (userInfoId != null) {
        // Get the actual user from users table
        final user = await SpcCore.client.user.getOrCreateUser(userInfoId);
        if (user?.id != null) {
          final addresses = await SpcCore.client.address.getAddressesByUserId(
            user!.id!,
          );
          setState(() {
            _addresses = addresses;
            _isLoading = false;
          });
        } else {
          setState(() => _isLoading = false);
        }
      } else {
        setState(() => _isLoading = false);
      }
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error loading addresses: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        title: const Text('Delivery Addresses'),
        centerTitle: true,
        backgroundColor: AppColors.darkGreen,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      floatingActionButton: _addresses.length < 2
          ? FloatingActionButton.extended(
              onPressed: () => _showAddressForm(context),
              backgroundColor: AppColors.darkGreen,
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text(
                'Add Address',
                style: TextStyle(color: Colors.white),
              ),
            )
          : null,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _addresses.isEmpty
          ? _buildEmptyState()
          : _buildAddressList(),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_off_outlined, size: 80, color: Colors.grey[400]),
          SizedBox(height: 2.h),
          Text(
            'No delivery addresses yet',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            'Add your first delivery address',
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[500]),
          ),
          SizedBox(height: 3.h),
          ElevatedButton.icon(
            onPressed: () => _showAddressForm(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.darkGreen,
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.5.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text(
              'Add Address',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressList() {
    return ListView.builder(
      padding: EdgeInsets.all(4.w),
      itemCount: _addresses.length,
      itemBuilder: (context, index) {
        final address = _addresses[index];
        return _buildAddressCard(address);
      },
    );
  }

  Widget _buildAddressCard(Addresses address) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: address.isPrimary
            ? Border.all(color: AppColors.darkGreen, width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
            decoration: BoxDecoration(
              color: address.isPrimary
                  ? AppColors.primaryLight
                  : Colors.grey[100],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: address.isPrimary
                      ? AppColors.darkGreen
                      : Colors.grey[600],
                  size: 20,
                ),
                SizedBox(width: 2.w),
                Expanded(
                  child: Text(
                    address.label,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: address.isPrimary
                          ? AppColors.darkGreen
                          : Colors.grey[800],
                    ),
                  ),
                ),
                if (address.isPrimary)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.darkGreen,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Primary',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 18,
                      color: Colors.grey[600],
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      address.contactName,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.5.h),
                Row(
                  children: [
                    Icon(
                      Icons.phone_outlined,
                      size: 18,
                      color: Colors.grey[600],
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      address.contactPhone,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                Text(
                  '${address.street}, ${address.brgy}',
                  style: TextStyle(fontSize: 14.sp),
                ),
                Text(
                  '${address.city}, ${address.province} ${address.postalCode}',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                ),
                Text(
                  address.country,
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    if (!address.isPrimary)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => _setPrimary(address),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.darkGreen,
                            side: const BorderSide(color: AppColors.darkGreen),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Set as Primary'),
                        ),
                      ),
                    if (!address.isPrimary) SizedBox(width: 2.w),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () =>
                            _showAddressForm(context, address: address),
                        icon: const Icon(Icons.edit_outlined, size: 18),
                        label: const Text('Edit'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.grey[700],
                          side: BorderSide(color: Colors.grey[400]!),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 2.w),
                    IconButton(
                      onPressed: () => _confirmDelete(address),
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _setPrimary(Addresses address) async {
    try {
      final userInfoId = SpcCore.userId;
      if (userInfoId != null && address.id != null) {
        // Get the actual user from users table
        final user = await SpcCore.client.user.getOrCreateUser(userInfoId);
        if (user?.id != null) {
          await SpcCore.client.address.setPrimaryAddress(address.id!, user!.id!);
          _loadAddresses();
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  Future<void> _confirmDelete(Addresses address) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Address'),
        content: Text('Delete "${address.label}"?'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        final userInfoId = SpcCore.userId;
        if (userInfoId != null && address.id != null) {
          // Get the actual user from users table
          final user = await SpcCore.client.user.getOrCreateUser(userInfoId);
          if (user?.id != null) {
            await SpcCore.client.address.deleteAddress(address.id!, user!.id!);
            _loadAddresses();
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error: $e')));
        }
      }
    }
  }

  void _showAddressForm(BuildContext context, {Addresses? address}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          AddressFormSheet(address: address, onSaved: _loadAddresses),
    );
  }
}

class AddressFormSheet extends StatefulWidget {
  final Addresses? address;
  final VoidCallback onSaved;

  const AddressFormSheet({super.key, this.address, required this.onSaved});

  @override
  State<AddressFormSheet> createState() => _AddressFormSheetState();
}

class _AddressFormSheetState extends State<AddressFormSheet> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _labelController;
  late TextEditingController _contactNameController;
  late TextEditingController _contactPhoneController;
  late TextEditingController _streetController;
  late TextEditingController _brgyController;
  late TextEditingController _cityController;
  late TextEditingController _provinceController;
  late TextEditingController _postalCodeController;
  late TextEditingController _countryController;
  bool _isPrimary = false;
  bool _isLoading = false;
  bool _isGettingLocation = false;
  double? _latitude;
  double? _longitude;

  bool get _isEditing => widget.address != null;

  @override
  void initState() {
    super.initState();
    _labelController = TextEditingController(text: widget.address?.label ?? '');
    _contactNameController = TextEditingController(
      text: widget.address?.contactName ?? '',
    );
    _contactPhoneController = TextEditingController(
      text: widget.address?.contactPhone ?? '',
    );
    _streetController = TextEditingController(
      text: widget.address?.street ?? '',
    );
    _brgyController = TextEditingController(text: widget.address?.brgy ?? '');
    _cityController = TextEditingController(text: widget.address?.city ?? '');
    _provinceController = TextEditingController(
      text: widget.address?.province ?? '',
    );
    _postalCodeController = TextEditingController(
      text: widget.address?.postalCode ?? '',
    );
    _countryController = TextEditingController(
      text: widget.address?.country ?? 'Philippines',
    );
    _isPrimary = widget.address?.isPrimary ?? false;
    _latitude = widget.address?.latitude;
    _longitude = widget.address?.longitude;
  }

  Future<void> _getCurrentLocation() async {
    setState(() => _isGettingLocation = true);
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Location services are disabled. Please enable them.'),
            ),
          );
        }
        return;
      }

      // Check and request permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Location permission denied.')),
            );
          }
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Location permissions are permanently denied.'),
            ),
          );
        }
        return;
      }

      // Get current position
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      setState(() {
        _latitude = position.latitude;
        _longitude = position.longitude;
      });

      // Get address from coordinates and auto-fill fields
      await _fillAddressFromCoordinates(position.latitude, position.longitude);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Location detected and address filled!'),
            backgroundColor: AppColors.darkGreen,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error getting location: $e')),
        );
      }
    } finally {
      setState(() => _isGettingLocation = false);
    }
  }

  Future<void> _fillAddressFromCoordinates(double lat, double lng) async {
    try {
      final placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty && mounted) {
        final place = placemarks.first;
        setState(() {
          if (_streetController.text.isEmpty && place.street != null) {
            _streetController.text = place.street!;
          }
          if (_brgyController.text.isEmpty && place.subLocality != null) {
            _brgyController.text = place.subLocality!;
          }
          if (_cityController.text.isEmpty && place.locality != null) {
            _cityController.text = place.locality!;
          }
          if (_provinceController.text.isEmpty && place.administrativeArea != null) {
            _provinceController.text = place.administrativeArea!;
          }
          if (_postalCodeController.text.isEmpty && place.postalCode != null) {
            _postalCodeController.text = place.postalCode!;
          }
          if (place.country != null) {
            _countryController.text = place.country!;
          }
        });
      }
    } catch (e) {
      debugPrint('Error getting address from coordinates: $e');
    }
  }

  @override
  void dispose() {
    _labelController.dispose();
    _contactNameController.dispose();
    _contactPhoneController.dispose();
    _streetController.dispose();
    _brgyController.dispose();
    _cityController.dispose();
    _provinceController.dispose();
    _postalCodeController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4.w),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _isEditing ? 'Edit Address' : 'Add New Address',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(4.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabelChips(),
                    SizedBox(height: 2.h),
                    // Get Location Button
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: _isGettingLocation ? null : _getCurrentLocation,
                        icon: _isGettingLocation
                            ? const SizedBox(
                                height: 18,
                                width: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppColors.darkGreen,
                                ),
                              )
                            : const Icon(Icons.my_location),
                        label: Text(
                          _isGettingLocation ? 'Getting Location...' : 'Use Current Location',
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.darkGreen,
                          padding: EdgeInsets.symmetric(vertical: 1.5.h),
                          side: const BorderSide(color: AppColors.darkGreen),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    if (_latitude != null && _longitude != null) ...[
                      SizedBox(height: 1.h),
                      Container(
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                          color: AppColors.primaryLight,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: AppColors.darkGreen,
                              size: 18,
                            ),
                            SizedBox(width: 2.w),
                            Expanded(
                              child: Text(
                                'GPS: ${_latitude!.toStringAsFixed(6)}, ${_longitude!.toStringAsFixed(6)}',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.darkGreen,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    SizedBox(height: 2.h),
                    _buildTextField(
                      _contactNameController,
                      'Contact Name',
                      Icons.person_outline,
                      true,
                    ),
                    SizedBox(height: 2.h),
                    _buildTextField(
                      _contactPhoneController,
                      'Contact Phone',
                      Icons.phone_outlined,
                      true,
                      TextInputType.phone,
                    ),
                    SizedBox(height: 2.h),
                    _buildTextField(
                      _streetController,
                      'Street Address',
                      Icons.home_outlined,
                      true,
                    ),
                    SizedBox(height: 2.h),
                    _buildTextField(
                      _brgyController,
                      'Barangay',
                      Icons.location_city_outlined,
                      true,
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: _buildTextField(
                            _cityController,
                            'City',
                            null,
                            true,
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Expanded(
                          child: _buildTextField(
                            _postalCodeController,
                            'Postal',
                            null,
                            true,
                            TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    _buildTextField(
                      _provinceController,
                      'Province',
                      Icons.map_outlined,
                      true,
                    ),
                    SizedBox(height: 2.h),
                    _buildTextField(
                      _countryController,
                      'Country',
                      Icons.public,
                      false,
                    ),
                    SizedBox(height: 2.h),
                    SwitchListTile(
                      value: _isPrimary,
                      onChanged: (v) => setState(() => _isPrimary = v),
                      title: const Text('Set as Primary Address'),
                      subtitle: const Text('Default delivery address'),
                      activeThumbColor: AppColors.darkGreen,
                      contentPadding: EdgeInsets.zero,
                    ),
                    SizedBox(height: 3.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _saveAddress,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.darkGreen,
                          padding: EdgeInsets.symmetric(vertical: 1.8.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: _isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                _isEditing ? 'Update Address' : 'Save Address',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabelChips() {
    final labels = ['Home', 'Work', 'Office', 'Other'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Address Label',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 1.h),
        Wrap(
          spacing: 8,
          children: labels.map((label) {
            final isSelected = _labelController.text == label;
            return ChoiceChip(
              label: Text(label),
              selected: isSelected,
              onSelected: (selected) =>
                  setState(() => _labelController.text = selected ? label : ''),
              selectedColor: AppColors.primaryLight,
              labelStyle: TextStyle(
                color: isSelected ? AppColors.darkGreen : Colors.grey[700],
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            );
          }).toList(),
        ),
        if (_labelController.text == 'Other' ||
            (!labels.contains(_labelController.text) &&
                _labelController.text.isNotEmpty))
          Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: _buildTextField(
              _labelController,
              'Custom Label',
              null,
              true,
            ),
          ),
      ],
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData? icon,
    bool required, [
    TextInputType? keyboardType,
  ]) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: required
          ? (v) => v?.isEmpty == true ? 'Required' : null
          : null,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon != null ? Icon(icon, color: Colors.grey[600]) : null,
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
        filled: true,
        fillColor: Colors.grey[50],
      ),
    );
  }

  Future<void> _saveAddress() async {
    debugPrint('=== _saveAddress called ===');

    if (!_formKey.currentState!.validate()) {
      debugPrint('Form validation failed');
      return;
    }
    if (_labelController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an address label')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      // Get the auth user info ID first
      final userInfoId = SpcCore.userId;
      debugPrint('userInfoId: $userInfoId');
      if (userInfoId == null) throw Exception('User not logged in');

      // Get the actual user from users table (or create if not exists)
      final user = await SpcCore.client.user.getOrCreateUser(userInfoId);
      debugPrint('User from users table: ${user?.id}');
      if (user?.id == null) throw Exception('Failed to get user profile');

      final now = DateTime.now();
      final address = Addresses(
        id: widget.address?.id,
        userId: user!.id!,  // Use the actual user ID from users table
        label: _labelController.text,
        contactName: _contactNameController.text,
        contactPhone: _contactPhoneController.text,
        street: _streetController.text,
        brgy: _brgyController.text,
        city: _cityController.text,
        province: _provinceController.text,
        postalCode: _postalCodeController.text,
        country: _countryController.text.isEmpty
            ? 'Philippines'
            : _countryController.text,
        latitude: _latitude,
        longitude: _longitude,
        isPrimary: _isPrimary,
        createdAt: widget.address?.createdAt ?? now,
        updatedAt: now,
      );

      debugPrint('Saving address with userId: ${address.userId}');

      if (_isEditing) {
        debugPrint('Updating existing address...');
        await SpcCore.client.address.updateAddress(address);
      } else {
        debugPrint('Adding new address...');
        await SpcCore.client.address.addAddress(address);
      }

      debugPrint('Address saved successfully!');
      widget.onSaved();
      if (mounted) Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}
