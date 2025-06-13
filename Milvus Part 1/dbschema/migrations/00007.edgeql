CREATE MIGRATION m1x5dlfgird5wrscep2dy4vfazbdkz4dglhgzimdtpsnft2iuanflq
    ONTO m1xhiqmblj5xcxxth3wz7as3csyj6kwjuazrbehwmqhz3krk5c2w7a
{
  ALTER TYPE default::Review {
      CREATE PROPERTY review_date: cal::local_date;
  };
};
