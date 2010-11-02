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
		$command_parts = array(
			escapeshellcmd(realpath(dirname(__FILE__)) . '/bcrypt-cli')
		);

		foreach (func_get_args() as $arg)
			$command_parts []= escapeshellarg($arg);

		return exec(implode(' ', $command_parts));
	}
}
