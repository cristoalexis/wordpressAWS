<?php
define('DB_NAME', 'wordpressev3');
define('DB_USER', 'admin');
define('DB_PASSWORD', 'Cristobal123');
define('DB_HOST', 'wordpressdbev3-instance-1.cp9fc77m67kj.us-east-1.rds.amazonaws.com');
define('DB_CHARSET', 'utf8mb4');
define('DB_COLLATE', '');

$table_prefix = 'wp_';

define('AUTH_KEY',         'Cristobal123');
define('SECURE_AUTH_KEY',  'Cristobal123');
define('LOGGED_IN_KEY',    'Cristobal123');
define('NONCE_KEY',        'Cristobal123');
define('AUTH_SALT',        'Cristobal123');
define('SECURE_AUTH_SALT', 'Cristobal123');
define('LOGGED_IN_SALT',   'Cristobal123');
define('NONCE_SALT',       'Cristobal123');

define('WP_DEBUG', false);

if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
