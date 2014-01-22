require 'bundler/setup'

gemspec = eval(File.read("nashville.gemspec"))

task :build => "#{gemspec.full_name}.gem"

file "#{gemspec.full_name}.gem" => gemspec.files + ["nashville.gemspec"] do
  system "gem build nashville.gemspec"
end
