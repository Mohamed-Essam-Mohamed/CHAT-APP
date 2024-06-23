# CHAT APP
##using Firebase(Auth - cloud firestore), MVVM design pattern, and Provider for state management.

## 🚀 Getting Started

- The user can sign in using Email and password.
- He can create a room of three different types (Music, Movies or sports)
- Two tabs, one showing all the rooms in the database and a tab showing the rooms that the user enters.
- The user can enter and the number of members of the joined room gets incremented, he can also leave, and the number decreases.
- The app listens continuously for the internet, if the user's internet is disconnected a little disconnected WIFI Icon is shown instead of the send icon.
- DateTime.now() isn't good for syncing messages between different devices with different date time, so I used "FieldValue.servertimestamp()" to sync messages using a server-generated Time

  
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




https://github.com/Mohamed-Essam-Mohamed/CHAT-APP/assets/152906492/65e623d9-f31b-4794-9e95-9c249eb50f32




https://github.com/Mohamed-Essam-Mohamed/CHAT-APP/assets/152906492/372a2140-5cb4-4eaa-97d5-721fbfd657d2





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

