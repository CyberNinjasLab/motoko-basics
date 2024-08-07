// Notificator canister
import Iter "mo:base/Iter";  
import Debug "mo:base/Debug";  

actor Notificator {
  public func slowFunc() : async Nat {
    Debug.print("Start Slow func");
    var i = 0;  
    var text = "";
    for (j in Iter.range(0, 20000000)) {  
      assert(j == i);  
      text := text # "1";
      i += 1;  
    };

    Debug.print("End Slow Func");

    return 5;
  };
}