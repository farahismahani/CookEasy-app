import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordHidden = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEEFE2),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/auth-chef-hat.png', height: 100),
            SizedBox(height: 20),
            Text('Register', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
            _buildTextField(
              icon: 'assets/images/icons8-username-24.png',
              hint: 'Username',
              controller: usernameController,
            ),
            SizedBox(height: 16),
            _buildTextField(
              icon: 'assets/images/icons8-email-30.png',
              hint: 'Email',
              controller: emailController,
            ),
            SizedBox(height: 16),
            _buildTextField(
              icon: 'assets/images/icons8-password-30.png',
              hint: 'Password',
              controller: passwordController,
              obscureText: isPasswordHidden,
              isPassword: true,
              togglePassword: () => setState(() => isPasswordHidden = !isPasswordHidden),
            ),
            SizedBox(height: 20),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () async {
                setState(() => isLoading = true);
                try {
                  final email = emailController.text.trim();
                  final password = passwordController.text.trim();
                  final username = usernameController.text.trim();

                  UserCredential userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );

                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(userCredential.user!.uid)
                      .set({
                    'email': email,
                    'username': username,
                    'created_at': FieldValue.serverTimestamp(),
                  });

                  Navigator.pushReplacementNamed(context, '/dashboard');
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Registration failed: ${e.toString()}')),
                  );
                } finally {
                  setState(() => isLoading = false);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFBCE7D6),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String icon,
    required String hint,
    required TextEditingController controller,
    bool obscureText = false,
    bool isPassword = false,
    VoidCallback? togglePassword,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFBCE7D6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(icon, width: 24, height: 24),
          ),
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
            onPressed: togglePassword,
          )
              : null,
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
