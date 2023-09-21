import 'package:Todo/common/show_model.dart';
import 'package:Todo/provider/service_provider.dart';
import 'package:Todo/widgets/cardTodoList_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyHomePage extends ConsumerWidget {
  MyHomePage({super.key});
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build

    final todoData = ref.watch(fetchDataProvider);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _AppBar(),
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              children: [
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Today\'s Task',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Wednesday ,11 May',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD5E8FA),
                        foregroundColor: Colors.blue.shade700,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return AddNewTaskModel();
                          },
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.add,
                            size: 10,
                          ),
                          Text(
                            'New Task',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.90,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: todoData.value!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.all(8),
                          child: CardToDoListWidget(
                            getIndex: index,
                          ));
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _AppBar() {
    return AppBar(
      title: ListTile(
        leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/pf.jpg'),
          radius: 25,
        ),
        title: Text(
          'Hello I\'m',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade500,
          ),
        ),
        subtitle: const Text(
          'Muhammad Junaid',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      actions: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(CupertinoIcons.calendar),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(CupertinoIcons.bell),
                  onPressed: () {},
                ),
              ],
            ))
      ],
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    );
  }
}
