# DSA Tracker

This will track DSA problems and their meta-data.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- Follow this documentation for setting up Firebase with FlutterFire on your local machine: [Firebase Setup](https://firebase.google.com/docs/flutter/setup?platform=ios)

---

# Pre Release 0.0.1 - TaskFlow (Web & Desktop)

### **Release Date**: `2024-09-26`

### **Version**: `0.0.1`

## Deployments
- Web: [Visit Here](https://dsa-tracker-nine.vercel.app/)
- Windows: Download attached zip file and run dsa_tracker.exe
- Other Platforms: Are not addressed in this pre-release

---

## :rocket: Overview

This is the initial release (v0.0.1) of **TaskFlow**, a task-tracking dashboard for **Web** and **Desktop** built with **Flutter**. Currently, the app is in development and is out for public feedback.

---

## :zap: Features

- **Dashboard UI**: 
  - Task listing with headers (S.No., Task Name, Tags, Approach, Rating).
  - Clickable task links that open in a new tab.
  - Filter tasks by tags from the side navigation drawer.
  
- **Task Management**: 
  - Add new tasks via the floating action button.
  - Tags and tasks are fetched from Firebase Firestore.
  
- **Settings Screen**: 
  - Update user profile.
  - Choose app theme (primary color + dark/light mode toggle).
  - Theme persisted with Shared Preferences.

- **BLoC Architecture**:
  - Modular BLoC implementation for tasks and tags.
  - Firebase Firestore integration with Repositories and Services.
  
---

## :bug: Known Issues

- Filtering performance might slow down with a large number of tasks.
- Further improvements needed for responsive design on smaller desktop screens.

---

## :hammer_and_wrench: Tech Stack

- **Flutter**
- **Firebase Firestore**
- **BLoC for state management**
- **Shared Preferences for local storage**

---

## :package: Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Joaquin144/DSA-Tracker-Dashboard.git


## Screenshots

### 1. Dashboard
The central hub where you can see collection of your own DSA problems for quick revision

![Dashboard Screenshot](https://github.com/user-attachments/assets/2569d1ac-2825-4bfa-a571-f862fe77051b)

### 2. Filter by Tags
Easily filter your DSA problems by tags.

![Dashboard Screenshot with LL filter](https://github.com/user-attachments/assets/68f5c9b1-f991-4afb-9338-74d3c9522c02)

### 3. Choose Among numerous themes

![Theme 1Screenshot](https://github.com/user-attachments/assets/6c7369e9-7dc4-46bd-8c66-1f7bfe9e542c)

### 4. More features to come

![Theme 2 Screenshot](https://github.com/user-attachments/assets/0de0d949-4a86-4e41-bd30-b443816cdc22)
![image](https://github.com/user-attachments/assets/806f71a0-ce6e-4823-b25b-4db18d74e033)
