CREATE MIGRATION m1ag5pul7vz7yuoxgf6q35jiwvhhmqbt6ji3rsilgjdho4746nfsaa
    ONTO m1fjj523i4sec5qwys73pmly53v4trj7ukdfmssrgag4tokhkwcc6q
{
  ALTER TYPE default::Review {
      DROP PROPERTY review_date;
  };
};
