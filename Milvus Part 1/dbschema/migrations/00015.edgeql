CREATE MIGRATION m15gq3chofr3dpmbtgsd4szeayv3mu2sxa5judcjztx43fpwpd4cjq
    ONTO m1nmvtbq2yvkpqfmtre4ovnotvfnk7d6r4ov4rq73uwlux4c53abja
{
  ALTER TYPE default::Review {
      DROP PROPERTY review_date;
  };
};
