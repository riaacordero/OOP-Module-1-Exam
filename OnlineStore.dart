import 'dart:io';

class User {
  String userName = "";
  String _password = ""; //private variable
  bool isSeller = false;

  checkUser() {
    // Set a mock account for login feature
    if (userName == "Riri" && _password == "123456") {
      welcome();
    } else {
      print("This account doesn't exist. Create an account first!");
      // ABSTRACTION: Instead of placing the entire code for creating an account, I abstracted the instructions inside a single method.
      createAccount(); 
    }
  }

  createAccount() {
    print("Create a username: ");
    String? userName = stdin.readLineSync() ?? "";
    print("Create a password: ");
    String? password = stdin.readLineSync() ?? "";

    this.userName = userName;
    _password = password;
    // ABSTRACTION: Instead of placing the entire code for the welcome page, I abstracted the instructions inside a single method.
    welcome();
  }

  welcome() {
    print("Welcome to your Lazapee Account, " +
        this.userName +
        "! What do you want to do today?\n(1) User Information \n(2) Upgrade to seller's account");
    int choice = int.parse(stdin.readLineSync() ?? "");

    // ABSTRACTION: Instead of placing the entire code inside the if-else statement, I abstracted the instructions inside a single method.
    if (choice == 1) {
      showUserInfo();
    } else if (choice == 2) {
      upgradeSeller();
    }
  }

  showUserInfo() {
    print("Username is: " + userName);
    print("Password is: " + _password);
    if (isSeller == false) {
      print("User type: Standard User");
    } else if (isSeller == true) {
      print("User type: Seller");
    }
    print("-" * 50);
    welcome();
  }

  upgradeSeller() {
    print("You are now a seller! You may set your products online.");
    Seller seller = Seller(userName, _password, isSeller = true);
    seller.showUserInfo();
  }

  User(this.userName, this._password, this.isSeller);
}

// INHERITANCE: class Seller inherits the attributes of its parent class, User.
class Seller extends User {
  Seller(String userName, String password, bool isSeller)
      : super(userName, password, true);

  showUserInfo() {
    print("Username is: " + userName);
    print("Password is: " + _password);
    if (isSeller = false) {
      print("User type: Standard User");
    } else if (isSeller = true) {
      print("User type: Seller");
    }
    print("-" * 50);
    welcome();
  }

  // POLYMORPHISM: Assigned class Seller its own method.
  downgradeSeller() {
    print("Your selling rights are revoked. You are now a Standard User!");
    User user = User(userName, _password, isSeller = false);
    user.showUserInfo();
  }

  //POLYMORPHISM: Overriden welcome() method to replace the upgradeSeller() method to downgradeSeller() 
  @override
  welcome() {
    print("Welcome to your Lazapee Account, " +
        this.userName +
        "! What do you want to do today?\n(1) User Information \n(2) Downgrade to Standard user");
    int choice = int.parse(stdin.readLineSync() ?? "");
    if (choice == 1) {
      showUserInfo();
    } else if (choice == 2) {
      downgradeSeller();
    }
  }
}

void main() {
  print("Welcome to Lazapee! Log in to your account");

  bool isSeller = false;
  print("Username: ");
  String? userName = stdin.readLineSync() ?? "";
  print("Password: ");
  String? password = stdin.readLineSync() ?? "";

  User user = User(userName, password, isSeller);
  user.checkUser();

  // ENCAPSULATION: user.password is undefined because it is privatized and is located inside its class.
  // print(user.userName);
  // print(user.password);
}
