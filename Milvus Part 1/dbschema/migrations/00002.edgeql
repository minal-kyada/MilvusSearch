CREATE MIGRATION m1axhy4qmt2gixfdcqjbh3c3uuzhde2k2fdfzc2it6oevey7rawsaa
    ONTO m1as56osjg5ielrbvp4dvh25pclfwzy4rvfacxx6kded7vxrfidwpq
{
  ALTER TYPE default::City {
      DROP CONSTRAINT std::exclusive ON ((.name, .in_state));
  };
  ALTER TYPE default::City {
      CREATE CONSTRAINT std::exclusive ON (.name);
  };
  ALTER TYPE default::CommunityArea {
      CREATE CONSTRAINT std::exclusive ON (.name);
  };
  ALTER TYPE default::CommunityArea {
      DROP CONSTRAINT std::exclusive ON ((.name, .in_city));
  };
  ALTER TYPE default::State {
      DROP CONSTRAINT std::exclusive ON ((.name, .in_country));
  };
  ALTER TYPE default::State {
      CREATE CONSTRAINT std::exclusive ON (.name);
  };
};
