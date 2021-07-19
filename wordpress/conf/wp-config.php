<?php

define( 'DB_NAME', 'wordpress' );

define( 'DB_USER', 'wordpress' );

define( 'DB_PASSWORD', 'wordpress' );

define( 'DB_HOST', 'mariadb:3306' );

define( 'DB_CHARSET', 'utf8' );

define( 'DB_COLLATE', '' );

define('AUTH_KEY',         'r+3k>e5Ml|~[Df5{58RG{-rC-Ly&^8i@wiZJFwxURP7-[=tJpj}4LHw <6pBc<u ');
define('SECURE_AUTH_KEY',  '6kombyuVBz@*tVPR|8o_rxO]UNlSY+Q9dg@EA }/-A56RORPaXYJ5CO+]4x$0;7(');
define('LOGGED_IN_KEY',    'Tjje+J|%$f9[qQ<!&(  q6Jqk+AvC2XxO~B9yzbirjKR|Z${vP)^5BA<,AG)vS00');
define('NONCE_KEY',        '$rBUlGvGi6jhpbWQw`poW+=CWoc{+#MWqk|>g}VJ_.{S3A.p_35!S>nW9_ 3&[wS');
define('AUTH_SALT',        '?={J{`RUhJmWl(9emQ&MD#q|.&>]53W|@aI4qJ?x4$@wgzS)2v|I9!yIyIf<cYlI');
define('SECURE_AUTH_SALT', 'j#61UjMESIn8)sKH?c}J!lsu&m.+Yu(Yo(gBOE!tEJA;^slFs@sL?K/sS{< |JG?');
define('LOGGED_IN_SALT',   'Q5]sh!g-EOz-2hD>Gj@UQI81Kbc3Pbd$d^E|OSii8fg0?&Y*A^UTf=c>P(sp^6{Z');
define('NONCE_SALT',       'X, )-HH+_~3vV/Dj|Si_<w)$.FZ=Wki44&fEOCjiQT^QH3*%0ssjP6eLcdP--Pj:');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

require_once ABSPATH . 'wp-settings.php';
