desc 'Build docker image'
task :build do
 system "docker build -t tog1s/greenline:0.1 ."
end