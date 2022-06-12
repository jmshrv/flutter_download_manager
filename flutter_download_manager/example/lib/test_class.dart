import 'package:isar/isar.dart';

class TestClass extends TypeConverter<TestClass, String> {
  final String data;

  TestClass(this.data);

  @override
  TestClass fromIsar(String object) {
    return TestClass(object);
  }

  @override
  String toIsar(TestClass object) {
    return object.data;
  }
}
