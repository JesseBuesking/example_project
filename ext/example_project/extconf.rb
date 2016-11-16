require 'mkmf'

globs = [".", "fast_numerizer"].map do |directory|
  File.join(File.dirname(__FILE__), directory)
end.join(",")

$objs = Dir.glob("{#{globs}}/*.c").map do |file|
  File.join(File.dirname(file), "#{File.basename(file, ".c")}.o")
end

#LIBDIR = CONFIG['libdir']
#INCLUDEDIR = CONFIG['includedir']

HEADER_DIRS = [
  ## First search /opt/local for macports
  #'/opt/local/include',

  ## Then search /usr/local for people that installed from source
  #'/usr/local/include',

  ## Check the ruby install locations
  #INCLUDEDIR,

  ## Finally fall back to /usr
  #'/usr/include',
]

LIB_DIRS = [
  ## First search /opt/local for macports
  #'/opt/local/lib',

  ## Then search /usr/local for people that installed from source
  #'/usr/local/lib',

  ## Check the ruby install locations
  #LIBDIR,

  ## Finally fall back to /usr
  #'/usr/lib',
]

dir_config('example_project', HEADER_DIRS, LIB_DIRS)

unless find_header('fast_numerizer/fast_numerizer.h')
  abort 'fast_numerizer is missing. please install fast_numerizer'
end

#unless find_library('example_project', 'example_project')
  #abort 'example_project is missing. please install example_project'
#end

#$CFLAGS = ' -shared -fPIC '
$CFLAGS = ' -g '
#$CFLAGS << ' -g -std=c99 -pedantic -O3 -shared -Wl,-soname -fPIC '
#$CFLAGS << ' -std=c99 -pedantic -O2 '

create_makefile('example_project/example_project')
