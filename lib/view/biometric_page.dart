import 'package:apps/data/baseApiService.dart';
import 'package:apps/data/network/local_auth_api.dart';
import 'package:apps/data/networkApissevice.dart';
import 'package:apps/utils/constraits.dart';

import 'package:apps/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class biometric extends StatefulWidget {
  const biometric({Key? key}) : super(key: key);

  @override
  State<biometric> createState() => _biometricState();
}

class _biometricState extends State<biometric> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade400,
        toolbarHeight: 100,
        elevation: 14,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(70),
                bottomLeft: Radius.circular(70))),
        title: Text(
          'BIOMETRIC',
        ),
        actions: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(blurRadius: 7, spreadRadius: 3, color: Colors.pink)
                ], shape: BoxShape.circle, color: Colors.pink.shade400),
                child: Icon(
                  Icons.search,
                  size: 20,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(blurRadius: 7, spreadRadius: 3, color: Colors.pink)
                ], shape: BoxShape.circle, color: Colors.pink.shade400),
                child: Icon(
                  Icons.notifications,
                  size: 20,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(blurRadius: 7, spreadRadius: 3, color: Colors.pink)
                ], shape: BoxShape.circle, color: Colors.pink.shade400),
                child: Icon(
                  Icons.logout,
                  size: 20,
                ),
              ),
              SizedBox(
                width: 26,
              )
            ],
          )
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 40, right: 40, top: 150, bottom: 150),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
                bottomLeft: Radius.circular(60),
                topRight: Radius.circular(60)),
          ),
          elevation: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: InkWell(
                  onTap: () async {
                    final isauthenticate = await LocalAuthApi.authenticate();
                    if (isauthenticate) {
                      Navigator.pushNamed(context, Routesname.home);
                    } else
                      Utils.flushBarErrorMessange(
                          "GO TO SETTING AND ADD FINGERPRINT", context);
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffE3EDF7),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[500]!,
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: const Offset(4, 4),
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            blurRadius: 15,
                            spreadRadius: 1,
                            offset: Offset(-4, -4),
                          ),
                        ]),
                    child: Icon(
                      Icons.fingerprint_sharp,
                      size: 180,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
