import 'package:flutter/material.dart';
import '../components/custom_icon.dart';
import '../components/custom_text_field.dart';
import 'create_account_bottom_sheet.dart';

// ignore: must_be_immutable
class LoginBottomSheet extends StatefulWidget {
  LoginBottomSheet({super.key});

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool obscureText1 = true;
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Welcome back!!'),
                subtitle: const Text(
                  'Login',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.close_sharp,
                    color: Colors.red,
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: emailController,
                hintText: 'info@examole.com',
                labelText: 'Username/email',
                obscureText: obscureText1,
                suffixIcon: IconButton(
                  icon: Icon(obscureText1
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined),
                  onPressed: () {
                    obscureText1 = !obscureText1;
                    setState(() {});
                  },
                ),
                validator: _emailValidator,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: passwordController,
                labelText: 'password',
                obscureText: obscureText,
                suffixIcon: IconButton(
                  icon: Icon(obscureText
                      ? Icons.lock_outline
                      : Icons.lock_open_rounded),
                  onPressed: () {
                    obscureText = !obscureText;
                    setState(() {});
                  },
                ),
                validator: _passwordValidator,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                          value: value,
                          onChanged: (value1) {
                            value = !value;
                            setState(() {});
                          }),
                      const Text(
                        'remember me',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Forget password?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              CustomIconButton(
                color: Colors.black,
                text: 'Login',
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                },
                colorText: Colors.yellow,
                width: 300,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  //
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.yellow.shade100,
                            context: context,
                            builder: (context) => CreateAccountBottomSheet());
                      },
                      child: const Text('Register',
                          style: TextStyle(color: Colors.red, fontSize: 15)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  String? _emailValidator(String? value) {
    final emailValid = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (value == null || value.isEmpty) {
      return "Please enter an email address";
    } else if (!emailValid.hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a password";
    } else if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    return null;
  }
}
