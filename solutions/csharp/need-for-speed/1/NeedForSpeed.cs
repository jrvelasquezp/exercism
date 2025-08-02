using System;

class RemoteControlCar
{
    private int speed;
    private int batteryDrain;
    private int battery;
    private int distance=0;
    public RemoteControlCar(int speed, int drain) 
    {
        this.speed=speed;
        this.batteryDrain=drain;
        this.battery=100;
    }

    public bool BatteryDrained()
    {
        return this.battery < this.batteryDrain;
    }

    public int DistanceDriven()
    {
        return this.distance;
    }

    public void Drive()
    {
        if (!this.BatteryDrained())
        {
            this.distance=this.distance+this.speed;
            this.battery=this.battery-this.batteryDrain;
        }
    }

    public static RemoteControlCar Nitro()
    {
        var Nitro = new RemoteControlCar(50, 4);
        return Nitro;
    }
}

class RaceTrack
{
    private int distance;
    public RaceTrack(int distance)
    {
        this.distance=distance;
    }
    public bool TryFinishTrack(RemoteControlCar car)
    {
        while (!car.BatteryDrained()){
            car.Drive();
        }
        return car.DistanceDriven()>=this.distance;
    }
}
