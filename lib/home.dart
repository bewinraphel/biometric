import 'package:apps/componets/components.dart';
import 'package:apps/data/network/hive/hive_function.dart';
import 'package:apps/model/hive_model.dart';
import 'package:apps/utils/constraits.dart';
import 'package:apps/view/home_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'data/networkApissevice.dart';
import 'model/network_model_list.dart';
import 'package:http/http.dart' as http;

List<DatasLists> datas = [];
List<hivemodelList> listofHive = [];

int page = 10;
late ScrollController controller;
// There is next page or not
bool _hasNextPage = true;

bool isFirstLoadRunning = false;

bool isLoadMoreRunning = false;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _firstLoad() async {
    print("first load called");
    setState(() {
      isFirstLoadRunning = true;
    });
    try {
      final d = await getapi(
          "https://api.github.com/users/JakeWharton/repos?page=0&per_page=$page");
      setState(() {
        datas = d;
        listofHive = datas
            .map((e) => hivemodelList(
                language: e.language,
                number1: e.watchersCount,
                number2: e.watchersCount,
                substitle: e.name,
                title: e.id))
            .toList();
        add.instance.addHiveList(listofHive);
      });
    } catch (err) {
      print('no internet');
      await add.instance.getdata();
      if (listofHive.isEmpty) {
        print("no data");
        setState(() {
          isFirstLoadRunning = false;
        });
      } else {
        print("no internet so calling data from database");
        setState(() {
          isFirstLoadRunning = false;
          listofHive;
        });
      }
    }
    setState(() {
      isFirstLoadRunning = false;
    });
  }

  ///loaaaaading
  void _loadMore() async {
    print("LODA MORE CALLED");
    if (_hasNextPage == true &&
        isFirstLoadRunning == false &&
        isLoadMoreRunning == false &&
        controller.position.extentAfter < 200) {
      setState(() {
        isLoadMoreRunning = true;
      });
      page += 15;

      try {
        final response = await http.get(Uri.parse(
            'https://api.github.com/users/JakeWharton/repos?page=_page&per_page=$page'));
        List<DatasLists> get = parsedDataList(response.body);
        print("no of get . ${get.length}");
        if (get.length > 0) {
          if (datas.length < 100) {
            setState(() async {
              datas.clear();

              datas.addAll(get);
              listofHive = datas
                  .map((e) => hivemodelList(
                      language: e.language,
                      number1: e.watchersCount,
                      number2: e.watchersCount,
                      substitle: e.name,
                      title: e.id))
                  .toList();
              add.instance.addHiveList(listofHive);
            });
          } else {
            setState(() {
              _hasNextPage = false;
            });
          }
        } else {
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (eRR) {
        if (kDebugMode) {
          print("load more wrong");
        }
      }
      setState(() {
        isLoadMoreRunning = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _firstLoad();
    controller = new ScrollController()..addListener(_loadMore);
  }

  @override
  Widget build(BuildContext context) {
    // print("no. of datas=${datas.length}");

    // print("no. listofHive=${listofHive.length}");

    return Scaffold(
        appBar: AppBar(
          title: const Text('JAKES LIT'),
        ),
        body: Column(
          children: [
            card(),
            if (isLoadMoreRunning == true)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (_hasNextPage == false) alldatafetched(),
          ],
        ));
  }
}
