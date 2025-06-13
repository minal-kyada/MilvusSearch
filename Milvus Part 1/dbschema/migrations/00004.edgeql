CREATE MIGRATION m1cmkuxlzzgffa3itauzugecgbkgiywggsbdsvofu3ritlj4z4oa6a
    ONTO m1gz4fltb4gt7ijb4eaqj7f3x5g4xh2hyv6navar4xmsuchwn4jtsq
{
  ALTER TYPE default::Review {
      DROP PROPERTY business_community;
      DROP PROPERTY business_zip_code;
      DROP PROPERTY date_reviewed;
  };
};
