CREATE MIGRATION m1yhbwj2wp7f76a4dwvrrdme4abzuve2j466aceom63cbpgmpomcda
    ONTO m1spdzide36woedcywjmlhp7aatankydtib3f4exbzhokj7hmtszcq
{
  ALTER TYPE default::Review {
      DROP PROPERTY review_date;
  };
};
