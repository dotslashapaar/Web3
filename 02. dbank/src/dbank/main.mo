import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank{
  stable var currentValue: Float = 500;
  currentValue := 300;

  // let id = 3141341314331;
  stable var startTime = Time.now();
  startTime := Time.now();

  // Debug.print(debug_show(id));

  public func topUp(amount: Float){
    currentValue += amount;

    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float){
    let tempValue: Float = currentValue - amount;
    if(tempValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }else{
      Debug.print("Withdrawl Amount Exceeds The Amount Currently In The Wallet")
    }
    
  };

  public query func checkBalance(): async Float{
    return currentValue;
  };

  public func compound(){
    let currentTime= Time.now();
    Debug.print(debug_show(currentTime));
    let timeElaspedNS = currentTime - startTime;
    Debug.print(debug_show(timeElaspedNS));

    let timeElaspedS = timeElaspedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElaspedS));

    startTime := currentTime;

  };

  // topUp();
}