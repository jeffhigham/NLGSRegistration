/*
 * TCLink PHP Module
 *
 * TCLink Copyright (c) 2010 TrustCommerce.
 * http://www.trustcommerce.com
 * techsupport@trustcommerce.com
 * (949) 387-3747
 *
 * PHP Port Copyright (c) 2000
 * Andrew Barnett <andrew@dataclarity.com>
 * 2000-11-21
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "php.h"
#include "php_config.h"

#if HAVE_CONFIG_H
#include "config.h"
#endif

#include "php_tclink.h"

#if HAVE_TCLINK

zend_function_entry php_tclink_functions[] = {
	PHP_FE(tclink_send, NULL)
	PHP_FE(tclink_getversion, NULL)
	{NULL, NULL, NULL}
};

zend_module_entry php_tclink_module_entry = {
#ifdef STANDARD_MODULE_HEADER
	STANDARD_MODULE_HEADER,
#endif
	"tclink", 
	php_tclink_functions, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	PHP_MINFO(tclink), 
	NO_VERSION_YET,
#if PHP_API_VERSION < 20090626
	STANDARD_MODULE_PROPERTIES
#else
	0,
	NULL,
	NULL,
	NULL,
	NULL,
	STANDARD_MODULE_PROPERTIES_EX
#endif
};

#define PHP_TCLINK_DEFAULT_BUFFER_SIZE 8196

#ifdef COMPILE_DL_TCLINK
ZEND_GET_MODULE(php_tclink)
#endif

PHP_MINFO_FUNCTION(tclink)
{
	char *tmp = (char *)malloc(1024);
	php_info_print_table_start();
	if(tmp == NULL) {
		php_info_print_table_row(2, "TCLink PHP Module", "enabled");
	} else {
		php_info_print_table_row(2, "TCLink PHP Module", TCLinkGetVersion(tmp));
		free(tmp);
	}
	php_info_print_table_end();
}

/* {{{ proto void tclink_send(array params)
   Send the transaction in for processing. */
PHP_FUNCTION(tclink_send)
{
	zval **params, **zvalue;
	HashTable *hash;
	char *key, *value, *next_key;

	TCLinkHandle h;
	char buf[4096];

	/* check parameters */
	if((ZEND_NUM_ARGS() != 1) ||
	   (zend_get_parameters_ex(1, &params) == FAILURE)) {
		WRONG_PARAM_COUNT;
	}

	convert_to_array_ex(params);

	h = TCLinkCreate();

	/* grab the hash and stuff each parameter set into TCLink */
	hash = HASH_OF(*params);
	zend_hash_internal_pointer_reset(hash);
	while (zend_hash_get_current_data(hash, (void **)&zvalue) == SUCCESS)
	{
		/* The Zend API added an extra parameter between 4.04 (sometime in
		 * 1999) and 4.06 (in early 2001).  Assume that anything prior to
		 * 1/1/2001 is the older version. */
#if PHP_API_VERSION < 20000101
		zend_hash_get_current_key(hash, &key, NULL);
#else
		zend_hash_get_current_key(hash, &key, NULL, 0);
#endif
		convert_to_string_ex(zvalue);
		value = Z_STRVAL_PP(zvalue);
		TCLinkPushParam(h, key, value);
		zend_hash_move_forward(hash);
	}

	/* send the transaction */
	TCLinkSend(h);

	/* pull out the parameters and put them in a hash */
	TCLinkGetEntireResponse(h, buf, sizeof(buf));

	array_init(return_value);

	key = value = buf;
	while (key && (value = strchr(key, '=')))
	{
		*value++ = 0;
		next_key = strchr(value, '\n');
		if (next_key) *next_key++ = 0;

		add_assoc_string(return_value, key, value, 1);

		key = next_key;
	}

	TCLinkDestroy(h);

	/* return_value is returned automatically, we need not explictly call a
	   return macro */
}
/* }}} */

/* {{{ proto string tclink_getversion()
       returns the API version information */
PHP_FUNCTION(tclink_getversion)
{
	char version[1024];

	TCLinkGetVersion(version);
	RETURN_STRING(version, 1);
}
/* }}} */

#endif
