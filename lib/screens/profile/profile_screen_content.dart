import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:harman_app/blocs/auth/auth_cubit.dart';
import 'package:harman_app/core/auth/login_api.dart';
import 'package:harman_app/core/router/app_routes.dart';
import 'package:harman_app/models/user/user_model.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

class ProfileScreenContent extends StatefulWidget {
  const ProfileScreenContent({super.key});

  @override
  State<ProfileScreenContent> createState() => _ProfileScreenContentState();
}

class _ProfileScreenContentState extends State<ProfileScreenContent> {
  UserModel? user;

  @override
  void initState() {
    user = context.read<AuthCubit>().state.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(60),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    user?.photoUrl ?? '',
                    width: 150,
                    errorBuilder: (context, err, ___) {
                      return const CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 80,
                        child: Icon(Icons.person,size: 100,),
                      );
                    },
                  ),
                ),
                const Gap(40),
                Text(
                  'Welcome ${user?.displayName ?? '-'} !',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                const Gap(12),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Nama : ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              user?.displayName ?? '-',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        const Gap(12),
                        Row(
                          children: [
                            const Text(
                              'Email : ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              user?.email ?? '-',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () async {
                    GoogleSignInAccount? user = await LoginApi.signOut();
                    if (user == null && context.mounted) {
                      context.read<AuthCubit>().signOut();
                      GoRouter.of(context).go(AppRoutes.loginScreen);
                    }
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      Gap(12),
                      Text(
                        'Logout',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const Gap(6),
                ElevatedButton(
                  onPressed: () {
                  GoRouter.of(context).pushNamed(AppRoutes.qrScreen);
                  },
                  child: const Text(
                    'Login Aplikasi',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const Gap(6),
                ElevatedButton(
                  onPressed: () {
                    checkAuthLocal(context);
                  },
                  child: const Row(
                    children: [
                      Text(
                        'Go to calendar',
                        style: TextStyle(color: Colors.black),
                      ),
                      Gap(12),
                      Icon(
                        Icons.arrow_forward_sharp,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkAuthLocal(BuildContext context) async {
    final LocalAuthentication auth = LocalAuthentication();
    // ···
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    if (canAuthenticate) {
      final List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();

      if (availableBiometrics.isNotEmpty) {
        try {
          final bool didAuthenticate = await auth.authenticate(
              authMessages: [
                const  AndroidAuthMessages(
                  signInTitle: 'Lakukan Verifikasi',
                  biometricHint: '',
                  cancelButton: 'Batalkan',
                  biometricRequiredTitle: 'Letakkan sidik jari anda',
                  biometricNotRecognized: 'Sidik jari Salah',
                ),
              ],
              localizedReason: 'Verifikasi diperlukan untuk mengakses fitur');
          if (didAuthenticate && context.mounted) {
            GoRouter.of(context).pushNamed(AppRoutes.calendarScreen);
          }
        } on PlatformException {
          // ...
        }
      }
    }
  }
}
