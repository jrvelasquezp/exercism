namespace targets {
// TODO: Insert the code for the alien class here
    class Alien {
        public:
            Alien(int x, int y) {
                x_coordinate=x;
                y_coordinate=y;
            }
            int get_health(){
                return health;
            }
            bool hit(){
                if (health>0){
                    health--;
                }
                return true;
            }
            bool is_alive(){
                return (health>0);
            }
            bool teleport(int x, int y){
                x_coordinate=x;
                y_coordinate=y;
                return true;
            }
            bool collision_detection(Alien a){
                return (x_coordinate==a.x_coordinate && y_coordinate==a.y_coordinate);
            }
            int x_coordinate;
            int y_coordinate;
        private:
            int health=3;
    };
}  // namespace targets