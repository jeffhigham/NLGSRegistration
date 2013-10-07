/*
 * TCLink PHP Module
 *
 * TCLink Copyright (c) 2002 TrustCommerce.
 * http://www.trustcommerce.com
 * developer@trustcommerce.com
 * (626) 744-7700
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

#ifndef PHP_TCLINK_H
#define PHP_TCLINK_H

#if HAVE_TCLINK

#include <tclink.h>

extern zend_module_entry php_tclink_module_entry;
#define tclink_module_ptr &php_tclink_module_entry

PHP_MINFO_FUNCTION(tclink);

PHP_FUNCTION(tclink_send);
PHP_FUNCTION(tclink_getversion);

#else
#define tclink_module_ptr NULL
#endif /* HAVE_TCLINK */

#define phpext_tclink_ptr tclink_module_ptr

#endif /* PHP_TCLINK_H */
