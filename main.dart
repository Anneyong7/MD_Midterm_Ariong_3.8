import 'dart:io';

mixin RecordTimestamp {
  String getTimestamp() {
    return DateTime.now().toString().split('.')[0];
  }
}

abstract class CenterRecord with RecordTimestamp {
  void displayDetails();
}

class LearningResource extends CenterRecord {
  String _title;
  String _resourceType;

  LearningResource(this._title, this._resourceType);

  String get title => _title;
  String get resourceType => _resourceType;

  @override
  void displayDetails() {
    print("Resource: $_title | Type: $_resourceType | Logged: ${getTimestamp()}");
  }
}

class Participant extends CenterRecord {
  int _id;
  String _name;

  Participant(this._id, this._name);

  int get id => _id;
  String get name => _name;

  @override
  void displayDetails() {
    print("ID: $_id | Participant: $_name | Registered: ${getTimestamp()}");
  }
}

List<LearningResource> resources = [];
Map<int, Participant> participants = {};

void addResource() {
  print("\n--- Add Learning Resource ---");
  stdout.write("Enter resource title: ");
  String? title = stdin.readLineSync();
  
  stdout.write("Enter resource type (Book, Video, Tool): ");
  String? type = stdin.readLineSync();

  if (title != null && title.isNotEmpty && type != null && type.isNotEmpty) {
    LearningResource newResource = LearningResource(title, type);
    resources.add(newResource);
    print("Resource added successfully.");
  } else {
    print("Error: Inputs cannot be empty.");
  }
}

void registerParticipant() {
  print("\n--- Register Participant ---");
  stdout.write("Enter participant ID number: ");
  String? idInput = stdin.readLineSync();
  
  stdout.write("Enter participant name: ");
  String? name = stdin.readLineSync();

  try {
    if (idInput != null && name != null && name.isNotEmpty) {
      int id = int.parse(idInput);
      if (participants.containsKey(id)) {
        print("Error: Participant ID already exists.");
      } else {
        Participant newParticipant = Participant(id, name);
        participants[id] = newParticipant;
        print("Participant registered successfully.");
      }
    } else {
      print("Error: Name cannot be empty.");
    }
  } catch (e) {
    print("Error: Invalid ID. Please enter a valid number.");
  }
}

void viewRecords() {
  print("\n--- Community Learning Center Records ---");
  
  print("\nLearning Resources:");
  if (resources.isEmpty) {
    print("No resources available.");
  } else {
    for (CenterRecord resource in resources) {
      resource.displayDetails();
    }
  }

  print("\nRegistered Participants:");
  if (participants.isEmpty) {
    print("No participants registered.");
  } else {
    for (CenterRecord participant in participants.values) {
      participant.displayDetails();
    }
  }
}

void main() {
  bool isRunning = true;

  while (isRunning) {
    print("\n===========================================");
    print(" COMMUNITY LEARNING CENTER MANAGEMENT SYSTEM ");
    print("===========================================");
    print("1. Add Learning Resource");
    print("2. Register Participant");
    print("3. View Records");
    print("4. Exit");
    stdout.write("Select an option (1-4): ");
    
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        addResource();
        break;
      case '2':
        registerParticipant();
        break;
      case '3':
        viewRecords();
        break;
      case '4':
        print("Exiting program. Goodbye!");
        isRunning = false;
        break;
      default:
        print("Invalid input. Please enter a number from 1 to 4.");
    }
  }
}
