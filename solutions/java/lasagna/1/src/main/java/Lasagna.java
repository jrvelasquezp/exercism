public class Lasagna {
    public int expectedMinutesInOven(){
        return 40;
    }

    public int remainingMinutesInOven(int time){
        return expectedMinutesInOven()-time;
    }

    public int preparationTimeInMinutes(int layers){
        return 2*layers;
    }

    public int totalTimeInMinutes(int layers, int time){
        return preparationTimeInMinutes(layers)+time;
    }
}
