require 'rake/clean'
CLEAN.include "**/*.hi"
CLEAN.include "**/*.o"

Dir["*.hs"].each do |filename|
  name = File.basename(filename, ".hs")
  CLEAN.include name

  desc "run #{name}"
  file name => [filename] do
    sh "ghc #{filename}"
  end

  task "run:#{name}" => name do
    sh "./#{name}"
  end
end
