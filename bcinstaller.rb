

class Installer

  def list_java_versions
    # to do
    puts "Listando java versions..."
  end

  def print_java_versions
    list = list_java_versions()
    puts "1 - Java 1.4"
    puts "2 - Java 1.5"
    puts "3 - Java 1.6"
    puts "4 - Java 1.7"
  end

  def choose_java_version
    print_java_versions()
    choosed_version = gets.chomp
  end

  def download_bc
    # to do
    puts "Downloading bcprovider"
  end

  def install_bc
    puts "Decompressing bcprovider"
    puts "Copying files"
    puts "Writing at java.security"
    puts "Done!"
  end

  def run
    version = choose_java_version()
    download_bc()
    install_bc()
  end

end

if __FILE__ == $0
  installer = Installer.new
  installer.run
end






