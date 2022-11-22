import 'package:flutter/material.dart';

class sizedbox10 extends StatelessWidget {
  const sizedbox10({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 10,
    );
  }
}

Container alldatafetched() {
  return Container(
    padding: const EdgeInsets.only(top: 30, bottom: 40),
    color: Colors.black,
    child: const Center(
      child: Text(
        'You have fetched all of the content',
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
