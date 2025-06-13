module default {
    type Country {
        property name -> str;
        multi link has_states := .<in_country[is State];
        constraint exclusive on (.name);
    }

    type State {
        property name -> str;
        link in_country -> Country;
        multi link has_cities := .<in_state[is City];
        constraint exclusive on (.name);
    }

    type City {
        property name -> str;
        link in_state -> State;
        multi link has_communityAreas := .<in_city[is CommunityArea];
        multi link has_zipCodes := .<in_city[is ZipCode];
        constraint exclusive on (.name);
    }
    
    type CommunityArea {
        property name -> str;
        link in_city -> City;
        link has_zipcodes := .<in_communityArea[is ZipCode];
        multi link has_businesses := .<in_communityArea[is Business];
        constraint exclusive on (.name);
    }

    type ZipCode {
        property digits -> str;
        link in_city -> City;
        multi link in_communityArea -> CommunityArea;
        multi link has_streetAddresses := .<in_zipcode[is StreetAddress];
        constraint exclusive on (.digits);
    }
    
    type StreetAddress {
        property address1 -> str;
       	property address2 -> str;
       	property address3 -> str;
        link in_zipcode -> ZipCode;
        property coordinates -> tuple<latitude: float32,  longitude: float32>;
        link has_business := .<has_address[is Business];
        constraint exclusive on (.coordinates);
    }

    type Business {
        property ID -> str;
        property name -> str;
        property alias -> str;
        property rating -> float32;
        property review_count-> int32;
        link in_communityArea -> CommunityArea;
        property coordinates -> tuple<latitude: float32,  longitude: float32>;
        link has_address -> StreetAddress;
        multi link in_category -> Category;
        multi link has_reviews := .<reviews_business[is Review];
        constraint exclusive on (.ID);
    }

    type Category {
        property name -> str;
        link has_business := .<in_category[is Business];
        constraint exclusive on (.name);
    }
    
    type Review {
        property review -> str;
	    property rating-> float32;
        property review_date->datetime;
        link reviews_business -> Business;
        link written_by -> User;
    }
    
    type User {
	    property name -> str;
        multi link reviews := .<written_by[is Review];
        constraint exclusive on (.name);
    }
}