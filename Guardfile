# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec', cli: "--format documentation --color", all_after_pass: false do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^devices/(.+)\.rb$})     { |m| "spec/devices/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end
