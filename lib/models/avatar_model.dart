class AvatarModel {
  final String imagePath;
  final String description;

  const AvatarModel({required this.imagePath, required this.description});

  static const List<AvatarModel> avatars = [
    AvatarModel(imagePath: 'images/h1.png', description: 'Human'),
    AvatarModel(imagePath: 'images/h2.png', description: 'Animal'),
    AvatarModel(imagePath: 'images/h3.png', description: 'Unicorn'),
    AvatarModel(imagePath: 'images/h4.png', description: 'Alien'),
    AvatarModel(imagePath: 'images/h5.png', description: 'Poppy'),
    AvatarModel(imagePath: 'images/h6.png', description: 'Robot'),
  ];
}
