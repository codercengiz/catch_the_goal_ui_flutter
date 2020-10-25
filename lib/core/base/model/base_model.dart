abstract class BaseModel<T> {
  String id;
  Map<String, Object> toJson();
  T fromJson(Map<String, Object> json);
}
