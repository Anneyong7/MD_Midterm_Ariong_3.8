# Community-Learning-Center-Management-System
Educational Purposes

**Name:** Ariong, Ali
**Section:** BSIT 3.8

## Application Description
This is a Dart console application that manages a Community Learning Center. It allows users to register learning resources, add participants, and view all organized records. The program demonstrates Object-Oriented Programming (OOP) concepts such as inheritance, polymorphism, encapsulation, mixins, and collection management (Lists and Maps).

## Implemented Features
* **Menu System:** A while-loop menu with options to add resources, register participants, view records, and exit.
* **Encapsulation:** Private variables are used in classes with getters to access the data.
* **Inheritance & Abstraction:** An abstract parent class `CenterRecord` is extended by `LearningResource` and `Participant` subclasses.
* **Polymorphism:** The `displayDetails()` method is overridden in subclasses to output specific formatting for different object types.
* **Mixins:** A `RecordTimestamp` mixin is used to automatically generate timestamps when viewing records.
* **Collections:** Uses a `List` to store resources and a `Map` to store participants by their unique IDs.
* **Error Handling:** Uses `try-catch` blocks to prevent the app from crashing if a user types text when an ID number is required.

## Sample Test Scenarios
1. **Valid Input Test:** Register a participant with ID "101" and name "Juan". The system successfully adds them and displays them in the View Records menu.
2. **Invalid Menu Input:** Type "5" or letters in the main menu. The system catches the invalid input and prompts the user to select 1-4 without crashing.
3. **Error Condition (Try-Catch):** In the Register Participant menu, type a word (like "hello") instead of an ID number. The system catches the format error and prints "Error: Invalid ID. Please enter a valid number."

## Instructions for Running the Program
1. Make sure the Dart SDK is installed on your machine.
2. Open a terminal or command prompt in the folder containing the code.
3. Run the application using the command: `dart main.dart`
