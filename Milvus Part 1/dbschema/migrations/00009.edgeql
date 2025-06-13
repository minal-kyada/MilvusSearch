CREATE MIGRATION m1spdzide36woedcywjmlhp7aatankydtib3f4exbzhokj7hmtszcq
    ONTO m1arfirywnwou3xiima3l5kpxvhgmu3s2tuj2qsjrcfv66rroobp7a
{
  ALTER TYPE default::Review {
      CREATE PROPERTY review_date: std::datetime;
  };
};
