import 'package:api_papi/api/logic/api_service.dart';
import 'package:api_papi/api/models/response_model.dart';
import 'package:api_papi/ui/new_request.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResponseScreen extends StatefulWidget {
  ResponseScreen({super.key, this.login, this.password});

  final String? login;
  final String? password;

  late ResponseModel authResponse;

  @override
  State<ResponseScreen> createState() => _ResponseScreenState();
}

class _ResponseScreenState extends State<ResponseScreen> {
  bool isLoading = true;
  final List<ResponseModel> responsesList = [];

  @override
  void initState() {
    apiAuth();
    super.initState();
  }

  void apiAuth() async {
    final ResponseModel response = await ApiService(RequestType.auth).post({
      OptionType.path: 'https://auth.jobhub.ru/api/v1/login',
      OptionType.data: {'email': 'test@jobhub.ru', 'password': '123123'},
    });

    setState(() {
      responsesList.add(response);
      widget.authResponse = responsesList[0];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: Text('Status: ${widget.authResponse.status}'),
              centerTitle: true,
              actions: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => NewRequest(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text('Status Code: ${widget.authResponse.status}'),
                  const SizedBox(height: 12),
                  Text('id: ${widget.authResponse.message.id}'),
                  const SizedBox(height: 12),
                  Text('user_name: ${widget.authResponse.message.user_name}'),
                  const SizedBox(height: 12),
                  Text('first_name: ${widget.authResponse.message.first_name}'),
                  const SizedBox(height: 12),
                  Text(
                      'second_name: ${widget.authResponse.message.second_name}'),
                  const SizedBox(height: 12),
                  Text(
                      'first_last_name: ${widget.authResponse.message.first_last_name}'),
                  const SizedBox(height: 12),
                  Text(
                      'second_last_name: ${widget.authResponse.message.second_last_name}'),
                  const SizedBox(height: 12),
                  Text('cellphone: ${widget.authResponse.message.cellphone}'),
                  const SizedBox(height: 12),
                  Text('email: ${widget.authResponse.message.email}'),
                  const SizedBox(height: 12),
                  Text('jwt: ${widget.authResponse.message.jwt}'),
                ],
              ),
            ),
          );
  }
}
