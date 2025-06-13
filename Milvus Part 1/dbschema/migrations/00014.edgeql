CREATE MIGRATION m1nmvtbq2yvkpqfmtre4ovnotvfnk7d6r4ov4rq73uwlux4c53abja
    ONTO m14yiyvxcvnrr23hp3ryuf3s6h63lpvxynhyulvjbkvybemk6wrowq
{
  ALTER TYPE default::Review {
      ALTER PROPERTY review_date {
          SET TYPE cal::local_date USING (<cal::local_date>.review_date);
      };
  };
};
