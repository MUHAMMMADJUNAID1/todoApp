import 'package:Todo/provider/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CardToDoListWidget extends ConsumerWidget {
  const CardToDoListWidget({
    super.key,
    required this.getIndex,
  });

  final int getIndex;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(fetchDataProvider);
    return todoData.when(
        data: (todoData) => Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    decoration: const BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(todoData[getIndex].titleTask),
                            subtitle: Text(todoData[getIndex].description),
                            trailing: Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                activeColor: Colors.green.shade200,
                                shape: const CircleBorder(),
                                value: true,
                                onChanged: (value) => todoData[getIndex].isDone,
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(0, -12),
                            child: Column(
                              children: [
                                Divider(
                                  thickness: 1.5,
                                  color: Colors.grey.shade100,
                                ),
                                Row(
                                  children: [
                                    Text(todoData[getIndex].dateTask),
                                    Gap(12),
                                    Text(todoData[getIndex].timeTask)
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
        error: (error, stackTrace) => Center(
              child: Text(stackTrace.toString()),
            ),
        loading: () => Center(
              child: CircularProgressIndicator(),
            ));
  }
}
