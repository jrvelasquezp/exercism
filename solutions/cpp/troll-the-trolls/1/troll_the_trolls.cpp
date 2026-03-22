namespace hellmath {

    enum class AccountStatus {
        troll,
        guest,
        user,
        mod
    };

    enum class Action {
        read,
        write,
        remove
    };

    bool display_post(AccountStatus poster_status, AccountStatus viewer_status) {
        bool display_status = true;
        switch (poster_status) {
            case AccountStatus::troll:
                display_status=(poster_status==viewer_status);
                break;
            default:
                display_status=!(poster_status==AccountStatus::troll);
                break;
        }
        return display_status;
    }

    bool permission_check(Action action, AccountStatus account) {
        bool status=false;
        switch (action) {
            case Action::read:
                status=true;
                break;
            case Action::remove:
                status=(account==AccountStatus::mod);
                break;
            case Action::write:
                status=!(account==AccountStatus::guest);
                break;
        }
        return status;
    }

    bool valid_player_combination(AccountStatus user1, AccountStatus user2) {
        bool valid=false;
        switch (user1) {
            case AccountStatus::guest:
                valid=false;
                break;
            case AccountStatus::troll:
                valid=(user2==AccountStatus::troll);
                break;
            default:
                valid=(user2!=AccountStatus::guest && user2!=AccountStatus::troll);
                break;
        }
        return valid;
    }
    bool has_priority(AccountStatus user1, AccountStatus user2) {
        return (user1>user2);
    }
}
