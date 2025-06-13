CREATE MIGRATION m1gz4fltb4gt7ijb4eaqj7f3x5g4xh2hyv6navar4xmsuchwn4jtsq
    ONTO m1axhy4qmt2gixfdcqjbh3c3uuzhde2k2fdfzc2it6oevey7rawsaa
{
  ALTER TYPE default::Review {
      CREATE PROPERTY business_community: std::str;
      CREATE PROPERTY business_zip_code: std::str;
      CREATE PROPERTY date_reviewed: std::datetime;
  };
};
