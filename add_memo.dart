import 'package:flutter/material.dart';

class  AddMemoPage extends StatefulWidget {
  const AddMemoPage({Key? key}) : super(key: key);

  @override
  _AddMemoPageState createState() => _AddMemoPageState();
}

class _AddMemoPageState extends State<AddMemoPage> {
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController detailEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('メモ追加'),
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text("タイトル"),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: titleEditingController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 10),
                  ),
                )
              ),
              const SizedBox(height: 40),
              const Text("詳細"),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: titleEditingController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 10),
                  ),
                )
              ),
              const SizedBox(height: 40),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text('追加')
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
