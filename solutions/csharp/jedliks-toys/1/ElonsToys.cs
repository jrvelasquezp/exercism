using System;

class RemoteControlCar
{
    public int distance=0;
    public int batteryPercentage=100;
    public static RemoteControlCar Buy()
    {
        RemoteControlCar car = new RemoteControlCar();
        return car;
    }

    public string DistanceDisplay()
    {
        return "Driven "+distance.ToString()+" meters";
    }

    public string BatteryDisplay()
    {
        if (batteryPercentage == 0) {
            return "Battery empty";
        }
        else{
            return "Battery at "+batteryPercentage.ToString()+"%";    
        }
    }

    public void Drive()
    {
        if (batteryPercentage>0){
            distance+=20;
            batteryPercentage-=1;    
        }
    }
}
