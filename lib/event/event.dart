import 'package:evntown/category/category.dart';
import 'package:evntown/category/category_controller.dart';
import 'package:evntown/image/image.dart';
import 'package:evntown/image/image_controller.dart';
import 'package:evntown/tag/tag.dart';
import 'package:evntown/tag/tag_controller.dart';

class BaseEvent{
  String id;
  String title;
  String description;
  List<BaseImage> images;
  double price;
  List<BaseTag> tags;
  List<BaseCategory> categories;

  BaseEvent(this.id, this.title, this.description, this.images, this.price,
      this.tags, this.categories);

  BaseEvent.fromJson(Map<String,dynamic> jsonObject){
    this.id = jsonObject[ 'id' ];
    this.title = jsonObject[ 'title' ];
    this.description = jsonObject [ 'description' ];
    this.images = ImageController.toImages( jsonObject[ 'images' ] );
    this.price = jsonObject [ 'price' ];
    this.tags = TagController.toTags( jsonObject[ 'tags' ] );
    this.categories = CategoryController.toCategories( jsonObject[ 'categories' ] );
  }
}