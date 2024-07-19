import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:harman_app/blocs/auth/auth_cubit.dart';
import 'package:harman_app/core/auth/login_api.dart';
import 'package:harman_app/core/router/app_routes.dart';
import 'package:harman_app/gen/assets.gen.dart';
import 'package:harman_app/models/user/user_model.dart';

class LoginScreenContent extends StatelessWidget {
  const LoginScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Assets.logo.logo.image(width: 400),
            ),
            const Gap(150),
            const Text(
              'Welcome to Harman App',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const Gap(32),
            ElevatedButton(
              onPressed: () async {
                GoogleSignInAccount? user = await LoginApi.login();
                if (context.mounted && user != null) {
                  context.read<AuthCubit>().authenticated(
                        UserModel(
                          email: user.email,
                          displayName: user.displayName,
                          id: user.id,
                          photoUrl: user.photoUrl,
                        ),
                      );
                  GoRouter.of(context).pushReplacementNamed(AppRoutes.profileScreen);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Assets.logo.googleLogo.image(
                        fit: BoxFit.scaleDown,
                        width: 30,
                      ),
                      const Gap(6),
                      const Text(
                        'Login with Google',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_sharp,
                    color: Colors.black,
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
