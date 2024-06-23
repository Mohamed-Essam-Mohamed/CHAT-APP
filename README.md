# CHAT APP

## 🚀 Getting Started

- The application is fully API-dependent.
- pagination shows the pages.
- used searchDelegate to search.
-  As we know, to get news from the internet we should connect to an API so let’s see the News API that we will use in this app.
-  News API is a simple JSON-based REST API for searching and retrieving news articles and articles from specific sources from all over the internet. Using this, one can fetch the most important news articles that work on a news site or search for the most important news on a specific topic (or keyword).
-   News can be retrieved based on some criteria. Say the topic (keyword) to be searched is 'route' or may be related to a particular channel
-   used package   webview_flutter: ^4.7.0 To get the source of the news and display it in the application.
-   News app built using news API, the user can display news agencies according the categories, he can search for a piece of article
using different end point and he can view the website of the article, the app also utilizes pagination for lazily loading date.
  
## 🤳 Screens

- **Splash Screen:** Adding a splash screen to your Android app. 
- **Home Screen:** You start with categories and then you can navigate to the news based on choosing the desired category on the same scaffold.
- **Drawer Screen:** It is possible to move to the category when we are in the news and vice versa is true.
- **Details Screen:** When the user clicks on an article, will go to this screen to show the details of this article and when the user clicks on view article, it will view its link in the user’s default browser.
- **Search Screen:** It same as the previous screen but in appear there is a search bar where the user can write the name of the article to search on it in API, and  shown when the user clicks on the search icon in the previous screen.





## 📁 Files Structure
![files Structure chat app](https://github.com/Mohamed-Essam-Mohamed/CHAT-APP/assets/152906492/67434545-1e1a-4de4-9e57-f9795d895e4e)



## 📱 UI



## 🎥 Video



## 🛠 Dependencies

```pubspec.yaml
 dependencies:
  cloud_firestore: ^5.0.0
  cupertino_icons: ^1.0.6
  firebase_auth: ^5.0.0
  firebase_core: ^3.0.0
  flutter:
    sdk: flutter
  flutter_screenutil: ^5.9.3
  flutter_svg: ^2.0.10+1
  gap: ^3.0.1
  google_fonts: ^6.2.1
  grouped_list: ^5.1.2
  intl: ^0.19.0
  lottie: ^3.1.2
  provider: ^6.1.2
  shared_preferences: ^2.2.3

dev_dependencies:
  flutter_lints: ^3.0.0
  flutter_test:
    sdk: flutter
```


- Contributions are welcome 💜
- If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request.

