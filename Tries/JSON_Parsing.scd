"./*".pathMatch;

Platform.userAppSupportDir;

a = JSONFileReader.read (Platform.userAppSupportDir ++ "/jsontest1.json")


a.inspect;

a.keys.asArray.first.class;
a [\glossary];