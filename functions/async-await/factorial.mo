import Debug "mo:base/Debug";

actor Factorial {
  var last = 1;
  var value = 0;
  
  public func inc() : async Nat {
    value += 1;
    return value;
  };

  public func next() : async Nat {
    Debug.print("Start Factorial Next func");
    last *= await inc();
    Debug.print("End Factorial Next func");
    return last;
  }
};