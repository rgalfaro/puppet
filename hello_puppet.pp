file { '/tmp/hello.txt':
	ensure => present,
	content => "Hello, World!\n",

}
