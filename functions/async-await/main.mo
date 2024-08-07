import Factorial "canister:factorial";
import Notificator "canister:notificator";

// Caller canister
actor Main {
  // There are two ways to access a canister:
  // - Inter-canister call via canister name
  // - Via canister ID

  // Here is an example using canister ID:

  // let factorialCanisterId = "canister_id";
  // let factorialCanister = actor(factorialCanisterId): actor { next: () -> async Nat };

  // let notificatorCanisterId = "canister_id";
  // let notificatorCanister = actor(notificatorCanisterId): actor { slowFunc: () -> async Nat };

  public func main() : async Nat {
    let result = await Factorial.next();
    // let result2 = await Notificator.slowFunc();
    // let result3 = await Notificator.slowFunc();

    ignore Notificator.slowFunc();
    ignore Notificator.slowFunc();

    return result;
  }
};