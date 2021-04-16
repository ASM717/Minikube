<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', 'amuriel' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql-service' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '-qkp/3sup<DRes)8tNF+}?y>77~P1kP<~+Fl|J~Qf!q0t#~&0l^|TK|ppncjurc1');
define('SECURE_AUTH_KEY',  '8u:bf.TzJd2OA!ryQ3&[=wvS*0#]H+->c3<v|;|dpuZ-dckN|QQUW=o7zHz{x&{G');
define('LOGGED_IN_KEY',    '[h2F.5VaqfY7I~5^|MH rwVLy?h)fo3XWN^(|1fH%c2|UoY27{dS3ZB@[|[H5,1S');
define('NONCE_KEY',        'Z6qBpust+{}(^kJsSN7&QOWK?3$dP9D%^(~:L8@p-qb$1Pk!EO$Hld.8aQ0+yNfT');
define('AUTH_SALT',        'Ubl0NO#8~frzM8s_L|0$Zu<JVU/-u#f5c3~=E-t.j)b-n6+F|(L&PQ]d%.1)S1t<');
define('SECURE_AUTH_SALT', 'i1F;OV-o;<AC+H.U*0uzq!>0_9$6*J{/$CBO4b*0jexKHH9AVN+Bc|GS.S&eFFa$');
define('LOGGED_IN_SALT',   ',k~N>4IH;Q:c#3zJ_>PpNfK+^E+Xpb=L>woN] >>|E^.jzSgrD)*(?>#m7es]5UR');
define('NONCE_SALT',       'C<ai|$INY1GYxF_:z)rPb#%rkoHn`?1i7$[>`kzV]-i;IW4W*7_5z64LTxSR6-kP');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
