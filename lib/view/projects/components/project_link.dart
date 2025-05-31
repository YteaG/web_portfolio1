import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_portfolio/view/projects/project_detail_dialog.dart';

import '../../../model/project_model.dart';

class ProjectLinks extends StatelessWidget {
  final int index;
  const ProjectLinks({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            TextButton(
              child: const Text('Check on Github \nor run the app',
                  style: TextStyle(color: Colors.amber,),
                  overflow: TextOverflow.ellipsis),
              onPressed: () {
                 launchUrl(Uri.parse(projectList[index].link));
              }
            ),
            IconButton(
                onPressed: () {
                  launchUrl(Uri.parse(projectList[index].link));
                },
                icon: SvgPicture.asset('assets/icons/github.svg')),
          ],
        ),
        const Spacer(),
        TextButton(
            onPressed: () {
              // Replace the launchUrl with showDialog
              showDialog(
                context: context,
                builder: (context) =>
                    ProjectDetailDialog(project: projectList[index]),
              );
            },
            child: const Text(
              'Read More>>',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 10),
            ))
      ],
    );
  }
}
