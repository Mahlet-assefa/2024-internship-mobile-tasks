import 'dart:io';

void main() {
  productManager collector = productManager();

  while (true) {
    print("Choose an option:");
    print("1. Add a product");
    print("2. Display all products");
    print("3. Display One product");
    print("4. Edit a product ");
    print("5. Delete a product");
    print("6. Exit");

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        collector.addproduct();
        break;
      case '2':
        collector.displayProducts();
        break;
      case '3':
        collector.displayoneproducts();
        break;
      case '4':
        collector.editproduct();
        break;
      case '5':
        collector.deleteproduct();
        break;
      case '6':
        print("Exiting");
        return;
      default:
        print("Invalid choice. Please try again.");
    }
  }
}

class Product {
  String _Name;
  String _Desc;
  double _Price;

  Product(this._Name, this._Desc, this._Price);

  set name(String input) {
    this._Name = input;
  }

  String get name => _Name;

  set desc(String input) {
    this._Desc = input;
  }

  String get desc => _Desc;

  set price(double input) {
    this._Price = input;
  }

  double get price => _Price;
}

class productManager {
  List<Product> _pro = [];

  void addproduct() {
    print("Enter the name of the product:");
    String? nameInput = stdin.readLineSync();
    if (nameInput == null) {
      print("Invalid input for name");
      return;
    }
    print("Enter the desription of the product:");
    String? descInput = stdin.readLineSync();
    if (descInput == null) {
      print("Invalid input for description");
      return;
    }
    print("Enter the price of the product:");
    String? priceInput = stdin.readLineSync();
    if (priceInput == null) {
      print("Invalid input for price.");
      return;
    }

    double? price;
    try {
      price = double.parse(priceInput);
    } catch (e) {
      print("Invalid input for price.");
      return;
    }

    Product product = Product(nameInput, descInput, price);
    _pro.add(product);
    print("Product added successfully.");
  }

  void displayProducts() {
    if (_pro.isEmpty) {
      print("No products available.");
    } else {
      for (var p in _pro) {
        print(
            'Name: ${p.name}, Description: ${p.desc}, Price: ${p.price.toStringAsFixed(2)}birr');
      }
    }
  }

  void displayoneproducts() {
    print("Enter the name of the product to display:");
    String? dd = stdin.readLineSync();
    for (var p in _pro) {
      if (p.name == dd) {
        print(
            'Name: ${p.name}, Description: ${p.desc}, Price: ${p.price.toStringAsFixed(2)} birr');
      }
    }
  }

  void deleteproduct() {
    print("Enter the name of the product to delete:");
    String? delpro = stdin.readLineSync();
    for (var p in _pro) {
      if (p.name == delpro) {
        _pro.remove(p);
        print("successfully deleted");
      }
    }
  }

  void editproduct() {
    print("Enter the name of the product to edit:");
    String? editpro = stdin.readLineSync();
    if (editpro == null) {
      print("Invalid input for name.");
      return;
    }

    bool found = false;
    for (var p in _pro) {
      if (p.name == editpro) {
        found = true;

        print("Enter the product newly name:");
        String? newlyname = stdin.readLineSync();
        if (newlyname == null) {
          print("Invalid input for name.");
          return;
        }
        p.name = newlyname;

        print("Enter the description of the newly product:");
        String? newDesc = stdin.readLineSync();
        if (newDesc == null) {
          print("Invalid input for description.");
          return;
        }
        p.desc = newDesc;

        print("Enter the new price of the product:");
        String? newPriceInput = stdin.readLineSync();
        if (newPriceInput == null) {
          print("Invalid input for price.");
          return;
        }

        double? newPrice;
        try {
          newPrice = double.parse(newPriceInput);
        } catch (e) {
          print("Invalid input for price.");
          return;
        }
        p.price = newPrice;

        print("Product updated successfully.");
        break;
      }
    }

    if (!found) {
      print("Product not found.");
    }
  }
}

