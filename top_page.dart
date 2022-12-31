import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_app_1/lib/model/memo.dart';
import 'package:new_app_1/lib/pages/add_memo_page.dart';
import 'package:new_app_1/lib/pages/detail_page.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key, required this.title});

  final String title;

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  List<Memo> memoList = [];
  //- fetchMemoがfunctionのようなもの
  Future<void> fetchMemo() async{
    //- memoCollectionにFirebaseFirestoreにあるデータを取得しようとしている
    final memoCollection = await FirebaseFirestore.instance.collection('memo').get();
    //- docsにmemoCollectionのdocumentをいれている
    final docs = memoCollection.docs;
    for(var doc in docs) {
      //- このmemoはmodelで定義したクラスからきている
      Memo fetchMemo = Memo(
        title: doc.data()['title'],
        detail: doc.data()['detail'],
        createDate: doc.data()['createdDate'],
      );
      memoList.add(fetchMemo);
    }
    setState(() {});
  }

  //- これがどのタイミングで発火するのかが分かっていない
  @override
  void initState() {
    super.initState();
    fetchMemo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('メモ帳'),
      ),
      //- ListView.builderはitemBuilderプロパティで返すWidgetを複数生成するウィジェット
      //- itemCountで数を決めている
      //- ここでtitleを複数表示させている
      body: ListView.builder(
        itemCount: memoList.length,
        itemBuilder: (context, index) {
          return ListTile(
            //- ここでFirebaseFirestoreに保存したデータのtitleをとってくる
            title: Text(memoList[index].title),
            onTap: () {
              //- 確認画面に遷移する画面を書く
              //- Navigatorを用いると画面遷移できる（これはこの形を覚える）
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => DetailPage(memoList[index])));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => AddMemoPage()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
