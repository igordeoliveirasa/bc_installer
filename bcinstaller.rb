require 'open-uri'

class Installer

  def initialize
    @bc_urls = {}
    @bc_urls["1.4"] = "http://www.bouncycastle.org/download/bcprov-jdk14-149.jar"
    @bc_urls["1.5"] = "http://www.bouncycastle.org/download/bcprov-jdk15on-149.jar"
    @bc_urls["1.6"] = "http://www.bouncycastle.org/download/bcprov-jdk15on-149.jar"
    @bc_urls["1.7"] = "http://www.bouncycastle.org/download/bcprov-jdk15on-149.jar"
    @current_dir = Dir.getwd
  end

  def list_java_versions
    ret = []
    puts "Listando java versions..."
    default_java_dir_paths = ['/Library/Java/JavaVirtualMachines', '/System/Library/Java/JavaVirtualMachines']
    default_java_dir_paths.each do |dir|
      Dir.chdir(dir)
      java_dirs = Dir.glob("*")
      Dir.chdir(@current_dir)
      java_dirs.each do |java_dir|
        ret.push(/(?<major>\d+).(?<minor>\d+)/.match(java_dir))
      end
    end
    ret
  end

  def print_java_versions(java_versions)
    java_versions.each_with_index do |version, i|
      puts "#{i+1} - #{version}"
    end
  end

  def choose_java_version
    puts "Please, choose a version:"
    java_versions = list_java_versions()
    print_java_versions(java_versions)
    choosed_version = gets.chomp
    java_versions[choosed_version.to_i-1]
  end

  def download_bc(version)
    # to do
    puts "Downloading bcprovider for java #{version}..." 
    url = @bc_urls[version.to_s]
    file_name = "bc_provider_#{version}.jar"
    open(file_name, 'wb') do |file|
      file << open(url).read
    end
    file_name
  end

  def install_bc(fp)
    puts "Copying files"
    puts "Writing at java.security"
    puts "Done!"
  end

  def run
    version = choose_java_version()
    fp = download_bc(version)
    install_bc(fp)
  end

end

if __FILE__ == $0
  installer = Installer.new
  installer.run
end
