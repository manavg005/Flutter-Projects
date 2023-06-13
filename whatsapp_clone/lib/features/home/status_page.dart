import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StatusPage extends StatelessWidget {
  StatusPage({super.key});
  final StoryController _storyController = StoryController();

  final List<StoryItem> _sampleStories = [
    StoryItem.pageImage(
      url:
          'https://media-cdn.tripadvisor.com/media/photo-s/1a/65/92/9d/beautiful-view-from-batote.jpg',
      caption: 'Beauty',
      controller: StoryController(),
    ),
    StoryItem.pageImage(
      url:
          'https://thumbs.dreamstime.com/b/hill-station-view-jammu-kashmir-batote-221105467.jpg',
      caption: 'Heaven',
      controller: StoryController(),
    ),
    // Add more StoryItems for additional stories
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: Container(
              width: 56.0,
              height: 56.0,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 24.0,
                    backgroundImage: NetworkImage(
                        'https://cdn.iconscout.com/icon/free/png-256/free-avatar-370-456322.png?f=webp'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            title: Text(
              'My Status',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('Tap to add status update'),
            onTap: () {
              // Handle tapping on "My Status"
            },
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Recent Updates',
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        leading: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        title: Text('Vaibhav Sir'),
                      ),
                      body: StoryView(
                        storyItems: _sampleStories,
                        controller: _storyController,
                        inline: false,
                        repeat: true,
                        onComplete: () {
                          // Handle story completion
                        },
                      ),
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 24.0,
                backgroundImage: NetworkImage(
                    'https://cdn.iconscout.com/icon/free/png-256/free-avatar-370-456322.png?f=webp'),
              ),
            ),
            title: Text(
              'Vaibhav Sir',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('Today, 10:30 AM'),
          ),
          ListTile(
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        leading: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        title: Text('Shagun Sir'),
                      ),
                      body: StoryView(
                        storyItems: _sampleStories,
                        controller: _storyController,
                        inline: false,
                        repeat: true,
                        onComplete: () {
                          // Handle story completion
                        },
                      ),
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 24.0,
                backgroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/147/147142.png'),
              ),
            ),
            title: Text(
              'Shagun Sir',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('Yesterday, 08:45 PM'),
          ),
          // Add more ListTile widgets for other status updates
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle tapping on the FAB
        },
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
