CREATE MIGRATION m1xhiqmblj5xcxxth3wz7as3csyj6kwjuazrbehwmqhz3krk5c2w7a
    ONTO m1mqfgpcubbmmaltkhdsknqw6mv2w32s67uyvcwvno4g65lzpeb3ya
{
  ALTER TYPE default::Review {
      DROP PROPERTY review_date;
  };
};
