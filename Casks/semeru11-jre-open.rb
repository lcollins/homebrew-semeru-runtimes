cask "semeru11-jre-open" do
  version "11.0.13+8,openj9-0.29.0"
  sha256 "7e78d8cf714becdb5401afbd90235ae96c5b5d0d9b399e03ad3a1aa79a64ef1d"

  url "https://github.com/ibmruntimes/semeru#{version.major}-binaries/releases/download/jdk-#{version.before_comma}_#{version.after_comma}/ibm-semeru-open-jre_x64_mac_#{version.before_comma.tr("+", "_")}_#{version.after_comma}.pkg",
      verified: "github.com/ibmruntimes/semeru#{version.major}-binaries/"
  name "IBM Semeru Runtime (JRE) Open Edition"
  desc "Production-ready JRE with the OpenJDK class libraries and the Eclipse OpenJ9 JVM"
  homepage "https://developer.ibm.com/languages/java/semeru-runtimes"

  livecheck do
    url "https://developer.ibm.com/languages/java/semeru-runtimes/downloads"
    regex(/["'][^"']*ibm-semeru-open-jre_x64_mac[._-](\d+(?:[._]\d+)+)[._-](.+)\.pkg["']/i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| "#{match[0].tr("_", "+")},#{match[1]}" }
    end
  end

  pkg "ibm-semeru-open-jre_x64_mac_#{version.before_comma.tr("+", "_")}_#{version.after_comma}.pkg"

  uninstall pkgutil: "net.ibm-semeru-open.#{version.major}.jre"
end