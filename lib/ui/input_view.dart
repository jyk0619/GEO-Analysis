import 'package:flutter/material.dart';
import 'package:geo/ui/report_view.dart';
import 'package:geo/viewmodels/report_vm.dart';
import 'package:provider/provider.dart';
import 'package:geo/viewmodels/input_vm.dart';


class InputView extends StatelessWidget {
  InputView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController domainController = TextEditingController();
    final TextEditingController intentController = TextEditingController();

    final viewmodel = Provider.of<ReportViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('입력창임'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              width: 500,
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: domainController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '여기다 도메인 입력',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: intentController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '여기다 의도 입력',
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      String domain = domainController.text;
                      String intent = intentController.text;
                      print('도메인: $domain, 의도: $intent');
                      await viewmodel.fetchAndProcessData();
                      Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => ReportView()
                      )
                      );
                    },
                    child: Text('제출'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(onPressed: (){
                    print('api test');
                  }, child: Text('테스트'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
