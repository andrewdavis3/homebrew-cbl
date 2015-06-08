require 'formula'

class Vardict < Formula
  homepage "https://github.com/AstraZeneca-NGS/VarDict"
  version "2015-06-04"
  url "https://github.com/AstraZeneca-NGS/VarDict/archive/3fe52284f.tar.gz"
  sha1 "f1ed0fe0ae11f6d9a60720e64fd1c9c0ab188ba4"

  def install
    prefix.install Dir['*']
    bin.install_symlink prefix / 'vardict.pl' => 'vardict'
    bin.install_symlink(['vardict.pl', 'testsomatic.R', 'teststrandbias.R',
                         'var2vcf_valid.pl', 'var2vcf_paired.pl'].map do
                          |x| prefix / x
    end)
  end

  test do
    system 'vardict -h'
  end
end
