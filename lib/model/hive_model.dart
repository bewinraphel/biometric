import 'package:hive/hive.dart';
part 'hive_model.g.dart';

@HiveType(typeId: 1)
class hivemodelList extends HiveObject {
  @HiveField(0)
  dynamic title;
  @HiveField(1)
  dynamic substitle;
  @HiveField(2)
  dynamic language;
  @HiveField(3)
  dynamic number1;
  @HiveField(4)
  dynamic number2;

  hivemodelList(
      {this.language, this.number1, this.number2, this.substitle, this.title});
}
