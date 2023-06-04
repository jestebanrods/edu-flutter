import 'package:chat/domain/message.dart';
import 'package:dio/dio.dart';

class YesNoAnswer {
  final String answer;
  final String image;
  final bool forced;

  YesNoAnswer(
      {required this.answer, required this.image, required this.forced});

  factory YesNoAnswer.fromMap(Map<String, dynamic> json) {
    return YesNoAnswer(
        answer: json["answer"], image: json['image'], forced: json['forced']);
  }
}

class YesNoAnswerRepository {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get("https://yesno.wtf/api");
    final model = YesNoAnswer.fromMap(response.data);

    return Message(
        text: model.answer, fromWho: FromWho.hers, imageUrl: model.image);
  }
}
