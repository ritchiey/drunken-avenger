namespace :test do

  desc "Test services source"
  Rake::TestTask.new(:services) do |t|
    t.libs << "test"
    t.pattern = 'test/services/**/*_test.rb'
    t.verbose = true
  end

  services_task = Rake::Task["test:services"]
  test_task = Rake::Task[:test]
  test_task.enhance { services_task.invoke }
end
