



class Installer

  def list_java_versions
    ret = []
    puts "Listando java versions..."
    default_java_dir_paths = ['/Library/Java/JavaVirtualMachines', '/System/Library/Java/JavaVirtualMachines']
    default_java_dir_paths.each do |dir|
      Dir.chdir(dir)
      java_dirs = Dir.glob("*")
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
    puts "Downloading bcprovider for java #{version}" 
  end

  def install_bc
    puts "Decompressing bcprovider"
    puts "Copying files"
    puts "Writing at java.security"
    puts "Done!"
  end

  def run
    version = choose_java_version()
    download_bc(version)
    install_bc()
  end

end

if __FILE__ == $0
  installer = Installer.new
  installer.run
end






