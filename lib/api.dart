import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dotenv/dotenv.dart';

final _env = DotEnv(includePlatformEnvironment: true)..load();
final _header = {
  'Authorization': _env['API_KEY'] as String,
  'Content-Type': 'application/json',
  'Cookie':
      '__cf_bm=W5xLKA6QkngkPr5.aChaaZ7ORmHMRz4KkJ9aUOjMJh4-1679549630-0-AQ/HsatxcazvIaruJhCU72vKdqAD2NBTzj5IatNohBAoOyi4p/4dKU+zWOML2m32UKNfDdyKVd61cc2zFNi2ewGM6FQV+5u1r6pChxNp0gZu'
};

Future<void> getTeams() async {
  var request = http.Request('POST', Uri.parse("https://api.monday.com/v2"));
  request.body = json.encode({"query": " query { teams {id name}}"});
  request.headers.addAll(_header);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(
        await response.stream.bytesToString().whenComplete(() => _env.clear()));
    //return res['data']['teams'];
  } else {
    print(response.reasonPhrase);
  }
}

Future<void> getAllEmployee() async {
  var request = http.Request('POST', Uri.parse("https://api.monday.com/v2"));
  request.body = json.encode({"query": " query { users {id name}}"});
  request.headers.addAll(_header);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(
        await response.stream.bytesToString().whenComplete(() => _env.clear()));
  } else {
    print(response.reasonPhrase);
  }
}

Future<void> getEmployeeByTeam(int id) async {
  var request = http.Request('POST', Uri.parse("https://api.monday.com/v2"));
  request.body = json.encode({
    "query": " query { teams (ids: $id)  { users { id name photo_thumb }}}"
  });
  request.headers.addAll(_header);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(
        await response.stream.bytesToString().whenComplete(() => _env.clear()));
  } else {
    print(response.reasonPhrase);
  }
}

Future<void> getBoards() async {
  var request = http.Request('POST', Uri.parse("https://api.monday.com/v2"));
  request.body = json.encode({
    "query": " query { boards (ids: 3733992710) { id name board_folder_id }}"
  });
  request.headers.addAll(_header);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(
        await response.stream.bytesToString().whenComplete(() => _env.clear()));
  } else {
    print(response.reasonPhrase);
  }
}
