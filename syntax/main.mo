import Text "mo:base/Text";
import Nat "mo:base/Nat";

// Declare the main actor
actor Main {

  // Immutable variables
  let greeting: Text = "Hello, Motoko!";
  let textImmutable: Text = "Developer Journey";
  let numImmutable: Nat = 50;

  // Mutable variables
  var counter: Nat = 0;
  var pairMutable: (Text, Nat) = (textImmutable, numImmutable);
  var textMutable: Text = textImmutable;

  // Function to return the value of the greeting
  public query func getGreeting(): async Text {
    return greeting;
  };

  // Function to increment the value of the counter
  public func incrementCounter(): async Nat {
    counter += 1;
    return counter;
  };

  // Function to update mutable variables
  public func updateMutableVariables(): async () {
    textMutable := textMutable # "xyz";
    pairMutable := (textMutable, pairMutable.1);
  };

  // Function to get mutable variables
  public query func getMutableVariables(): async (Text, Nat) {
    return pairMutable;
  };

  // Object type in Motoko
  type Person = {
    name: Text;
    age: Nat;
  };

  // Function to create a new object of type Person
  public func createPerson(name: Text, age: Nat): async Person {
    let person: Person = {
      name = name;
      age = age;
    };
    return person;
  };

  // Function to add years to the age of a Person object
  public func increaseAge(person: Person, years: Nat): async Person {
    return { person with age = person.age + years };
  };

  // Function to return information about a given Person object
  public func describePerson(person: Person): async Text {
    return person.name # " is " # Nat.toText(person.age) # " years old.";
  };

  // Object with mutable state
  let myObject = object {
    var state: Nat = 0;

    // Function to increment the state
    public func increment(): async () {
      state += 1;
    };

    // Function to get the current state
    public func getState(): Nat {
      return state;
    };
  };

  // Function to increment the state of myObject
  public func incrementMyObjectState(): async Nat {
    await myObject.increment();
    return myObject.getState();
  };

  // Function to get the current state of myObject
  public query func getMyObjectState(): async Nat {
    return myObject.getState();
  };
}
