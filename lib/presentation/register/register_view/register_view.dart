import 'package:best_ui_design_flutter/presentation/resources/color_manager.dart';
import 'package:best_ui_design_flutter/presentation/resources/routes_manager.dart';
import 'package:best_ui_design_flutter/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      // appBar: appBarWidget(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Lottie.asset("assets/lottie_images/create_account.json",
                    width: 300, height: 320),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 37),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                      color: ColorManager.primary),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.person,
                    ),
                    prefixIconColor: ColorManager.primary,
                    labelText: "UserName",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: ColorManager.grey1, width: 2)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                    prefixIconColor: ColorManager.primary,
                    labelText: "Email",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: ColorManager.grey1, width: 2)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isVisible,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: isVisible
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                    prefixIconColor: ColorManager.primary,
                    suffixIconColor: ColorManager.primary,
                    labelText: "Password",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: ColorManager.grey1, width: 2)),
                  ),
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: Text(
                    "by signing up you agree to all our privacy policy and user agreements",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: AppPadding.p14,
                    left: AppPadding.p16,
                    right: AppPadding.p16),
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorManager.primary),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(color: ColorManager.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("already have account.."),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.loginRoute);
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(color: ColorManager.primary),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
