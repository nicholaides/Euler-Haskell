require 'rake/clean'
CLEAN.include "**/*.hi"
CLEAN.include "**/*.o"
CLEAN.include Dir["**/p*.hs"].map{|f| File.basename f }

Dir["*.hs"].each do |filename|
  name = File.basename(filename, ".hs")
  desc "run #{name}"
  file name => [filename] do
    sh "ghc #{filename}"
  end

  task "run:#{name}" => name do
    sh "./#{name}"
  end
end
