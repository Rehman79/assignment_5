# assignment_5

A Flutter application for managing a list of pets using Provider for state management and SharedPreferences for local storage. This app allows users to view, add, and remove pets from a list.

## Getting Started

**Features**

**List Display:** View a list of pets with their names and types.

**Add Pet:** Add a new pet to the list via a form.

**Remove Pet:** Delete a pet from the list.

**Persistent Storage:** Pets data is saved and loaded using SharedPreferences.

**Project Structure**

**main.dart:** Entry point of the app. Sets up the MaterialApp and Provider configuration.

**Homepage.dart:** Main screen displaying the list of pets.

**Shared_list.dart:** Contains the list_shared_pref widget to show and manage the pet list.

**AddPet.dart:** Screen for adding a new pet.

**petProvider.dart:** Contains Pet model and PetProvider class for managing state and persistence.


**Dependencies**

1.flutter provider

2.shared_preferences

**Usage**

**View Pets:** The main screen lists all pets.

**Add Pet:** Tap the floating action button to navigate to the add pet screen.

**Remove Pet:** Swipe or tap the delete icon to remove a pet from the list.
