file { '/tmp/helloCRON.txt':
	ensure => present,
	content => "Changing the content of file to test cron job!\n",

}
