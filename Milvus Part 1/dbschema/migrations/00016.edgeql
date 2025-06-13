CREATE MIGRATION m1v5d4duzvy27ooyvewjblpiyrysi5xvdfc7xs2hbw34dhstsyz3ka
    ONTO m15gq3chofr3dpmbtgsd4szeayv3mu2sxa5judcjztx43fpwpd4cjq
{
  ALTER TYPE default::Review {
      CREATE PROPERTY review_date: std::datetime;
  };
};
