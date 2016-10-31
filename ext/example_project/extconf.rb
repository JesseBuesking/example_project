require 'mkmf'

LIBDIR = CONFIG['libdir']
INCLUDEDIR = CONFIG['includedir']

HEADER_DIRS = [
  # First search /opt/local for macports
  '/opt/local/include',

  # Then search /usr/local for people that installed from source
  '/usr/local/include',

  # Check the ruby install locations
  INCLUDEDIR,

  # Finally fall back to /usr
  '/usr/include',
]

LIB_DIRS = [
  # First search /opt/local for macports
  '/opt/local/lib',

  # Then search /usr/local for people that installed from source
  '/usr/local/lib',

  # Check the ruby install locations
  LIBDIR,

  # Finally fall back to /usr
  '/usr/lib',
]

dir_config('example_project', HEADER_DIRS, LIB_DIRS)

unless find_header('c_example_project/c_example_project.h')
  abort 'c_example_project is missing. please install c_example_project'
end

#unless find_library('example_project', 'example_project')
  #abort 'example_project is missing. please install example_project'
#end

create_makefile('example_project/example_project')
