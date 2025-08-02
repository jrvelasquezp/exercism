using System;

class BirdCount
{
    private int[] birdsPerDay;

    public BirdCount(int[] birdsPerDay)
    {
        this.birdsPerDay = birdsPerDay;
    }

    public static int[] LastWeek()
    {
        int[] lastWeekCount={0,2,5,3,7,8,4};
        return lastWeekCount;
    }

    public int Today()
    {
        return birdsPerDay[6];
    }

    public void IncrementTodaysCount()
    {
        birdsPerDay[6]+=1;
    }

    public bool HasDayWithoutBirds()
    {
        if (Array.IndexOf(birdsPerDay,0)==-1)
            return false;
        else
            return true;
    }

    public int CountForFirstDays(int numberOfDays)
    {
        int sum=0;
        for(int i=0;i<numberOfDays;i++)
            sum+=birdsPerDay[i];
        return sum;
    }

    public int BusyDays()
    {
        int busyDays=0;
        for(int i=0;i<7;i++)
        {
           if(birdsPerDay[i]>=5)
               busyDays+=1;
        }
        return busyDays;
    }
}
