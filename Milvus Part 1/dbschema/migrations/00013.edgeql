CREATE MIGRATION m14yiyvxcvnrr23hp3ryuf3s6h63lpvxynhyulvjbkvybemk6wrowq
    ONTO m1ag5pul7vz7yuoxgf6q35jiwvhhmqbt6ji3rsilgjdho4746nfsaa
{
  ALTER TYPE default::Review {
      CREATE PROPERTY review_date: std::str;
  };
};
