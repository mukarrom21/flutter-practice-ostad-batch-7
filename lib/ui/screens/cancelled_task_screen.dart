import 'package:flutter/material.dart';
import 'package:practice_with_ostad/data/models/network_response.dart';
import 'package:practice_with_ostad/data/models/task_list_model.dart';
import 'package:practice_with_ostad/data/models/task_model.dart';
import 'package:practice_with_ostad/data/services/network_caller.dart';
import 'package:practice_with_ostad/data/utils/urls.dart';
import 'package:practice_with_ostad/ui/screens/task_card.dart';
import 'package:practice_with_ostad/ui/widgets/center_circuler_progress_indicator.dart';
import 'package:practice_with_ostad/ui/widgets/snack_bar_message.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
  List<TaskModel> _cancelledTaskList = [];
  bool _getCancelledTaskInProgress = false;

  Future<void> _getCancelledTasks() async {
    _cancelledTaskList.clear();
    _getCancelledTaskInProgress = true;
    setState(() {});
    final NetworkResponse response =
    await NetworkCaller.getRequest(Urls.getCancelledTasks);
    if (response.isSuccess) {
      final TaskListModel taskListModel =
      TaskListModel.fromJson(response.responseData);
      _cancelledTaskList = taskListModel.taskList ?? [];
      showSnackBarMessage(context, "Cancelled task retrieved successfully");
    } else {
      showSnackBarMessage(context, response.errorMessage, true);
    }
    _getCancelledTaskInProgress = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    _getCancelledTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !_getCancelledTaskInProgress,
      replacement: const CenterCircularProgressIndicator(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: _cancelledTaskList.length,
          itemBuilder: (context, index) {
            return TaskCard(task: _cancelledTaskList[index],);
          }, separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 8,
            );
        },
        ),
      ),
    );
  }
}
