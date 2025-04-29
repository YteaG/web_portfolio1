import 'package:flutter/material.dart';
import '../../../model/project_model.dart';

class ProjectDetailDialog extends StatelessWidget {
  final Project project;

  const ProjectDetailDialog({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.7,
        margin: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 5, 21),
          borderRadius: BorderRadius.circular(30),
          // gradient: LinearGradient(
          //   colors: [
          //     Colors.pinkAccent.shade700.withOpacity(0.9),  // Darker pink
          //     Colors.blue.shade900.withOpacity(0.9),        // Darker blue
          //   ]
          // ), 
          boxShadow: const [
            BoxShadow(
              color: Colors.pink,
              offset: Offset(-2, 0),
              blurRadius: 20,
            ),
            BoxShadow(
              color: Colors.blue,
              offset: Offset(2, 0),
              blurRadius: 20,
            ),
          ],
        ),
        child: Column(
          children: [
            // Header with close button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      project.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Project image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        project.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Project description
                    Text(
                      project.description,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
