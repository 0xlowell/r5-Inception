
// ** Database settings - You can get this info from your web host ** //


/** The name of the database for WordPress */
//define( 'DB_NAME', getenv(WORDPRESS_DB_NAME) );

//define( 'WORDPRESS_DB_NAME', getenv('WORDPRESS_DB_NAME') );

define( 'WORDPRESS_DB_NAME', 'mariadb' );

//define( 'DB_NAME', getenv('WORDPRESS_DB_NAME') );

/** Database username */
//define( 'DB_USER', 'user_wp' );

//define( 'WORDPRESS_DB_USER', getenv('WORDPRESS_DB_USER') );

define( 'WORDPRESS_DB_USER', 'user' );

define( 'WORDPRESS_DB_USER', 'user' );

//define( 'DB_USER', getenv('WORDPRESS_DB_USER') );

/** Database password */
//define( 'DB_PASSWORD', 'ok' );

//define( 'WORDPRESS_DB_PASSWORD', getenv('WORDPRESS_DB_PASSWORD') );

define( 'WORDPRESS_DB_PASSWORD', 'ok' );

//define( 'DB_PASSWORD', getenv('WORDPRESS_DB_PASSWORD') );

/** Database hostname */
//define( 'DB_HOST', 'db' );

//define( 'WORDPRESS_DB_HOST', getenv('WORDPRESS_DB_HOST') );

define( 'WORDPRESS_DB_HOST', 'mariadb' );

//define( 'DB_HOST', getenv('WORDPRESS_DB_HOST') );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );



// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv_docker('WORDPRESS_DB_NAME', 'mariadb') );

/** Database username */
define( 'DB_USER', getenv_docker('WORDPRESS_DB_USER', 'user') );

/** Database password */
define( 'DB_PASSWORD', getenv_docker('WORDPRESS_DB_PASSWORD', 'ok') );

/** Database hostname */
define( 'DB_HOST', getenv_docker('WORDPRESS_DB_HOST', 'mariadb') );

/** Database charset to use in creating database tables. */
//define( 'DB_CHARSET', getenv_docker('WORDPRESS_DB_CHARSET', 'utf8') );

/** The database collate type. Don't change this if in doubt. */
//define( 'DB_COLLATE', getenv_docker('WORDPRESS_DB_COLLATE', '') );
