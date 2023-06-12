import 'package:flutter/material.dart';

void main() {
  runApp(PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Photo Gallery'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Welcome to My Photo Gallery!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for photos',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(12.0),
                  ),
                ),
              ),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  _buildPhotoButton(context, 'Photo 1', 'https://example.com/photo1.jpg'),
                  _buildPhotoButton(context, 'Photo 2', 'https://example.com/photo2.jpg'),
                  _buildPhotoButton(context, 'Photo 3', 'https://example.com/photo3.jpg'),
                  _buildPhotoButton(context, 'Photo 4', 'https://example.com/photo4.jpg'),
                  _buildPhotoButton(context, 'Photo 5', 'https://example.com/photo5.jpg'),
                  _buildPhotoButton(context, 'Photo 6', 'https://example.com/photo6.jpg'),
                ],
              ),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ListTile(
                    leading: Icon(Icons.photo),
                    title: Text('Photo 1'),
                    subtitle: Text('Category: Nature'),
                  ),
                  ListTile(
                    leading: Icon(Icons.photo),
                    title: Text('Photo 2'),
                    subtitle: Text('Category: Travel'),
                  ),
                  ListTile(
                    leading: Icon(Icons.photo),
                    title: Text('Photo 3'),
                    subtitle: Text('Category: Wildlife'),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final snackBar = SnackBar(content: Text('Photos Uploaded Successfully!'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Icon(Icons.cloud_upload),
        ),
      ),
    );
  }

  Widget _buildPhotoButton(BuildContext context, String caption, String imageUrl) {
    return ElevatedButton(
      onPressed: () {
        final snackBar = SnackBar(content: Text('Clicked on photo!'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: 150.0,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Text(
              caption,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
