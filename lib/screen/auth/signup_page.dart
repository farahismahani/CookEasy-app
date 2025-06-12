import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordHidden = true;

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
            Text(
              'Register',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
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
              togglePassword: () {
                setState(() => isPasswordHidden = !isPasswordHidden);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFBCE7D6),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: Text('Login'),
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
            icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility),
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
