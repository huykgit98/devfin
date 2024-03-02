import 'package:flutter/material.dart';

class NewsFlowSection extends StatelessWidget {
  const NewsFlowSection({
    this.imageUrlList = const [],
    super.key,
  });

  final List<dynamic> imageUrlList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: RepaintBoundary(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Text(
                'News Flow',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            ListView.builder(
              itemCount: imageUrlList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                print("NewsFlowSection rebuild $index");
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.star, color: Colors.red),
                    title: const Text('Title', style: TextStyle(fontSize: 20)),
                    subtitle: const Text(
                      'Subtitle',
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: const Icon(Icons.arrow_forward),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    onTap: () {
                      // Handle tile tap
                    },
                  ),
                );
              },
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Keep reading '),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
