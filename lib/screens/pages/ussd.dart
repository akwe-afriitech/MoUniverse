import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:ussd_advanced/ussd_advanced.dart';

class ussd extends StatefulWidget {
  const ussd({Key? key}) : super(key: key);

  @override
  State<ussd> createState() => _ussdState();
}

class _ussdState extends State<ussd> {
  late TextEditingController _controller;
  String? _response;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          TextField(
            controller: _controller,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(labelText: 'Ussd code'),
          ),
          if (_response != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(_response!),
            ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  UssdAdvanced.sendUssd(code: "*126*9*650204677*1#", subscriptionId: 1);
                },
                child: const Text('norma\nrequest'),
              ),
              ElevatedButton(
                onPressed: () async {
                  String? _res = await UssdAdvanced.sendAdvancedUssd(code: _controller.text, subscriptionId: 1);
                  setState(() {
                    _response = _res;
                  });
                },
                child: const Text('single session\nrequest'),
              ),
              ElevatedButton(
                onPressed: () async {
                  String? _res = await UssdAdvanced.multisessionUssd(code: _controller.text, subscriptionId: 1);
                  setState(() {
                    _response = _res;
                  });
                  String? _res2 = await UssdAdvanced.sendMessage('0');
                  setState(() {
                    _response = _res2;
                  });
                  await UssdAdvanced.cancelSession();
                },
                child: const Text('multi session\nrequest'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
