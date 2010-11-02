<?php

class Bcrypt
{
	public static function hash($secret)
	{
		return self::run('hash', $secret);
	}

	public static function compare($hash, $secret)
	{
		return self::run('compare', $hash, $secret) === 'true';
	}

	private static function run()
	{
		$args = func_get_args();
		array_unshift($args, escapeshellcmd(realpath(dirname(__FILE__)) . '/bcrypt-cli'));

		return exec(sprintf(
			'ruby -rubygems %s',
			implode(' ', array_map(array(__CLASS__, 'map_escapeshellarg'), $args))
		));
	}

	private static function map_escapeshellarg($arg)
	{
		return escapeshellarg($arg);
	}
}
