import 'package:flutter/material.dart';
import 'package:new_app_1/lib/model/memo.dart';

class DetailPage extends StatelessWidget {
  final Memo memo;
  const DetailPage(this.memo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(memo.title),
      ),
      //- で左右中央に並べられる
      body: Center(
        //- Columnで縦に文言を並べられる
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('メモ詳細', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Text(memo.detail),
          ],
        ),
      )
    );
  }
}
