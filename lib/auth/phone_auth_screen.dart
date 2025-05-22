import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:country_pickers/country_pickers.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  // State variables
  Country _selectedCountry = CountryPickerUtils.getCountryByPhoneCode('1');
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();
  String _verificationId = '';
  bool _isLoading = false;
  String? _errorMessage;

  // Firebase auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Clean up controllers
  @override
  void dispose() {
    _phoneController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _verifyPhoneNumber() async {
    if (_phoneController.text.isEmpty) {
      setState(() => _errorMessage = 'Please enter a phone number');
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: '+${_selectedCountry.phoneCode}${_phoneController.text}',
        verificationCompleted: _onVerificationCompleted,
        verificationFailed: _onVerificationFailed,
        codeSent: _onCodeSent,
        codeAutoRetrievalTimeout: _onCodeAutoRetrievalTimeout,
        timeout: const Duration(seconds: 60),
      );
    } catch (e) {
      _handleError(e);
    }
  }

  void _onVerificationCompleted(PhoneAuthCredential credential) async {
    try {
      await _auth.signInWithCredential(credential);
      Navigator.pushReplacementNamed(context, '/swipe');
    } catch (e) {
      _handleError(e);
    }
  }

  void _onVerificationFailed(FirebaseAuthException e) {
    _handleError(e);
  }

  void _onCodeSent(String verificationId, int? resendToken) {
    setState(() {
      _verificationId = verificationId;
      _isLoading = false;
    });
  }

  void _onCodeAutoRetrievalTimeout(String verificationId) {
    setState(() => _isLoading = false);
  }

  Future<void> _signInWithCode() async {
    setState(() => _isLoading = true);

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: _codeController.text,
      );
      await _auth.signInWithCredential(credential);
      Navigator.pushNamed(context, '/interests');
    } catch (e) {
      _handleError(e);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _handleError(dynamic error) {
    setState(() {
      _isLoading = false;
      _errorMessage = error is FirebaseAuthException
          ? error.message ?? 'Authentication failed'
          : 'An error occurred';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phone Authentication')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Phone input section
              _buildPhoneInput(),
              const SizedBox(height: 16),

              // OTP input (visible after code is sent)
              if (_verificationId.isNotEmpty) _buildOtpInput(),

              // Error message
              if (_errorMessage != null)
                Text(_errorMessage!, style: TextStyle(color: Colors.red)),

              const SizedBox(height: 16),

              // Submit button
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneInput() => Row(
        children: [
          CountryPickerDropdown(
            initialValue: 'US',
            itemBuilder: _buildDropdownItem,
            onValuePicked: (Country country) {
              setState(() => _selectedCountry = country);
            },
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                prefixText: '+${_selectedCountry.phoneCode} ',
              ),
            ),
          ),
        ],
      );

  Widget _buildOtpInput() => Column(
        children: [
          const SizedBox(height: 16),
          TextField(
            controller: _codeController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Verification Code',
            ),
          ),
        ],
      );

  Widget _buildSubmitButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: _isLoading
              ? null
              : _verificationId.isEmpty
                  ? _verifyPhoneNumber
                  : _signInWithCode,
          child: _isLoading
              ? const CircularProgressIndicator()
              : Text(_verificationId.isEmpty
                  ? 'Verify Phone Number'
                  : 'Submit Code'),
        ),
      );

  Widget _buildDropdownItem(Country country) => Row(
        children: [
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(width: 8),
          Text('+${country.phoneCode}'),
          const SizedBox(width: 8),
          Flexible(child: Text(country.name)),
        ],
      );
}
