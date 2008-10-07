#
# Copyright (c) 2008 Adrian Schroeter, Novell Inc.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program (see the file COPYING); if not, write to the
# Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA
#
################################################################
#
# XML templates for the BuildService. See XML/Structured.
#

package BSKiwiXML;

use strict;

# 
# an explained example entry of this file
#
#our $pack = [             creates <package name="" project=""> space
#    'package' =>          
#	'name',
#	'project',
#	[],                before the [] all strings become attributes to <package>
#       'title',           from here on all strings become children like <title> </title>
#       'description',
#       [[ 'person' =>     creates <person> children, the [[ ]] syntax allows any number of them including zero
#           'role',        again role and userid attributes, both are required
#           'userid',    
#       ]],                this block describes a <person role="defeatist" userid="statler" /> construct
# 	@flags,            copies in the block of possible flag definitions
#       [ $repo ],         refers to the repository construct and allows again any number of them (0-X)
#];                        closes the <package> child with </package>

our $kiwidesc = [
    'image' =>
        'name',
        'schemeversion',
        [],
        [ 'description' => 
              'type',
              [],
              'author',
              'contact',
              'specification',
        ],
        [ 'preferences' =>
          [[ 'type' =>
              'bootprofile',
              'boot',
              'flags',
              'filesystem',
              'format',
              'primary',
              '_content',
          ]],
          'version',
          [ 'size' =>
              'unit',
              '_content',
          ],
          'compressed',
          'packagemanager',
          'rpm-check-signatures',
          'rpm-force',
          'locale',
          'keytable',
        ],
        [ 'instsource' =>
          [],
          [ 'architectures' => 
            [[ 'arch' =>
               'id',
               'name',
               'fallback',
            ]],
            [[ 'requiredarch' =>
               'ref',
            ]],
          ],
          [ 'productoptions' => 
            [[ 'productvar' =>
               'name',
               '_content'
            ]],
            [[ 'productinfo' =>
               'name',
               '_content'
            ]],
	    [[ 'productoption' =>
               'name',
               '_content'
            ]]
          ],
          [[ 'instrepo' =>
             'name',
             'priority',
             'username',
             'pwd',
             'local',
             [],
	     [ 'source' => 'path' ],
          ]],
          [ 'metadata' =>
	     [[ 'repopackage' =>
                'name',
                'medium',
                'removearch',
                'onlyarch',
             ]],
          ],
          [[ 'repopackages' =>
	     [[ 'repopackage' =>
                'name',
                'addarch', 'arch', 'baselibs_arch', 
                'forcearch','removearch', 'onlyarch', 'source', 'script', 'medium', 'priority'
             ]],
          ]],
        ],
        [[ 'users' =>
             'group',
             [],
             [[ 'user' => 'name', 'pwd', 'home', 'realname' ]],
        ]],
        [ 'profiles' =>
             [[ 'profile' => 'name', 'description' ]],
        ],
        [[ 'drivers' =>
              'type',
             [],
             [[ 'file' => 'name' ]],
        ]],
	[[ 'repository' =>
	       'type',
	       'status',
               [],
	       [ 'source' => 'path' ],
        ]],
        [[ 'deploy' =>
               'server',
               'blocksize',
               [],
               [[ 'partitions' =>
                    'device',
                    [],
                    [[ 'partition' =>
                       'type',
                       'number',
                       'size',
                       'mountpoint',
                       'target',
                    ]],
               ]],
               [[ 'configuration' =>
                    'source',
                    'dest',
               ]],
          ]],
	[[ 'packages' =>
               'type',
               'profiles',
               'patternType',
               'patternPackageType',
               'memory',
               'disk',
               [],
	       [['package' =>
                     'name',
                     'arch',
               ]],
	       [['opensusePattern' =>
                     'name',
                     'arch',
               ]],
	       [['ignore' =>
                     'name',
                     'arch',
               ]],
        ]],
        [ 'vmwareconfig' =>
               'memory',
               'guestOS',
               'HWversion',
               [],
               [[ 'vmwaredisk' => 'controller', 'id' ]],
               [[ 'vmwarenic' => 'driver', 'interface', 'mode' ]],
        ],
        [ 'xenconfig' =>
               'memory',
               [],
               [[ 'xendisk' => 'device' ]],
        ],
];

1;
