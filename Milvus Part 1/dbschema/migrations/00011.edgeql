CREATE MIGRATION m1fjj523i4sec5qwys73pmly53v4trj7ukdfmssrgag4tokhkwcc6q
    ONTO m1yhbwj2wp7f76a4dwvrrdme4abzuve2j466aceom63cbpgmpomcda
{
  ALTER TYPE default::Review {
      CREATE PROPERTY review_date: cal::local_date;
  };
};
