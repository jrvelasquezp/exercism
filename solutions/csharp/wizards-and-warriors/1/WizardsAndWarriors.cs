using System;

abstract class Character
{
    private string characterType;
    protected bool vulnerable;
    protected Character(string characterType)
    {
        this.characterType=characterType;
        this.vulnerable=false;        
    }

    public abstract int DamagePoints(Character target);

    public virtual bool Vulnerable()
    {
        return this.vulnerable;
    }

    public override string ToString()
    {
        return "Character is a " + this.characterType;
    }
}

class Warrior : Character
{
    public Warrior() : base("Warrior")
    {
    }

    public override int DamagePoints(Character target)
    {
        int damage;
        if (target.Vulnerable())
        {
            damage=10;
        }
        else
        {
            damage=6;
        }
        return damage;
    }
}

class Wizard : Character
{
    private bool hasPreparedSpell;
    public Wizard() : base("Wizard")
    {
        this.hasPreparedSpell=false;
        this.vulnerable=true;
    }

    public override int DamagePoints(Character target)
    {
        int damage;
        if (this.hasPreparedSpell)
        {
            damage=12;
        }
        else
        {
            damage=3;
        }
        return damage;
    }

    public void PrepareSpell()
    {
        this.hasPreparedSpell=true;
        this.vulnerable=false;
    }
}
