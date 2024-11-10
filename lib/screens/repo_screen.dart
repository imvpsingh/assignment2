import 'package:assignment/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RepoScreen extends StatefulWidget {
  const RepoScreen({super.key});

  @override
  State<RepoScreen> createState() => _RepoScreenState();
}

class _RepoScreenState extends State<RepoScreen> {
  final List<Map<String, dynamic>> publicRepoData = publicRepo;
  String formatDate(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
  @override
  Widget build(BuildContext context) {
    return    Scaffold(
        backgroundColor: Colors.black12,
      body: ListView.builder(
        itemCount: publicRepoData.length,
        itemBuilder: (context, index) {
      var repo = publicRepoData[index];
      final owner = repo['owner'];
      final files = repo['files'];
      return Card(
        margin: EdgeInsets.all(8),
        elevation: 3,
        child: ListTile(
          onTap: () {
            // Navigate to the files listing screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RepoFilesScreen(files: files),
              ),
            );
          },
          onLongPress: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Center(child: Text("Owner")),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(owner['avatar_url'], height: 90),
                    const SizedBox(height: 10),
                    Text("Username: ${owner['login']}"),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Close"),
                  ),
                ],
              ),
            );
          },
          leading: CircleAvatar(
            backgroundImage: NetworkImage(repo["owner"]["avatar_url"]),
          ),
          title: Text(repo["owner"]["login"], style: const TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                repo["description"] ?? "No description",
              ),
              const SizedBox(height: 4),
              Text("Comments: ${repo["comments"]}"),
              const SizedBox(height: 4),
              Text("Created: ${formatDate(repo["created_at"])}"),
              Text("Updated: ${formatDate(repo["updated_at"])}"),
            ],
          ),
          trailing: const Icon(Icons.public),
        ),
      );
        },
      ),
    );
  }
}
class RepoFilesScreen extends StatelessWidget {
  final Map<String, dynamic> files;

  RepoFilesScreen({required this.files});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Files")),
      body: ListView(
        children: files.entries.map((fileEntry) {
          final file = fileEntry.value;
          return ListTile(
            title: Text(file['filename']),
            subtitle: Text(file['type']),
          );
        }).toList(),
      ),
    );
  }
}
