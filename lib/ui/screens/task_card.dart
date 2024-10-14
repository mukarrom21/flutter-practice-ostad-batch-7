import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: SizedBox(
        width: 100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'New Task',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Text(
                  'Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. '),
              const Text("26/10/2022"),
              Row(
                children: [
                  const Chip(
                    label: Text('New', style: TextStyle(
                      color: AppColors.themeColor,
                    ),),
                    color: WidgetStatePropertyAll(Colors.white),
                    side: BorderSide(
                      color: AppColors.themeColor,
                      width: 1,
                    ),
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: AppColors.themeColor,
                        width: 1,
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      color: AppColors.themeColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}