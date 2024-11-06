import 'package:flutter/material.dart';
import '../widgets/navigation_drawer.dart';

class CommentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bình Luận & Đánh giá',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: AppNavigationDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 5, // replace with your comments count
          itemBuilder: (context, index) {
            return CommentCard();
          },
        ),
      ),
    );
  }
}

class CommentCard extends StatefulWidget {
  @override
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  bool isLiked = false;
  bool isDisliked = false;
  bool isReplying = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 20),
                Text(
                  '4.5',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  '2 days ago',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Good job',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/cmt1.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 8),
                  Image.asset(
                    'assets/images/cmt2.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  // Add more images as needed
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                // Load more images
              },
              child: Text('Xem thêm hình ảnh'),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.thumb_up,
                    color: isLiked ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                      if (isLiked) isDisliked = false;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.thumb_down,
                    color: isDisliked ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isDisliked = !isDisliked;
                      if (isDisliked) isLiked = false;
                    });
                  },
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isReplying = !isReplying;
                    });
                  },
                  child: Text('Trả lời'),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Xóa bình luận'),
                        content: Text('Chắc chắn muốn xóa bình luận này?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Delete the comment
                              Navigator.of(context).pop();
                            },
                            child: Text('Delete', style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text('Xóa', style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
            if (isReplying)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Nhập câu trả lời ',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isReplying = false;
                            });
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle reply submission
                            setState(() {
                              isReplying = false;
                            });
                          },
                          child: Text('Đồng ý', style: TextStyle(color: Colors.blue)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
