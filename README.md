# 🧩 Pokédex App

A sleek Flutter app that combines Firebase Authentication, dynamic theming, and a live Pokédex powered by a public Pokémon API. Users can sign up or log in securely, browse a list of Pokémon, and toggle between light and dark themes with a simple switch.

## 🚀 Features

- 🔐 **Firebase Authentication**  
  Secure sign-up and login using Firebase Firestore.

- 🧬 **Pokémon API Integration**  
  Fetches real-time data from the [PokéAPI](https://pokeapi.co/) to display a list of Pokémon.

- 🎨 **Theme Switcher**  
  Toggle between light and dark mode using a simple UI switch.

- 📱 **Responsive UI**  
  Clean and intuitive design optimized for both Android and iOS.

---


## 📸 Screenshots

### **Welcome Screen in Light Mode**
<img width="336" height="748" alt="image" src="https://github.com/user-attachments/assets/a267f2c7-2e2f-4b49-8b7e-abb760f5c666" />

### **Login Screen in Light Mode**
<img width="336" height="748" alt="image" src="https://github.com/user-attachments/assets/6edf58a3-2f91-4a33-9900-dd71bc870065" />

### **Registration Screen in Light Mode**
<img width="336" height="748" alt="image" src="https://github.com/user-attachments/assets/e118324c-02dd-4631-854c-77045ade2af1" />

### **Forgot Password Screen in Light Mode**
<img width="336" height="748" alt="image" src="https://github.com/user-attachments/assets/c587aae2-8a91-4a7e-adbb-cf4de8382da5" />

### **Theme Changing Switch in Dark Mode**
<img width="336" height="748" alt="image" src="https://github.com/user-attachments/assets/26dfe86f-b046-44d4-a38d-0771fa471320" />

### **Home Screen in Dark Mode**
<img width="336" height="748" alt="image" src="https://github.com/user-attachments/assets/5788d5ad-cc3f-443f-a672-8d99bd911d8a" />

### **Home Screen with Drawer open in Dark Mode**
<img width="336" height="748" alt="image" src="https://github.com/user-attachments/assets/c341b690-940a-43fd-a433-03e1d05f9e3f" />

### **Detail Screen in Dark Mode**
<img width="336" height="748" alt="image" src="https://github.com/user-attachments/assets/a915db50-ac0b-46f4-b6e7-c953c89955ff" />

---

## 🔧 Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/pokeauth-app.git
   cd pokeauth-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up Firebase**
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Enable **Email/Password Authentication**
   - Add your `google-services.json` (Android) and/or `GoogleService-Info.plist` (iOS) to the respective directories

4. **Run the app**
   ```bash
   flutter run
   ```

---

## 🌐 API Reference

- **PokéAPI**  
  Base URL: `https://raw.githubusercontent.com/Biuni/PokemonGo-Pokedex/master/pokedex.json`

---

## 🤝 Contributing

Contributions are welcome!  
Feel free to fork the repo and submit a pull request.

---


## 💡 Future Improvements
 
- Implement Google and other Sign-In Auth
- Add favourite page for Pokémon data  
- Unit and widget testing


