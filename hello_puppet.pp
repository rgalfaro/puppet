file { '/tmp/hello.txt':
	ensure => present,
	content => "Hello, Worldly fucking world!\n",

}
