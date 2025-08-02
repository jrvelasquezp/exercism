pub struct Allergies{
    score: u32,
    allergen_list: Vec<Allergen>
}

#[derive(Debug, PartialEq, Eq)]
pub enum Allergen {
    Eggs,
    Peanuts,
    Shellfish,
    Strawberries,
    Tomatoes,
    Chocolate,
    Pollen,
    Cats,
}

impl Allergies {
    pub fn new(score: u32) -> Self {
        let mut allergen_list: Vec<Allergen> = Vec::new();
        return Allergies{score, allergen_list};
    }

    pub fn is_allergic_to(&self, allergen: &Allergen) -> bool {
        return self.allergies().contains(&allergen);
    }

    pub fn allergies(&self) -> Vec<Allergen> {
        let mut vec = Vec::new();
        let mut aller = 128;
        let mut number = self.score;
        if number > 256 {
            number == number - 256;    
        }
        while number > 1 {
            if number >= aller {
                println!("{}", aller);
                number = number - aller;
                match aller {
                    128 => vec.push(Allergen::Cats),
                    64 => vec.push(Allergen::Pollen),
                    32 => vec.push(Allergen::Chocolate),
                    16 => vec.push(Allergen::Tomatoes),
                    8 => vec.push(Allergen::Strawberries),
                    4 => vec.push(Allergen::Shellfish),
                    2 => vec.push(Allergen::Peanuts),
                    _ => println!("Not supposed to being here"),
                    }
                }
            aller = aller / 2;
        }
        if number == 1 {
            vec.push(Allergen::Eggs);    
        }
        return vec;
    }
}
