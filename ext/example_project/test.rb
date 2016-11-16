require 'numerizer'
require './example_project'
require 'benchmark/ips'
#require 'ruby-prof'
require 'memory_profiler'

#RubyProf.measure_mode = RubyProf::MEMORY

Benchmark.ips do |x|
  x.config(:time => 1, :warmup => 1)

  x.report("numerizer", "Numerizer.numerize('two hundred')")
  #x.report("fast numerizer", "FastNumerizer.numerize('two hundred')")
  x.report("fast numerizer", "ExampleProject.c_code_function()")

  x.compare!
end


n = 1000

#GC.start # Start a full garbage collection
#s = GC.stat # Take a snapshot of the gc status

#for i in 0..n
  #Numerizer.numerize('two hundred')
#end

## Take the current heap usage and apply the percentage of promotion to long term memory
#puts "Numerizer #{(GC.stat(:heap_live_slots) * (100.0 * s[:old_objects] / s[:heap_live_slots] / 100)).round(2)}"

#GC.start # Start a full garbage collection
#s = GC.stat # Take a snapshot of the gc status

#for i in 0..n
  #FastNumerizer.numerize('two hundred')
#end

## Take the current heap usage and apply the percentage of promotion to long term memory
#puts "FastNumerizer #{(GC.stat(:heap_live_slots) * (100.0 * s[:old_objects] / s[:heap_live_slots] / 100)).round(2)}"

#RubyProf.start
#FastNumerizer.numerize('two hundred')
#result = RubyProf.stop
#printer = RubyProf::FlatPrinter.new(result)
#printer.print(STDOUT)

#RubyProf.start
#Numerizer.numerize('two hundred')
#result = RubyProf.stop
#printer = RubyProf::FlatPrinter.new(result)
#printer.print(STDOUT)

#RubyProf.start
#FastNumerizer.numerize('two hundred')
#result = RubyProf.stop
#printer = RubyProf::FlatPrinter.new(result)
#printer.print(STDOUT)

n = 10
#report = MemoryProfiler.report do
    #for i in 0..n
        #Numerizer.numerize('two hundred')
    #end
#end
#report.pretty_print

#report = MemoryProfiler.report do
    #for i in 0..n
        #FastNumerizer.numerize('two hundred')
    #end
#end
#report.pretty_print
#
#for i in 0..n
    #Numerizer.numerize('two hundred')
#end

