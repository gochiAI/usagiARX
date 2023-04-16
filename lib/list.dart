class ListItem {
  String title;
  String imageUrl;

  ListItem({required this.title, required this.imageUrl});
}

List<ListItem> items = [
  ListItem(title: 'コンテンツ1', imageUrl: 'https://example.com/image1.png'),
  ListItem(title: 'コンテンツ2', imageUrl: 'https://example.com/image2.png'),
  ListItem(title: 'コンテンツ3', imageUrl: 'https://example.com/image3.png'),
  ListItem(title: 'コンテンツ4', imageUrl: 'https://example.com/image4.png'),
  ListItem(title: 'コンテンツ5', imageUrl: 'https://example.com/image5.png'),
];
