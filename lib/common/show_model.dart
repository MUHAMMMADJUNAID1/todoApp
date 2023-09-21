import 'package:Todo/model/todo_model.dart';
import 'package:Todo/provider/service_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:Todo/constants/app_style.dart';
import 'package:Todo/provider/datetime_provider.dart';
import 'package:Todo/provider/radio_provider.dart';
import 'package:Todo/widgets/datetime_widget.dart';
import 'package:Todo/widgets/radio_widget.dart';
import 'package:Todo/widgets/textfield_widget.dart';

class AddNewTaskModel extends ConsumerWidget {
  AddNewTaskModel({
    super.key,
  });
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radioCateg = ref.watch(radioProvider);
    final dateProv = ref.watch(dateProvider);
    return Container(
      padding: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.80,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text(
              'New Task Todo',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1.5,
          ),
          const Gap(12),
          const Text(
            'Title Task',
            style: AppStyle.headingOne,
          ),
          const Gap(6),
          TextFieldWidget(
              hintText: "Add Task Name",
              maxLine: 1,
              textEditingController: titleController),
          const Gap(12),
          const Text(
            'Description',
            style: AppStyle.headingOne,
          ),
          const Gap(6),
          TextFieldWidget(
            hintText: 'Add Description Here',
            maxLine: 5,
            textEditingController: descriptionController,
          ),
          const Gap(12),
          const Text(
            'Category',
            style: AppStyle.headingOne,
          ),
          const Gap(6),
          Row(
            children: [
              Expanded(
                child: RadioWidget(
                  titleRadio: 'LRN',
                  categColor: Colors.green,
                  valueInput: 1,
                  onChangeValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 1),
                ),
              ),
              Expanded(
                child: RadioWidget(
                  titleRadio: 'WRK',
                  categColor: Colors.blue.shade700,
                  valueInput: 2,
                  onChangeValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 2),
                ),
              ),
              Expanded(
                child: RadioWidget(
                  titleRadio: 'GEN',
                  categColor: Colors.amberAccent.shade700,
                  valueInput: 3,
                  onChangeValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 3),
                ),
              ),
            ],
          ),

          //Date And Time Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateTimeWidget(
                titleText: 'Date',
                valueText: dateProv,
                iconSection: Icons.calendar_month,
                onTap: () async {
                  final getValue = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2050),
                  );
                  if (getValue != null) {
                    final format = DateFormat.yMd();
                    ref.read(dateProvider.notifier).update(
                          (state) => format.format(getValue),
                        );

                    print(format.format(getValue));
                  }
                },
              ),
              DateTimeWidget(
                  iconSection: CupertinoIcons.clock,
                  titleText: 'Time',
                  valueText: ref.watch(timeProvider),
                  onTap: () async {
                    final getTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (getTime != null) {
                      ref
                          .read(timeProvider.notifier)
                          .update((state) => getTime.format(context));
                    }
                  }),
            ],
          ),

          //Button Section
          const Gap(12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue.shade800,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: BorderSide(
                        color: Colors.blue.shade800,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      )),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
              ),
              const Gap(20),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      )),
                  onPressed: () {
                    final getRadioValue = ref.watch(radioProvider);
                    String category = '';
                    switch (getRadioValue) {
                      case 1:
                        category = 'Learning';
                        break;
                      case 2:
                        category = 'Working';
                        break;
                      case 3:
                        category = 'Genral';
                        break;
                    }

                    ref.read(serviceProvider).addNewTask(
                          TodoModel(
                            titleTask: titleController.text,
                            description: descriptionController.text,
                            category: category,
                            dateTask: ref.read(dateProvider),
                            timeTask: ref.read(timeProvider),
                            isDone: false,
                          ),
                        );
                    print('Data is saving');
                    titleController.clear();
                    descriptionController.clear();
                    ref.read(radioProvider.notifier).update((state) => 0);
                    Navigator.pop(context);
                  },
                  child: const Text('Create'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
