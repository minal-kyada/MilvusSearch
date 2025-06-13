CREATE MIGRATION m1mqfgpcubbmmaltkhdsknqw6mv2w32s67uyvcwvno4g65lzpeb3ya
    ONTO m1cmkuxlzzgffa3itauzugecgbkgiywggsbdsvofu3ritlj4z4oa6a
{
  ALTER TYPE default::Review {
      CREATE PROPERTY review_date: std::datetime;
  };
};
