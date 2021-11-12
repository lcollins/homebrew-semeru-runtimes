cask "semeru16-jre-open" do
  version "16.0.2+7,openj9-0.27.0"
  sha256 "7667c41f2b88740f500396da5fa84682f915295a0972bf7b520e45529489610a"

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