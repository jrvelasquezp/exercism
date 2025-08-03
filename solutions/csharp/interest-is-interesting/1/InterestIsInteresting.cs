using System;

static class SavingsAccount
{
    public static float InterestRate(decimal balance)
    {
        if(balance<0)
            return (float)3.213;
        else if(balance<1000)
            return (float)0.5;
        else if(balance<5000)
            return (float)1.621;
        else
            return (float)2.475;
    }

    public static decimal Interest(decimal balance)
    {
        return balance*(decimal)InterestRate(balance)/100;
    }

    public static decimal AnnualBalanceUpdate(decimal balance)
    {
        return balance + Interest(balance);
    }

    public static int YearsBeforeDesiredBalance(decimal balance, decimal targetBalance)
    {
        decimal currentBalance=balance;
        int years=0;
        while (currentBalance<=targetBalance){
            currentBalance=AnnualBalanceUpdate(currentBalance);
            years+=1;
        }
        return years;
    }
}
