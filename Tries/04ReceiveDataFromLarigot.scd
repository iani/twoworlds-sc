(
{
	loop {
		"rsync -rvzP iani@larigot.avarts.ionio.gr:/Users/Shared/Projects/TwoWorlds/webosc/output_file.json /Users/twoworlds/".unixCmd;
		10..wait;
	}
}.fork;
)
