<?php
	$settings = array(


		###### ADMIN ######
		'admin' => array(
			'max_upload_size' => '5242880',
		),
		########


		###### SYMPHONY ######
		'symphony' => array(
			'pagination_maximum_rows' => '20',
			'lang' => 'en',
			'pages_table_nest_children' => 'no',
			'version' => '2.3.2',
			'cookie_prefix' => 'sym-',
			'session_gc_divisor' => '10',
		),
		########


		###### LOG ######
		'log' => array(
			'archive' => '1',
			'maxsize' => '102400',
		),
		########


		###### DATABASE ######
		'database' => array(
			'host' => 'mysql.fetimo.com',
			'port' => '3306',
			'user' => 'fetimocom1',
			'password' => 'W&41@1-iS{F@m2}',
			'db' => 'fetimo_symphony',
			'tbl_prefix' => 'blog_',
		),
		########


		###### PUBLIC ######
		'public' => array(
			'display_event_xml_in_source' => 'no',
		),
		########


		###### GENERAL ######
		'general' => array(
			'sitename' => 'Fetimo',
		),
		########


		###### FILE ######
		'file' => array(
			'write_mode' => '0644',
		),
		########


		###### DIRECTORY ######
		'directory' => array(
			'write_mode' => '0755',
		),
		########


		###### REGION ######
		'region' => array(
			'time_format' => 'g:i a',
			'date_format' => 'm/d/Y',
			'datetime_separator' => ' ',
			'timezone' => 'Europe/London',
		),
		########


		###### IMAGE ######
		'image' => array(
			'cache' => '1',
			'quality' => '90',
		),
		########


		###### SORTING ######
		'sorting' => array(
			'section_articles_sortby' => '4',
			'section_articles_order' => 'desc',
		),
		########


		###### SEARCH_INDEX ######
		'search_index' => array(
			're-index-per-page' => '20',
			're-index-refresh-rate' => '0.5',
			'get-param-prefix' => null,
			'get-param-keywords' => 'keywords',
			'get-param-per-page' => 'per-page',
			'get-param-sort' => 'sort',
			'get-param-direction' => 'direction',
			'get-param-sections' => 'sections',
			'get-param-page' => 'page',
			'default-sections' => 'articles,comments',
			'default-per-page' => '20',
			'default-sort' => 'score',
			'default-direction' => 'desc',
			'excerpt-length' => '120',
			'min-word-length' => '3',
			'max-word-length' => '30',
			'stem-words' => 'yes',
			'build-entries' => 'no',
			'mode' => 'like',
			'log-keywords' => 'yes',
			'indexes' => 'a:2:{i:1;a:3:{s:6:\"fields\";a:5:{i:0;s:5:\"title\";i:1;s:4:\"body\";i:2;s:10:\"categories\";i:3;s:4:\"date\";i:4;s:5:\"image\";}s:9:\"weighting\";s:1:\"1\";s:7:\"filters\";a:0:{}}i:2;a:3:{s:6:\"fields\";a:4:{i:0;s:4:\"name\";i:1;s:7:\"comment\";i:2;s:4:\"date\";i:3;s:12:\"commented-on\";}s:9:\"weighting\";s:1:\"2\";s:7:\"filters\";a:0:{}}}',
		),
		########


		###### EMAIL ######
		'email' => array(
			'default_gateway' => 'sendmail',
		),
		########


		###### EMAIL_SENDMAIL ######
		'email_sendmail' => array(
			'from_name' => null,
			'from_address' => null,
		),
		########


		###### EMAIL_SMTP ######
		'email_smtp' => array(
			'from_name' => null,
			'from_address' => null,
			'host' => '127.0.0.1',
			'port' => '25',
			'secure' => 'no',
			'auth' => '0',
			'username' => 'tim',
			'password' => '5nAi1518!!@',
		),
		########


		###### AKISMET ######
		'akismet' => array(
			'api-key' => '3fe0b2043d54',
		),
		########


		###### CACHELITE ######
		'cachelite' => array(
			'lifetime' => '604800',
			'show-comments' => 'no',
			'backend-delegates' => 'yes',
		),
		########


		###### MAINTENANCE_MODE ######
		'maintenance_mode' => array(
			'enabled' => 'no',
		),
		########
	);
