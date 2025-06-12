import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  bool isPasswordHidden = true;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              'Login',
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
              icon: 'assets/images/icons8-password-30.png',
              hint: 'Password',
              controller: passwordController,
              obscureText: isPasswordHidden,
              isPassword: true,
              togglePassword: () {
                setState(() {
                  isPasswordHidden = !isPasswordHidden;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (val) {
                        setState(() => rememberMe = val ?? false);
                      },
                    ),
                    Text('Remember Me'),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Forgotten Password?'),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFBCE7D6),
                padding: EdgeInsets.all(14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: Icon(Icons.arrow_forward),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text('Register'),
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
