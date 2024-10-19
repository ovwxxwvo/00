# prohome, a /etc/profile chain load to home.


# Load profiles from /etc/profile.d
if test -d /home/00/profile/; then
	for profile in /home/00/profile/*.sh; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi


