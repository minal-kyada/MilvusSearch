CREATE MIGRATION m1arfirywnwou3xiima3l5kpxvhgmu3s2tuj2qsjrcfv66rroobp7a
    ONTO m1x5dlfgird5wrscep2dy4vfazbdkz4dglhgzimdtpsnft2iuanflq
{
  ALTER TYPE default::Review {
      DROP PROPERTY review_date;
  };
};
