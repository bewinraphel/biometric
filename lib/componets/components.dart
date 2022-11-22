import 'package:flutter/material.dart';

import '../utils/constraits.dart';

class cardlist extends StatelessWidget {
  dynamic title;
  dynamic substitle;
  dynamic language;
  dynamic number1;
  dynamic number2;
  cardlist(
      {Key? key,
      this.language,
      this.number1,
      this.number2,
      this.substitle,
      this.title})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 9,
      child: SizedBox(
        height: 79,
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.book,
                  size: 40,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    title!,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    substitle!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                  ),
                  Row(children: [
                    Text(
                      language!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                    ),
                    const sizedbox10(),
                    const Icon(Icons.bug_report_outlined),
                    const sizedbox10(),
                    Text(number1.toString()),
                    const sizedbox10(),
                    const Icon(Icons.face),
                    const sizedbox10(),
                    Text(number2.toString()),
                  ])
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }
}
