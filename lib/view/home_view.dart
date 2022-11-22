import 'package:apps/componets/components.dart';

import 'package:apps/home.dart';

import 'package:flutter/material.dart';

Expanded card() {
  return Expanded(
    child: isFirstLoadRunning
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            controller: controller,
            itemCount: listofHive.length,
            itemBuilder: (BuildContext context, i) {
              return Card(
                elevation: 18,
                child: cardlist(
                    language: listofHive[i].language == null
                        ? '.'
                        : listofHive[i].language,
                    number1: listofHive[i].number1 == null
                        ? 0
                        : listofHive[i].number1,
                    number2: listofHive[i].number1,
                    substitle: listofHive[i].substitle,
                    title: listofHive[i].title.toString()),
              );
            }),
  );
}
