import 'package:devstravel/models/app_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreLoadPage extends StatefulWidget {
  const PreLoadPage({Key? key}) : super(key: key);

  @override
  State<PreLoadPage> createState() => _PreLoadPageState();
}

class _PreLoadPageState extends State<PreLoadPage> {
  bool loading = true;

  void requestInfo() async {
    await Future.delayed(
      Duration(seconds: 1),
    );

    setState(() {
      loading = true;
    });

    bool request =
        await Provider.of<AppData>(context, listen: false).requestData();
    
    if (request) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    requestInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "lib/assets/flutter1_devstravel_logo.png",
                width: 200,
              ),
              loading
                  ? Container(
                      margin: EdgeInsets.all(30.0),
                      child: Text(
                        "Carregando informações...",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    )
                  : Container(),
              loading
                  ? CircularProgressIndicator(
                      strokeWidth: 3.0,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    )
                  : Container(),
              !loading
                  ? Container(
                      margin: EdgeInsets.all(30.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Tentar novamente"),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
