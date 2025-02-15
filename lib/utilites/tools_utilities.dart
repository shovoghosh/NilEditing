import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ToolsUtilities {
  // static final mainColor = Color(0xffdc3636);
  static const mainColor = Color.fromARGB(255, 93, 143, 236);
  static const secondColor = Color(0xff344672);

  static const redColor = Color(0xffdc3636);
  static const whiteColor = Color(0xffffffff);

  //edit the Urls of Web Sites
  static const homePageUrl =
      "https://nilediting.com/category/lightroom-presets/";
  static const videoPageUrl =
      "https://www.youtube.com/playlist?list=PLDyGclgboRyQtSnJUTjWXIT2uphMTp7XY";
  static const allPageUrl =
      "https://www.youtube.com/playlist?list=PLDyGclgboRyQtSnJUTjWXIT2uphMTp7XY";
  static const firstCategoryPageUrl = "https://nilediting.com/shop/";
  static const secondCategoryPageUrl =
      "https://nilediting.com/category/lightroom-presets/";
  static const thirdCategoryPageUrl =
      "https://nilediting.com/category/video-luts/";
  static const fourthCategoryPageUrl =
      "https://nilediting.com/category/resources/";
  static const fifthCategoryPageUrl =
      "https://nilediting.com/category/use-presets/";
  static const sixthCategoryPageUrl = "https://nilediting.com/category/tools/";

  //edit the social media Links
  // static const facebookUrl = "https://www.facebook.com/Nilediting";
  // static const twitterUrl = "https://x.com/nilediting";
  // static const instagramUrl = "https://www.instagram.com/nil.editing/";
  // // static const snapchatUrl = "https://ads.snapchat.com/";
  // static const websiteUrl = "https://nilediting.com/";
  // static const pintrestUrl = "https://www.pinterest.com/nilediting/";
  // static const youtubeUrl = "https://www.youtube.com/nilediting";

//Add your Email
  static const email = "help@nilediting.com";

  //The Url Function that open any Url

  static List categoriesNames = [
    "Shop",
    "Presets",
    "Video LUT's",
    "Resources",
    "Tutorials",
    "Tools",
  ];

  static List categoriesUrls = [
    firstCategoryPageUrl,
    secondCategoryPageUrl,
    thirdCategoryPageUrl,
    fourthCategoryPageUrl,
    fifthCategoryPageUrl,
    sixthCategoryPageUrl,
  ];

  static List categoriesIcons = [
    FontAwesomeIcons.cartArrowDown,
    FontAwesomeIcons.swatchbook,
    FontAwesomeIcons.photoFilm,
    FontAwesomeIcons.boxesPacking,
    FontAwesomeIcons.chalkboardUser,
    FontAwesomeIcons.screwdriverWrench,
  ];
  static String discoveryImageHeader =
      'https://nilediting.com/wp-content/uploads/2024/07/webban-1024x679-1.jpg';
  static String contactUsHeaderImage =
      'https://nilediting.com/wp-content/uploads/2024/07/photo-1487611459768-bd414656ea10.jpg';
  static String infoHeaderImage =
      'https://nilediting.com/wp-content/uploads/2024/07/photo-1561070791-2526d30994b5.jpg';
  static String ourCategoriesHeaderImage =
      "https://nilediting.com/wp-content/uploads/2024/07/bann.jpg";
  static String visionImage =
      "https://nilediting.com/wp-content/uploads/2024/07/phone-up-1536x1135-1-1024x757-1.png";
  static String missionImage =
      "https://nilediting.com/wp-content/uploads/2024/07/up-lut-1-1536x1135-1-1024x757-1.png";
  static String infoParagraphMission =
      "Our mission at Nile Editing is to deliver top-tier editing tools and resources, including Lightroom presets, video LUTs, and comprehensive tutorials. We are dedicated to maintaining the highest standards of quality and accessibility in all our offerings. Through our meticulous attention to detail and commitment to excellence, we help our clients communicate their ideas clearly and compellingly, fostering their success in academic, professional, and creative endeavors. We aim to make learning easy and accessible with our free tutorials, ensuring everyone can enhance their skills and achieve their goals.";
  static String infoParagraphVision =
      "At Nile Editing, our vision is to empower writers and content creators worldwide by providing exceptional editing tools and resources. We aim to enhance the clarity, impact, and effectiveness of all forms of communication, ensuring that every piece of content we touch reaches its highest potential. By leveraging our expertise and passion for language and visual arts, we strive to be the go-to partner for individuals and organizations seeking to elevate their work to professional standards.";
}
