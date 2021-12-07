class PostModel
{
  late String name;
  late String cover;
  late String uId;
  late String dateTime;
  late String text;
  late String postImage;
  PostModel({
    required this.name,
    required this.cover,
    required this.uId,
    required this.dateTime,
    required this.text,
    required this.postImage,

  });
  PostModel.fromJson(Map< String, dynamic >json)
  {
    name = json['name'];
    cover = json['cover'];
    uId = json['uId'];
    dateTime = json['dateTime'];
    text = json['text'];
    postImage = json['postImage'];
  }

  Map< String, dynamic > toMap()
  {
    return{
      'name':name,
      'cover':cover,
      'uId':uId,
      'dateTime':dateTime,
      'text':text,
      'postImage':postImage,

    };
  }
}